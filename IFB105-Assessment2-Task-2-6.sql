
-- Task 2
-- 1
SELECT CONCAT(ts.firstName,' ', ts.surname) AS fullname, tc.degreecode
FROM TeachingStaff ts
NATURAL JOIN TeachingCredentials tc
WHERE uni<>'QUT';

-- 2
SELECT s.studentID, s.surname, s.gender
FROM Student s
NATURAL JOIN enrolment e
WHERE timeMode='PT'
ORDER BY surname ASC;

-- 3
SELECT ts.employeeNumber, ts.surname, COUNT(i.studentID) AS totalStudents
FROM teachingStaff ts
NATURAL JOIN instructs i
GROUP BY employeeNumber;

-- 4
SELECT ts.firstName, tc.degreeCode
FROM instructs i
LEFT JOIN teachingstaff ts 
ON i.employeeNumber = ts.employeeNumber 
LEFT JOIN teachingcredentials tc
ON i.employeeNumber = tc.employeeNumber
WHERE i.subjectCode NOT LIKE '_______19%' 
GROUP BY i.subjectCode;

-- 5
SELECT s.studentID, s.surname, AVG(g.grade) AS GPA, e.timeMode, e.placeMode
FROM student s, enrolment e, grades g
WHERE s.studentID = e.studentID AND s.studentID = g.studentID
GROUP BY g.studentID;
                
-- 6
SELECT g.subjectCode, t.surname,
	COUNT(DISTINCT g.studentID) AS totalStudents,
	MIN(g.grade) AS lowestGrade,
    MAX(g.grade) AS highestGrade,
    AVG(g.grade) AS averageGrade
FROM grades g, teachingstaff t
JOIN instructs i
ON i.employeeNumber = t.employeeNumber
GROUP BY g.subjectCode;

-- Task 3
INSERT INTO teachingstaff (employeeNumber, firstName, surname, departmentName)
VALUES ('9962040', 'Srikanth', 'Nair', 'SEF');

DELETE FROM grades
WHERE subjectCode LIKE 'BSB111%';

UPDATE instructs SET position = 'LECTURER'
WHERE subjectCode LIKE 'IFB____18%';

-- Task 4
CREATE INDEX studentIndex ON
student (studentID ASC);

CREATE VIEW studentGradeView1
AS SELECT s.surname, s.firstName, g.subjectCode, g.grade
FROM student s
JOIN grades g
ON s.studentID = g.studentID
WHERE g.grade = 7; 

-- Task 5
CREATE USER chan@localhost;
GRANT INSERT ON university.subject TO chan@localhost;
GRANT DELETE ON university.subject TO chan@localhost;

CREATE USER jake@localhost;
GRANT INSERT ON university.enrolment TO jake@localhost;
GRANT DELETE ON university.enrolment TO jake@localhost;
REVOKE INSERT ON university.enrolment FROM jake@localhost;
REVOKE DELETE ON university.enrolment FROM jake@localhost;

-- DROP USER chan@localhost;
-- DROP USER jake@localhost;
-- FLUSH PRIVILEGES




