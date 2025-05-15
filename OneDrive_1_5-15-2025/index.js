
function getProfessorClasses() {
  const ssn = document.getElementById('professor_ssn').value;
  target_url = 'ajax.php?type=professor_classes&ssn=' + ssn; 
  synergy_ajax_send(target_url,'getProfessorClassesResponse','get');
}
function getProfessorClassesResponse(json_ret_val) {  
  const details_element = document.getElementById('details');
  details_element.innerHTML = json_ret_val.html;    
} 

function getProfessorGrades() {
  const courseID = document.getElementById('professor_course_id').value;
  const sectionID = document.getElementById('professor_section_id').value;  
  target_url = 'ajax.php?type=professor_grades&courseID=' + courseID + '&sectionID=' + sectionID; 
  synergy_ajax_send(target_url,'getProfessorGradesResponse','get');
}
function getProfessorGradesResponse(json_ret_val) {  
  const details_element = document.getElementById('details');
  details_element.innerHTML = json_ret_val.html;    
} 

function getStudentClasses() {
  const courseID = document.getElementById('student_course_id').value;
  target_url = 'ajax.php?type=student_classes&courseID=' + courseID; 
  synergy_ajax_send(target_url,'getStudentClassesResponse','get');
}
function getStudentClassesResponse(json_ret_val) {  
  const details_element = document.getElementById('details');
  details_element.innerHTML = json_ret_val.html;    
} 

function getStudentGrades() {
  const studentID = document.getElementById('student_student_id').value;
  target_url = 'ajax.php?type=student_grades&studentID=' + studentID; 
  synergy_ajax_send(target_url,'getStudentGradesResponse','get');
}
function getStudentGradesResponse(json_ret_val) {  
  const details_element = document.getElementById('details');
  details_element.innerHTML = json_ret_val.html;    
} 



















