insert into Address (addressID, streetAddress, city, state, zipcode)  values 
(1,'123 Main Street Apt 24',  'NewYork', 'NY', '100034'),
(2, '1450 Hudson Terrace Apt 5B', 'New York', 'NY', '10024'),
(3, '57 Orchard Heights Blvd', 'Staten Island', 'NY', '10310'),
(4, '2109 Waverly Court', 'Queens', 'NY', '11375'),
(5, '880 Riverside Esplanade Apt 9E', 'Manhattan', 'NY', '10032'),
(6, '1347 Bayview Crescent', 'Bronx', 'NY', '10463'),
(7, '499 Empire Row', 'Brooklyn', 'NY', '11225'),
(8, '1020 Astoria Lane Apt 3C', 'Queens', 'NY', '11102'),
(9, '5412 Leftview Blvd Kingston Island', 'Belview', 'NJ', '32012'),
(10, '3221 Main Street', 'New Haven', 'NC', '12003'),
(11, '2115 Hammer Drive', 'Old Oak', 'MD', '52182'),
(12, '1183 Hither Lane', 'Horthon Creek', 'CA', '32231');

insert into Course (courseID, title, textBook, units) values
(300, 'Intro to Computers', 'Concepts of Programming', '3'),
(204, 'Intro to Philosophy', 'Socrates', '3'),
(221, 'Bio-Robotics', 'Nature or Machine', '4'),
(406, 'Embedded Systems', 'Circuits in Motion', '4');

insert into Professor (ProfessorID, SSN, name, addressID, areaCode, 
phoneNumber, gender, title, salaray, graduatedYear, subjectTeach) values
(1087, '421569328', 'Elaine Porter', 1, '212', '555-3874', 'F', 
    'Asso. Prof', 87500, 2008, 'Programming'),
(1129, 'B94627315', 'Kevin Rahman', 2, '718', '555-9012', 'M',
    'Asst. Prof', 76200, 2015, 'Philosophy'),
(1033, '515932084', 'Yuna Chang', 3, '646', '555-4488', 'F',
    'Full Prof', 115000, 2001, 'Ethics'),
(1190, '308476172', 'Miguel Ortega', 4, '347', '555-2930', 'M',
    'Lecturer', 62000, 2012, 'Political Philosophy');

insert into Section (sectionID, courseID, classRoom, numSeats,
    meetingDays, startTime, endTime, professorID) values
(101, 300, 'Room 1', 30, 'MWF', '09:00am', '10:00am', 1087),
(102, 204, 'Room 2', 25, 'TW', '11:15am', '12:45pm', 1190),
(103, 375, 'Room 3', 35, 'TF', '4:20pm', '5:10pm', 1129),
(104, 221, 'Room 4', 25, 'MWF', '8:30am', '10:00am', 1033),
(105, 342, 'Room 5', 30, 'TW', '09:00am', '10:00am', 1087),
(106, 223, 'Room 6', 25, 'TF', '4:15pm', '6:00pm', 1129);

insert into department(departmentID, name, areaCode, phoneNumber, location,
chairPersonID) values
(300, 'Computer Science', '234', '332-4223', 'Titan Hall', 1087),
(301, 'Philosophy', '224', '221-4432', 'Happy Center', 1129);

insert into studentRecords( studentId, firstName, lastName,
   addressID, areaCode, phoneNumber, majorDepartmentID) values
(1001, 'Maya', 'Thompson', 5, '212', '555-7891', 300),
(1002, 'Liam', 'Patel', 6, '347', '555-6672', 301),
(1003, 'Ramirez', 'Brooks', 7, '646', '555-9011', 300),
(1004, 'Zoey', 'Avant', 8, '929', '555-4422', 301),
(1005, 'Ethan', 'Chen', 9, '348', '923-7140', 300),
(1006, 'Isabel', 'Green', 10, '321', '811-2332', 301),
(1007, 'Oliver', 'Kim', 11, '718', '555-8842', 300),
(1008, 'Kayla', 'Ben', 12, '332', '353-8392', 301);

insert into Enrollment(enrollmentID, studentID, sectionID,
    grade) values
(300, 1001, 101, 'A'),
(301, 1001, 102, 'C'),
(302, 1001, 103, 'B'),
(303, 1002, 104, 'D'),
(304, 1002, 105, 'A'),
(305, 1002, 106, 'C'),
(306, 1003, 101, 'D'),
(307, 1003, 103, 'F'),
(308, 1003, 102, 'B'),
(309, 1004, 105, 'C'),
(311, 1004, 101, 'A'),
(312, 1004, 104, 'D'),
(313, 1005, 103, 'A'),
(314, 1005, 101, 'B'),
(315, 1005, 102, 'C');

insert into Enrollment(enrollmentID, studentID, sectionID,
    grade) values
(316, 1006, 104, 'B'),
(317, 1006, 103, 'B'),
(318, 1007, 102, 'D'),
(319, 1008, 105, 'A');

insert into Enrollment(enrollmentID, studentID, sectionID,
    grade) values
(320, 1006, 102, 'B');
