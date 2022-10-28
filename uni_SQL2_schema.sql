/*Task 1: BETWEEN TWO NULLS*/
Use uni;

-- 1.	Obtain a list of applications where the CourseID is unknown
SELECT * 
FROM application
WHERE CourseAppliedFor IS NULL;

-- 2.	Obtain a list of students where their CourseID is not unknown

SELECT * 
FROM student
WHERE CourseID IS NULL;


-- 3.	Obtain a list of students whom were born in the month of June 2002

SELECT * 
FROM student
WHERE DateOfBirth BETWEEN '2002-06-01' AND '2002-06-30';

-- OR 
SELECT * 
FROM student
WHERE DateOfBirth >= '2002-06-01' AND DateOfBirth <= '2002-06-30';

/* 4.	Obtain a list of applications where CourseID is unknown 
and the applications where  made between 01/04/2020 and 31/07/2020*/
SELECT * 
FROM application
WHERE CourseAppliedFor IS NULL
AND DateOfApplication BETWEEN '2020-04-01' AND '2020-07-31';

-- OR

SELECT * 
FROM application
WHERE DateOfApplication BETWEEN '2020-04-01' AND '2020-07-31'
AND CourseAppliedFor IS NULL;



/*Task 2: GROUPING FUNCTIONS*/

-- 1.	Obtain the number of modules which are assigned to each course
SELECT Subject, COUNT(ModuleName) AS '#OfModules'
FROM module
GROUP BY Subject;

-- 2.	Retrieve Information on the number of successful applications per course
SELECT * FROM application;

SELECT * FROM course;

-- Solution 1: Course name not shown only courseid
SELECT CourseAppliedFor, COUNT(accepted) AS '#OfAcceptedApplications'
FROM application
WHERE accepted <> 0
GROUP BY CourseAppliedFor;

--Solution 2:  To show course name and id we have to join the course and application tables

SELECT course.CourseName, application.CourseAppliedFor, COUNT(application.accepted) AS '#Accepted'
FROM application
RIGHT JOIN course
ON course.CourseID = application.CourseAppliedFor
AND application.accepted <> 0
GROUP BY course.CourseName, application.CourseAppliedFor
ORDER BY application.CourseAppliedFor ASC
;

-- 3.	Find the average Membership Fee of Student Clubs by the ID of the Staff member (Lecturer) supervising it
select * from lecturer;
select * from club;

-- Solution 1: The result below does not show the lecturer name only the ID
SELECT ClubName, SupervisingStaff, AVG(MembershipFee) 
FROM club
GROUP BY SupervisingStaff;

-- Solution 2: The result below shows the lecturer's name and ID by joining the lecturer and the club tables
SELECT club.ClubName, lecturer.LecturerName, club.SupervisingStaff AS SupervisorID, AVG(club.MembershipFee) 
FROM club
RIGHT JOIN lecturer
ON club.SupervisingStaff = lecturer.LecturerID
GROUP BY lecturer.LecturerName, club.SupervisingStaff;

-- 4.	Find the Sum total of Joining Fees for all active clubs by Staff Member supervising them

-- Solution 1: The results obtained with only the lecturer or supervising staff's ID
SELECT ClubName, SupervisingStaff, SUM(JoiningFee) 
FROM club
GROUP BY SupervisingStaff;

-- Solution 2: This result displays the lecturer's name and ID by joining the lecturer and the club tables

SELECT club.ClubName, lecturer.LecturerName, club.SupervisingStaff AS SupervisorID, SUM(club.JoiningFee) 
FROM club
RIGHT JOIN lecturer
ON club.SupervisingStaff = lecturer.LecturerID
GROUP BY lecturer.LecturerName, club.SupervisingStaff;

/*Task 3: ADVANCED JOINS*/

-- 1.	Obtain a list of all modules and the names of any courses they may be taught (include modules without courses)
SELECT * FROM module;

SELECT * FROM course;

SELECT module.ModuleID, module.ModuleName, module.Subject, course.CourseName, course.CourseID 
FROM module
CROSS JOIN course
WHERE module.CourseID = course.CourseID;

-- 2.	Obtain a list of students along with any related application numbers if they have them

SELECT * FROM student;

SELECT * FROM application;

SELECT * FROM student
CROSS JOIN application
ON student.StudentID = application.StudentID
AND student.CourseID = application.CourseAppliedFor
WHERE application.accepted <> 0;


-- 3.	Obtain the Class ID, Class Date and Feedback score of the latest class scheduled for each Class ID

-- Solution 1 using a CROSS JOIN or a Left Join
SELECT * FROM class;

SELECT * FROM schedule;

SELECT class.ClassID, MAX(schedule.CDate), schedule.FeedbackScore 
FROM schedule
LEFT JOIN class
ON schedule.ClassID = class.ClassID
GROUP BY class.ClassID;
 
-- Solution 2 using joining the table to itself using a subquery

SELECT schedule.ClassID, schedule.CDate, schedule.FeedbackScore FROM schedule
INNER JOIN (
    SELECT ClassID, max(CDate) AS lATESTdATE
    FROM schedule
    GROUP BY ClassID
) AS tm ON schedule.ClassID = tm.ClassID AND schedule.CDate = tm.LatestDate;