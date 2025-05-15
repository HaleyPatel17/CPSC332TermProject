<?php

  include_once('db_config.php'); // Call db_connect() to connect to the database
  
  // Execute SQL without processing output. Call on it's own to run SQL statements that don't return data, such as DELETE, INSERT, UPDATE, etc.
  function execute_sql($sql) {
    $conn = db_connect();
    // check if connection is successful
    if($conn -> connect_error){
      die("Connection Failed : ". $conn -> connect_error);
      return false;      
    }

    return $conn->query($sql); 
  }  

  // Execute INSERT statement that returns multiple rows
  function execute_sql_select($sql) {     
    $result = execute_sql($sql);

    $data = [];
    while ($row = $result->fetch_assoc()) {
      $data[] = $row;
    }
    return $data;
  }  

  // Execute INSERT statement that returns a single row
  function execute_sql_select_single_row($sql) {
    $data = execute_sql_select($sql);
    return $data[0];
  }  

  function get_professor_classes($ssn) {
//    $sql =  "SELECT * FROM Professor WHERE ssn='$ssn';";   

    $sql = "SELECT p.ProfessorID, p.name, p.ssn, p.title, s.classroom, s.meetingDays, s.startTime,s.endTime
            FROM Professor AS p  left outer JOIN Section AS s on p.professorID=s.ProfessorID  
            WHERE p.SSN = '$ssn';";

    
//     $data = execute_sql_select_single_row($sql);
    $data = execute_sql_select($sql);

    $html = file_get_contents('ajax_html/professor_classes_header.htm');    
   // if (!is_array($data[0])) {
    if (!array_key_exists(0,$data) || !is_array($data[0])) {        
      $html.= "Professor not found for SSN = '$ssn'"; 
    } else {      
      $html.= file_get_contents('ajax_html/professor_classes_table_top.htm');
      
      foreach($data AS $row) {
        $html.= '<tr>'
               .'  <td>'.$row['title'].'</td>'
               .'  <td>'.$row['classroom'].'</td>'
               .'  <td>'.$row['meetingDays'].'</td>'           
               .'  <td>'.$row['startTime'].'</td>'  
               .'  <td>'.$row['endTime'].'</td>'               
               .'</tr>';    
      }
             
      $html.= file_get_contents('ajax_html/professor_classes_table_bottom.htm');
    }

    $ret_val['html'] = $html;
    return $ret_val;
  }  
  
  
 
  function get_professor_grades($courseID,$sectionID) {
    // Test for $courseID,$sectionID not a number

    $valid_input = (is_numeric($courseID) && is_numeric($sectionID));

    if ($valid_input) {
      $sql = "SELECT count(e.studentID) Count, e.grade
              FROM Section AS s LEFT JOIN Enrollment AS e ON s.sectionID=e.sectionID
              WHERE s.courseID=$courseID AND s.sectionID=$sectionID
              GROUP BY e.grade"; 
      $data = execute_sql_select($sql);
    }
    
    $html = file_get_contents('ajax_html/professor_grades_header.htm');     
    if (!$valid_input || !array_key_exists(0,$data) || !is_array($data[0])) {          
      $html.= "Grades not found for course ID = '$courseID' and section ID = '$sectionID'"; 
    } else {      
      $html.= file_get_contents('ajax_html/professor_grades_table_top.htm');
      
      foreach($data AS $row) {
        $html.= '<tr>'
               .'  <td>'.$row['Count'].'</td>'
               .'  <td>'.$row['grade'].'</td>'             
               .'</tr>';    
      }
      
      $html.= file_get_contents('ajax_html/professor_grades_table_bottom.htm');
    }

    $ret_val['html'] = $html;
    return $ret_val;
  }  


  function get_student_classes($courseID) {
    $sql =  "SELECT s.courseID, s.sectionID, s.classroom, s.meetingDays, 
                    s.startTime, s.endTime, (select count(studentID)
             FROM Enrollment WHERE sectionID=s.sectionID 
             GROUP BY sectionID) numStudentsEnrolled
             FROM Section as s
             WHERE s.courseID='$courseID';";    
    $data = execute_sql_select($sql);    

    $html = file_get_contents('ajax_html/student_classes_header.htm');    
  //  if (!is_array($data[0])) {   
    if (!array_key_exists(0,$data) || !is_array($data[0])) {      
      $html.= "Student classes not found for course ID = '$courseID'"; 
    } else {         
      $html.= file_get_contents('ajax_html/student_classes_table_top.htm');
      foreach($data AS $row) {      
        $html.= '<tr>'
               .'  <td>'.$row['courseID'].'</td>'
               .'  <td>'.$row['sectionID'].'</td>'
               .'  <td>'.$row['classroom'].'</td>'           
               .'  <td>'.$row['meetingDays'].'</td>'  
               .'  <td>'.$row['startTime'].'</td>' 
               .'  <td>'.$row['endTime'].'</td>' 
               .'  <td>'.$row['numStudentsEnrolled'].'</td>'              
               .'</tr>';             
      }               
      $html.= file_get_contents('ajax_html/student_classes_table_bottom.htm');
    }
    $ret_val['html'] = $html;
    return $ret_val;
  }  


  function get_student_grades($studentID) {
    $valid_input = is_numeric($studentID);

    if ($valid_input) {
      $sql = "SELECT c.title, sr.studentID, s.courseID, e.grade
              FROM Course AS c, Section AS s 
              INNER JOIN Enrollment AS e ON s.sectionID=e.sectionID
              INNER JOIN StudentRecords AS sr ON sr.studentID=e.studentID
              WHERE sr.studentID=$studentID;";    
      $data = execute_sql_select($sql);  
    }  

    $html = file_get_contents('ajax_html/student_grades_header.htm');     
    if (!$valid_input || !array_key_exists(0,$data) || !is_array($data[0])) {       
      $html.= "Student grades not found for student ID='$studentID'"; 
    } else {      
      $html.= file_get_contents('ajax_html/student_grades_table_top.htm');
      foreach($data AS $row) {      
        $html.= '<tr>'
               .'  <td>'.$row['studentID'].'</td>'
               .'  <td>'.$row['courseID'].'</td>'
               .'  <td>'.$row['grade'].'</td>'                   
               .'</tr>';             
      }               
      $html.= file_get_contents('ajax_html/student_grades_table_bottom.htm');
    }

    $ret_val['html'] = $html;
    return $ret_val;
  }  


// ajax.php?type=student_grades&student_id=' + student_id; 
// https://rondvorak.com/students/stephen_a/university/ajax.php?type=student_grades&student_id=' + student_id; 

  if      ($_GET['type'] == 'professor_classes') { $ret_val = get_professor_classes($_GET['ssn']); }
  else if ($_GET['type'] == 'professor_grades')  { $ret_val = get_professor_grades($_GET['courseID'],$_GET['sectionID']); }   
  else if ($_GET['type'] == 'student_classes')   { $ret_val = get_student_classes($_GET['courseID']); }  
  else if ($_GET['type'] == 'student_grades')    { $ret_val = get_student_grades($_GET['studentID']); }    
  
  print json_encode($ret_val);



?>