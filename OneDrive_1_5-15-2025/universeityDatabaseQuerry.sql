create database university;
use university;
Create table Address  (
      addressID  int NOT NULL,
      streetAddress varchar(75) NOT NULL,
      City  varchar(20) NOT NULL,
      State  varchar(20) NOT NULL,
      zipcode varchar(10),
      PRIMARY KEY (addressID)
);
Create table Course (
     courseID int NOT NULL,
      title varchar(20) NOT NULL,
      textBook varchar(25) NOT NULL,
      units varchar(10) NOT NULL,
      PRIMARY KEY (courseID)
);
Create table Professor (
    ProfessorID int NOT NULL,
     SSN varchar(10),
     name varchar(45) NOT NULL,
     addressID int,
     areaCode varchar(10),
     phoneNumber varchar(15),
     gender varchar(10),
     title varchar(12) NOT NULL,
     salaray int NOT NULL,
      graduatedYear int NOT NULL,
      subjectTeach varchar(25) NOT NULL,
      PRIMARY KEY (professorID),
       FOREIGN KEY (addressID) REFERENCES Address(addressID) 
   );
Create table ProfessorDegree (
        degreeID int NOT NULL,
        degreeType varchar(30) NOT NULL,
        institution varchar(45) NOT NULL,
         ProfessorID int NOT NULL,
         PRIMARY KEY (degreeID), 
         FOREIGN KEY (professorID)  
                 REFERENCES Professor(ProfessorID)
);
Create table department (
    departmentID int NOT NULL,
    name varchar(45) NOT NULL,
    areaCode varchar(10),
    phoneNumber varchar(15),
    location varchar(25),
    chairPersonID int NOT NULL,
    PRIMARY KEY (departmentID),
    FOREIGN KEY (chairpersonID) 
    REFERENCES Professor(ProfessorID)
);
Create table Section (
    sectionID int NOT NULL,
    courseID int NOT NULL,
    classroom varchar(25) NOT NULL,
    numSeats int NOT NULL,
    meetingDays varchar(10) NOT NULL,
    startTime varchar(10),
    endTime varchar(10),
    ProfessorID int NOT NULL,
    PRIMARY KEY (sectionID), 
	FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID)
);
Create table Prerequisites (
    prerequisiteID int NOT NULL,
    courseID int NOT NULL,
    departmentID int NOT NULL,
    requiredCourseID int NOT NULL,
    PRIMARY KEY (prerequisiteID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID),
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID),
    FOREIGN KEY (requiredCourseID) REFERENCES Course(courseID)
);
Create table StudentRecords (
    StudentID int NOT NULL,
    firstName varchar(15) NOT NULL,
    lastName varchar(15) NOT NULL,
    addressID int NOT NULL,
    areaCode varchar(10),
    phoneNumber varchar(15),
    majorDepartmentID int NOT NULL,
    PRIMARY KEY (studentID),
    FOREIGN KEY (addressID) REFERENCES Address(addressID),
    FOREIGN KEY (majorDepartmentID) references Department(departmentID)
);
Create table Enrollment (
    enrollmentID int NOT NULL,
    studentID int NOT NULL, 
    sectionID int NOT NULL,
    grade varchar(10),
    PRIMARY KEY (enrollmentID),
    FOREIGN KEY (studentID) REFERENCES StudentRecords(studentID),
    FOREIGN KEY (sectionID) references Section(sectionID)
);
Create table StudentMinor (
    minorID int NOT NULL,
    studentID int NOT NULL,
    deptID int NOT NULL,
    PRIMARY KEY (minorID),
    FOREIGN KEY (studentID) REFERENCES StudentRecords(studentID),
    FOREIGN KEY (deptID) REFERENCES Department(departmentID)
);

-- 8 students 2 departments 3 professors
-- 4 courses 6 sections 20 enrollment records


