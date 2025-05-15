<!DOCTYPE html>
	<html lang="en">
		<head>
      <?php $refresh=rand(); ?>    
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta name="description" content="Unviversity Information">
			<meta name="keywords" content="student, professor, classes, university">
			<link rel="stylesheet" href="index.css">
			<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
			<title>University Data Repository</title> 
      <script src='https://code.jquery.com/jquery-1.12.4.js'></script>
			<script src='synergy_ajax.js' type='text/javascript'></script>
			<script src="index.js?refresh=<?php print($refresh) ?>"></script>
		</head>
		<body id="index">

			<header>
				<h1>Welcome to our University Information Website</h1>
			</header>

			<main>
				<div class="left">
					<div class="menu">            
            <fieldset>
              <legend>Professors</legend>
              <h3>Classes</h3>
              <input type="text" id="professor_ssn" placeholder="Enter Professor SSN" value="515932084">
              <button onclick="getProfessorClasses()">Get Classes</button>
              <br><br><br>
              
              <h3>Grades</h3>
              <input type="text" id="professor_course_id" placeholder="Enter Course ID" value="300">
              <br/><br/>
              <input type="text" id="professor_section_id" placeholder="Enter Section ID" value="101">
              <button onclick="getProfessorGrades()">Get Grades</button>
              <br><br>
            </fieldset>
            <br><br>
            <fieldset>
              <legend>Students</legend>
              <div>        
                <h3>Classes</h3>
                <input type="text" id="student_course_id" placeholder="Enter Course ID" value="300">
                <button onclick="getStudentClasses()">Get Classes</button>
                <br><br><br>

                <h3>Grades</h3>
                <input type="text" id="student_student_id" placeholder="Enter Student ID" value="1001">
                <button onclick="getStudentGrades()">Get Grades</button>
                <br><br>
              </div>
            </fieldset>           
          </div>  
				</div>
				<div id="details" class="right"></div>
			</main>
		</body>
	</html>
