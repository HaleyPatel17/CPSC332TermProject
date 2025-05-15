use university;
select * from course;
select * from Professor;
select * from department;
select * from studentRecords;
select * from enrollment;
select * from address;
select * from professorDegree;
select * from section;
select * from prerequisite;

-- (a)
select p.ssn, p.title, s.classroom, s.meetingDays, s.startTime,s.endTime
from Professor as p  left outer join Section as s on p.professorID=s.ProfessorID  
where p.SSN = '515932084';

-- (b)
select count(e.studentID) Count, e.grade
from Section as s left join enrollment as e on s.sectionID=e.sectionID
where s.courseID = 300 and s.sectionID = 101
group by e.grade;

-- (c)
select s.courseID, s.sectionID, s.classroom, s.meetingDays, 
    s.startTime, s.endTime, (select count(studentID)
    from enrollment where sectionID = s.sectionID 
    group by sectionID) numStudentsEnrolled
    from section as s
    where s.courseID = 204;  

-- (d)    
select sr.studentID, s.courseID, e.grade
from section as s inner join enrollment as e on s.sectionID = e.sectionID
inner join StudentRecords as sr on sr.studentID = e.studentID
where sr.studentID = 1001;

-- for (a) stored procedure for professor information when SSN is given
drop procedure if exists ProfSchedule;
DELIMITER //
	create procedure ProfSchedule(
		IN ssnNumber varchar(10)
        )
        BEGIN
			select p.ssn, p.title, s.classroom, s.meetingDays, s.startTime,s.endTime
			from Professor as p  left outer join Section as s on p.professorID=s.ProfessorID  
			where p.SSN = ssnNumber;
        END //
DELIMITER ;

-- for (b) stored procedure for counting grades when course number and section number are given
DELIMITER //
	create procedure countGrades(
		IN courseNumber int,
        IN sectionNumber int
        )
        BEGIN
			select count(e.studentID) Count, e.grade
			from Section as s left join enrollment as e on s.sectionID=e.sectionID
			where s.courseID = courseNumber and s.sectionID = sectionNumber
			group by e.grade;
		END //
DELIMITER ;

-- for (c) stored procedure for listing sections  of the course when course number is given
DELIMITER //
	create procedure listSections(
		IN courseNumber int
    )
    BEGIN
		select s.courseID, s.sectionID, s.classroom, s.meetingDays, 
		s.startTime, s.endTime, (select count(studentID)
		from enrollment where sectionID = s.sectionID 
		group by sectionID) numStudentsEnrolled
		from section as s
		where s.courseID = courseNumber;
    END //
DELIMITER ;

-- for(d): stored procedure for listing courses and grades when student number is given
DELIMITER //
	create procedure listCoursesAndGrades(
		IN studentNumber int
    )
    BEGIN
		select sr.studentID, s.courseID, e.grade
		from section as s inner join enrollment as e on s.sectionID = e.sectionID
		inner join StudentRecords as sr on sr.studentID = e.studentID
		where sr.studentID = studentNumber;
    END //
DELIMITER ;
call ProfSchedule('421569328');
call countGrades(300, 101);
call listSections(221);
call listCoursesAndGrades(1003);


GRANT ALL ON *.* TO 'localhost_stevoclock21'@'localhost';