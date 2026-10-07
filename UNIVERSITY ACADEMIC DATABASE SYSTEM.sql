

/* ============================================================
   UNIVERSITY ACADEMIC DATABASE SYSTEM
   Complete MySQL Database Script
   ============================================================ */

/* ============================================================
   1. CREATE DATABASE
   ============================================================ */

DROP DATABASE IF EXISTS university_academic_db;

CREATE DATABASE university_academic_db;

USE university_academic_db;


/* ============================================================
   2. CREATE DEPARTMENT TABLE
   ============================================================ */

CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    office_location VARCHAR(100),
    hod_name VARCHAR(100)
);


/* ============================================================
   3. CREATE PROGRAM TABLE
   ============================================================ */

CREATE TABLE Program (
    program_id INT PRIMARY KEY AUTO_INCREMENT,
    program_name VARCHAR(100) NOT NULL,
    degree VARCHAR(50) NOT NULL,
    duration_years INT NOT NULL,
    department_id INT,

    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);


/* ============================================================
   4. CREATE STUDENT TABLE
   ============================================================ */

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    email VARCHAR(100),
    phone VARCHAR(15),
    admission_year INT,
    program_id INT,

    FOREIGN KEY (program_id)
        REFERENCES Program(program_id)
);


/* ============================================================
   5. CREATE FACULTY TABLE
   ============================================================ */

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    designation VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    department_id INT,

    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);


/* ============================================================
   6. CREATE COURSE TABLE
   ============================================================ */

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    department_id INT,
    faculty_id INT,

    FOREIGN KEY (department_id)
        REFERENCES Department(department_id),

    FOREIGN KEY (faculty_id)
        REFERENCES Faculty(faculty_id)
);


/* ============================================================
   7. CREATE SEMESTER TABLE
   ============================================================ */

CREATE TABLE Semester (
    semester_id INT PRIMARY KEY,
    semester_name VARCHAR(50) NOT NULL,
    academic_year VARCHAR(20) NOT NULL,
    start_date DATE,
    end_date DATE
);


/* ============================================================
   8. CREATE CLASSROOM TABLE
   ============================================================ */

CREATE TABLE Classroom (
    classroom_id INT PRIMARY KEY,
    building_name VARCHAR(100),
    room_number VARCHAR(20),
    capacity INT
);


/* ============================================================
   9. CREATE ENROLLMENT TABLE
   ============================================================ */

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    enrollment_date DATE,

    FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    FOREIGN KEY (course_id)
        REFERENCES Course(course_id),

    FOREIGN KEY (semester_id)
        REFERENCES Semester(semester_id)
);


/* ============================================================
   10. CREATE EXAMINATION TABLE
   ============================================================ */

CREATE TABLE Examination (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    exam_type VARCHAR(50),
    exam_date DATE,
    classroom_id INT,

    FOREIGN KEY (course_id)
        REFERENCES Course(course_id),

    FOREIGN KEY (semester_id)
        REFERENCES Semester(semester_id),

    FOREIGN KEY (classroom_id)
        REFERENCES Classroom(classroom_id)
);


/* ============================================================
   11. CREATE RESULT TABLE
   ============================================================ */

CREATE TABLE Result (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    exam_id INT NOT NULL,
    marks DECIMAL(5,2),
    grade VARCHAR(5),

    FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    FOREIGN KEY (exam_id)
        REFERENCES Examination(exam_id)
);


/* ============================================================
   12. CREATE ATTENDANCE TABLE
   ============================================================ */

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    total_classes INT,
    attended_classes INT,
    attendance_percentage DECIMAL(5,2),

    FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    FOREIGN KEY (course_id)
        REFERENCES Course(course_id),

    FOREIGN KEY (semester_id)
        REFERENCES Semester(semester_id)
);


/* ============================================================
   13. INSERT DEPARTMENT DATA
   ============================================================ */

INSERT INTO Department
(department_name, office_location, hod_name)
VALUES
('Artificial Intelligence and Machine Learning',
 'Block A',
 'Dr. Ravi Kumar'),

('Computer Science and Engineering',
 'Block B',
 'Dr. Suresh Rao'),

('Electronics and Communication Engineering',
 'Block C',
 'Dr. Anitha Devi'),

('Mechanical Engineering',
 'Block D',
 'Dr. Prasad Kumar'),

('Civil Engineering',
 'Block E',
 'Dr. Lakshmi Devi');


/* ============================================================
   14. INSERT PROGRAM DATA
   ============================================================ */

INSERT INTO Program
(program_name, degree, duration_years, department_id)
VALUES
('Artificial Intelligence and Machine Learning',
 'B.Tech',
 4,
 1),

('Computer Science and Engineering',
 'B.Tech',
 4,
 2),

('Electronics and Communication Engineering',
 'B.Tech',
 4,
 3),

('Mechanical Engineering',
 'B.Tech',
 4,
 4),

('Civil Engineering',
 'B.Tech',
 4,
 5);


/* ============================================================
   15. INSERT STUDENT DATA
   ============================================================ */

INSERT INTO Student
(student_id, student_name, gender, date_of_birth,
 email, phone, admission_year, program_id)
VALUES

(101, 'Gireesh Jogi', 'Male',
 '2007-01-11',
 'gireesh@gmail.com',
 '9876543210',
 2025,
 1),

(102, 'Rahul Kumar', 'Male',
 '2006-08-15',
 'rahul@gmail.com',
 '9876543211',
 2025,
 1),

(103, 'Priya Sharma', 'Female',
 '2007-02-20',
 'priya@gmail.com',
 '9876543212',
 2025,
 2),

(104, 'Anjali Reddy', 'Female',
 '2006-12-05',
 'anjali@gmail.com',
 '9876543213',
 2025,
 2),

(105, 'Vamsi Krishna', 'Male',
 '2007-04-18',
 'vamsi@gmail.com',
 '9876543214',
 2025,
 3),

(106, 'Sneha Rao', 'Female',
 '2007-06-22',
 'sneha@gmail.com',
 '9876543215',
 2025,
 3),

(107, 'Kiran Kumar', 'Male',
 '2006-09-10',
 'kiran@gmail.com',
 '9876543216',
 2025,
 4),

(108, 'Divya Rani', 'Female',
 '2007-03-14',
 'divya@gmail.com',
 '9876543217',
 2025,
 5);


/* ============================================================
   16. INSERT FACULTY DATA
   ============================================================ */

INSERT INTO Faculty
(faculty_id, faculty_name, designation, email, phone, department_id)
VALUES

(201, 'Dr. Arun Kumar', 'Professor',
 'arun@university.edu', '9000000001', 1),

(202, 'Dr. Meena Devi', 'Associate Professor',
 'meena@university.edu', '9000000002', 1),

(203, 'Dr. Rajesh Kumar', 'Professor',
 'rajesh@university.edu', '9000000003', 2),

(204, 'Dr. Kavya Reddy', 'Assistant Professor',
 'kavya@university.edu', '9000000004', 2),

(205, 'Dr. Srinivas Rao', 'Professor',
 'srinivas@university.edu', '9000000005', 3),

(206, 'Dr. Lakshmi Prasad', 'Associate Professor',
 'lakshmi@university.edu', '9000000006', 4);


/* ============================================================
   17. INSERT COURSE DATA
   ============================================================ */

INSERT INTO Course
(course_id, course_code, course_name, credits,
 department_id, faculty_id)
VALUES

(301, 'AI101', 'Artificial Intelligence',
 4, 1, 201),

(302, 'ML102', 'Machine Learning',
 4, 1, 202),

(303, 'DBMS201', 'Database Management Systems',
 4, 2, 203),

(304, 'DS202', 'Data Structures',
 4, 2, 204),

(305, 'EC301', 'Digital Electronics',
 3, 3, 205),

(306, 'ME401', 'Thermodynamics',
 3, 4, 206),

(307, 'CE501', 'Structural Engineering',
 3, 5, NULL);


/* ============================================================
   18. INSERT SEMESTER DATA
   ============================================================ */

INSERT INTO Semester
(semester_id, semester_name, academic_year,
 start_date, end_date)
VALUES

(401, '1st Semester', '2025-2026',
 '2025-07-01',
 '2025-12-15'),

(402, '2nd Semester', '2025-2026',
 '2026-01-05',
 '2026-05-15'),

(403, '3rd Semester', '2026-2027',
 '2026-07-01',
 '2026-12-15');


/* ============================================================
   19. INSERT CLASSROOM DATA
   ============================================================ */

INSERT INTO Classroom
(classroom_id, building_name, room_number, capacity)
VALUES

(501, 'Academic Block A', 'A101', 60),
(502, 'Academic Block A', 'A102', 60),
(503, 'Academic Block B', 'B201', 80),
(504, 'Academic Block B', 'B202', 80),
(505, 'Academic Block C', 'C301', 50);


/* ============================================================
   20. INSERT ENROLLMENT DATA
   ============================================================ */

INSERT INTO Enrollment
(student_id, course_id, semester_id, enrollment_date)
VALUES

(101, 301, 401, '2025-07-05'),
(101, 302, 401, '2025-07-05'),
(101, 303, 401, '2025-07-05'),

(102, 301, 401, '2025-07-06'),
(102, 302, 401, '2025-07-06'),

(103, 303, 401, '2025-07-07'),
(103, 304, 401, '2025-07-07'),

(104, 303, 401, '2025-07-07'),
(104, 304, 401, '2025-07-07'),

(105, 305, 401, '2025-07-08'),

(106, 305, 401, '2025-07-08'),

(107, 306, 401, '2025-07-09'),

(108, 307, 401, '2025-07-10');


/* ============================================================
   21. INSERT EXAMINATION DATA
   ============================================================ */

INSERT INTO Examination
(course_id, semester_id, exam_type,
 exam_date, classroom_id)
VALUES

(301, 401, 'Mid Term', '2025-09-10', 501),
(302, 401, 'Mid Term', '2025-09-12', 502),
(303, 401, 'Mid Term', '2025-09-15', 503),
(304, 401, 'Mid Term', '2025-09-17', 504),
(305, 401, 'Mid Term', '2025-09-19', 505),

(301, 401, 'End Semester', '2025-12-01', 501),
(302, 401, 'End Semester', '2025-12-03', 502),
(303, 401, 'End Semester', '2025-12-05', 503);


/* ============================================================
   22. INSERT RESULT DATA
   ============================================================ */

INSERT INTO Result
(student_id, exam_id, marks, grade)
VALUES

(101, 1, 86, 'A'),
(102, 1, 78, 'B'),
(101, 2, 91, 'A+'),
(102, 2, 82, 'A'),

(103, 3, 88, 'A'),
(104, 3, 75, 'B'),

(103, 4, 92, 'A+'),
(104, 4, 81, 'A'),

(105, 5, 79, 'B'),
(106, 5, 89, 'A'),

(101, 6, 94, 'A+'),
(102, 6, 84, 'A'),

(101, 7, 90, 'A+'),
(102, 7, 76, 'B'),

(103, 8, 87, 'A'),
(104, 8, 80, 'A');


/* ============================================================
   23. INSERT ATTENDANCE DATA
   ============================================================ */

INSERT INTO Attendance
(student_id, course_id, semester_id,
 total_classes, attended_classes,
 attendance_percentage)
VALUES

(101, 301, 401, 40, 36, 90.00),
(101, 302, 401, 40, 34, 85.00),
(101, 303, 401, 42, 39, 92.86),

(102, 301, 401, 40, 35, 87.50),
(102, 302, 401, 40, 32, 80.00),

(103, 303, 401, 42, 38, 90.48),
(103, 304, 401, 40, 36, 90.00),

(104, 303, 401, 42, 35, 83.33),
(104, 304, 401, 40, 33, 82.50),

(105, 305, 401, 38, 32, 84.21),
(106, 305, 401, 38, 35, 92.11),

(107, 306, 401, 40, 30, 75.00),
(108, 307, 401, 40, 37, 92.50);


/* ============================================================
   24. CREATE DUPLICATE DATA FOR DEMONSTRATION
   ============================================================ */

/*
   We create a separate table so that duplicate records
   can be demonstrated and removed safely.
*/

CREATE TABLE Student_Duplicate_Demo (
    demo_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    student_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);


/* ============================================================
   25. INSERT ORIGINAL + DUPLICATE RECORDS
   ============================================================ */

INSERT INTO Student_Duplicate_Demo
(student_id, student_name, email, phone)
VALUES

(101, 'Gireesh Jogi', 'gireesh@gmail.com', '9876543210'),
(102, 'Rahul Kumar', 'rahul@gmail.com', '9876543211'),
(103, 'Priya Sharma', 'priya@gmail.com', '9876543212'),

/* Duplicate */
(101, 'Gireesh Jogi', 'gireesh@gmail.com', '9876543210'),

/* Duplicate */
(102, 'Rahul Kumar', 'rahul@gmail.com', '9876543211'),

/* Duplicate */
(103, 'Priya Sharma', 'priya@gmail.com', '9876543212'),

(104, 'Anjali Reddy', 'anjali@gmail.com', '9876543213'),

/* Duplicate */
(104, 'Anjali Reddy', 'anjali@gmail.com', '9876543213'),

(105, 'Vamsi Krishna', 'vamsi@gmail.com', '9876543214');


/* ============================================================
   26. VIEW DUPLICATE RECORDS
   ============================================================ */

SELECT
    student_id,
    student_name,
    email,
    phone,
    COUNT(*) AS duplicate_count
FROM Student_Duplicate_Demo
GROUP BY
    student_id,
    student_name,
    email,
    phone
HAVING COUNT(*) > 1;


/* ============================================================
   27. DELETE DUPLICATES - METHOD 1
   ============================================================ */

/*
   Keep the first record and delete the remaining
   duplicate records.
*/

DELETE s1
FROM Student_Duplicate_Demo s1
JOIN Student_Duplicate_Demo s2
ON s1.student_id = s2.student_id
AND s1.demo_id > s2.demo_id;


/* ============================================================
   28. CHECK DATA AFTER DUPLICATE REMOVAL
   ============================================================ */

SELECT *
FROM Student_Duplicate_Demo
ORDER BY demo_id;


/* ============================================================
   29. INSERT DUPLICATES AGAIN FOR SECOND DEMONSTRATION
   ============================================================ */

INSERT INTO Student_Duplicate_Demo
(student_id, student_name, email, phone)
VALUES

(105, 'Vamsi Krishna', 'vamsi@gmail.com', '9876543214'),

(105, 'Vamsi Krishna', 'vamsi@gmail.com', '9876543214'),

(106, 'Sneha Rao', 'sneha@gmail.com', '9876543215'),

(106, 'Sneha Rao', 'sneha@gmail.com', '9876543215');


/* ============================================================
   30. FIND DUPLICATES USING GROUP BY
   ============================================================ */

SELECT
    student_id,
    student_name,
    email,
    phone,
    COUNT(*) AS total_records
FROM Student_Duplicate_Demo
GROUP BY
    student_id,
    student_name,
    email,
    phone
HAVING COUNT(*) > 1;


/* ============================================================
   31. DELETE DUPLICATES - METHOD 2
   USING SELF JOIN
   ============================================================ */

DELETE s1
FROM Student_Duplicate_Demo s1
INNER JOIN Student_Duplicate_Demo s2
ON s1.student_id = s2.student_id
AND s1.email = s2.email
AND s1.demo_id > s2.demo_id;


/* ============================================================
   32. CHECK FINAL CLEAN DATA
   ============================================================ */

SELECT *
FROM Student_Duplicate_Demo
ORDER BY demo_id;


/* ============================================================
   33. BASIC SELECT QUERIES
   ============================================================ */


/* Display all students */

SELECT *
FROM Student;


/* Display all departments */

SELECT *
FROM Department;


/* Display all faculty */

SELECT *
FROM Faculty;


/* Display all courses */

SELECT *
FROM Course;


/* Display all semesters */

SELECT *
FROM Semester;


/* Display all enrollments */

SELECT *
FROM Enrollment;


/* ============================================================
   34. WHERE CONDITION
   ============================================================ */

SELECT *
FROM Student
WHERE program_id = 1;


/* ============================================================
   35. ORDER BY
   ============================================================ */

SELECT
    student_id,
    student_name,
    admission_year
FROM Student
ORDER BY student_name ASC;


/* ============================================================
   36. DISTINCT
   ============================================================ */

SELECT DISTINCT gender
FROM Student;


/* ============================================================
   37. LIKE OPERATOR
   ============================================================ */

SELECT *
FROM Student
WHERE student_name LIKE 'G%';


/* ============================================================
   38. BETWEEN OPERATOR
   ============================================================ */

SELECT *
FROM Result
WHERE marks BETWEEN 80 AND 90;


/* ============================================================
   39. UPDATE OPERATION
   ============================================================ */

UPDATE Student
SET phone = '9999999999'
WHERE student_id = 101;


/* Check updated record */

SELECT *
FROM Student
WHERE student_id = 101;


/* ============================================================
   40. DELETE OPERATION
   ============================================================ */

/*
   Demonstration only:
   Delete a classroom that is not being referenced.
*/

INSERT INTO Classroom
(classroom_id, building_name, room_number, capacity)
VALUES
(506, 'Temporary Block', 'T101', 30);

DELETE FROM Classroom
WHERE classroom_id = 506;


/* ============================================================
   41. INNER JOIN
   ============================================================ */

SELECT
    s.student_id,
    s.student_name,
    p.program_name,
    d.department_name
FROM Student s
INNER JOIN Program p
    ON s.program_id = p.program_id
INNER JOIN Department d
    ON p.department_id = d.department_id;


/* ============================================================
   42. STUDENT + COURSE JOIN
   ============================================================ */

SELECT
    s.student_name,
    c.course_code,
    c.course_name,
    e.enrollment_date
FROM Student s
JOIN Enrollment e
    ON s.student_id = e.student_id
JOIN Course c
    ON e.course_id = c.course_id;


/* ============================================================
   43. FACULTY + COURSE JOIN
   ============================================================ */

SELECT
    f.faculty_name,
    c.course_code,
    c.course_name
FROM Faculty f
JOIN Course c
    ON f.faculty_id = c.faculty_id;


/* ============================================================
   44. RESULT DETAILS
   ============================================================ */

SELECT
    s.student_name,
    c.course_name,
    ex.exam_type,
    ex.exam_date,
    r.marks,
    r.grade
FROM Result r
JOIN Student s
    ON r.student_id = s.student_id
JOIN Examination ex
    ON r.exam_id = ex.exam_id
JOIN Course c
    ON ex.course_id = c.course_id;


/* ============================================================
   45. ATTENDANCE DETAILS
   ============================================================ */

SELECT
    s.student_name,
    c.course_name,
    a.total_classes,
    a.attended_classes,
    a.attendance_percentage
FROM Attendance a
JOIN Student s
    ON a.student_id = s.student_id
JOIN Course c
    ON a.course_id = c.course_id;


/* ============================================================
   46. AGGREGATE FUNCTION - COUNT
   ============================================================ */

SELECT COUNT(*) AS total_students
FROM Student;


/* ============================================================
   47. COUNT STUDENTS DEPARTMENT-WISE
   ============================================================ */

SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM Department d
JOIN Program p
    ON d.department_id = p.department_id
JOIN Student s
    ON p.program_id = s.program_id
GROUP BY d.department_name;


/* ============================================================
   48. AVERAGE MARKS
   ============================================================ */

SELECT
    AVG(marks) AS average_marks
FROM Result;


/* ============================================================
   49. HIGHEST MARK
   ============================================================ */

SELECT
    MAX(marks) AS highest_marks
FROM Result;


/* ============================================================
   50. LOWEST MARK
   ============================================================ */

SELECT
    MIN(marks) AS lowest_marks
FROM Result;


/* ============================================================
   51. COURSE-WISE AVERAGE MARKS
   ============================================================ */

SELECT
    c.course_name,
    AVG(r.marks) AS average_marks
FROM Result r
JOIN Examination e
    ON r.exam_id = e.exam_id
JOIN Course c
    ON e.course_id = c.course_id
GROUP BY c.course_name;


/* ============================================================
   52. HAVING CLAUSE
   ============================================================ */

SELECT
    c.course_name,
    AVG(r.marks) AS average_marks
FROM Result r
JOIN Examination e
    ON r.exam_id = e.exam_id
JOIN Course c
    ON e.course_id = c.course_id
GROUP BY c.course_name
HAVING AVG(r.marks) > 80;


/* ============================================================
   53. SUBQUERY
   FIND STUDENTS WITH MARKS ABOVE AVERAGE
   ============================================================ */

SELECT
    s.student_id,
    s.student_name
FROM Student s
WHERE s.student_id IN
(
    SELECT r.student_id
    FROM Result r
    WHERE r.marks >
    (
        SELECT AVG(marks)
        FROM Result
    )
);


/* ============================================================
   54. SUBQUERY
   HIGHEST MARK STUDENT
   ============================================================ */

SELECT
    s.student_name,
    r.marks
FROM Student s
JOIN Result r
    ON s.student_id = r.student_id
WHERE r.marks =
(
    SELECT MAX(marks)
    FROM Result
);


/* ============================================================
   55. STUDENTS WITH LOW ATTENDANCE
   ============================================================ */

SELECT
    s.student_name,
    c.course_name,
    a.attendance_percentage
FROM Attendance a
JOIN Student s
    ON a.student_id = s.student_id
JOIN Course c
    ON a.course_id = c.course_id
WHERE a.attendance_percentage < 80;


/* ============================================================
   56. STUDENTS WITH HIGH ATTENDANCE
   ============================================================ */

SELECT
    s.student_name,
    c.course_name,
    a.attendance_percentage
FROM Attendance a
JOIN Student s
    ON a.student_id = s.student_id
JOIN Course c
    ON a.course_id = c.course_id
WHERE a.attendance_percentage >= 85;


/* ============================================================
   57. CREATE VIEW
   ============================================================ */

CREATE OR REPLACE VIEW Student_Academic_View AS
SELECT
    s.student_id,
    s.student_name,
    p.program_name,
    d.department_name,
    c.course_name,
    r.marks,
    r.grade
FROM Student s
JOIN Program p
    ON s.program_id = p.program_id
JOIN Department d
    ON p.department_id = d.department_id
JOIN Result r
    ON s.student_id = r.student_id
JOIN Examination e
    ON r.exam_id = e.exam_id
JOIN Course c
    ON e.course_id = c.course_id;


/* ============================================================
   58. DISPLAY VIEW
   ============================================================ */

SELECT *
FROM Student_Academic_View;


/* ============================================================
   59. STUDENT ACADEMIC PERFORMANCE
   ============================================================ */

SELECT
    s.student_name,
    AVG(r.marks) AS average_marks,
    MAX(r.marks) AS highest_marks,
    MIN(r.marks) AS lowest_marks
FROM Student s
JOIN Result r
    ON s.student_id = r.student_id
GROUP BY s.student_id, s.student_name
ORDER BY average_marks DESC;


/* ============================================================
   60. DEPARTMENT-WISE FACULTY COUNT
   ============================================================ */

SELECT
    d.department_name,
    COUNT(f.faculty_id) AS faculty_count
FROM Department d
LEFT JOIN Faculty f
    ON d.department_id = f.department_id
GROUP BY d.department_id, d.department_name;


/* ============================================================
   61. DEPARTMENT-WISE COURSE COUNT
   ============================================================ */

SELECT
    d.department_name,
    COUNT(c.course_id) AS course_count
FROM Department d
LEFT JOIN Course c
    ON d.department_id = c.department_id
GROUP BY d.department_id, d.department_name;


/* ============================================================
   62. STUDENT ENROLLMENT COUNT
   ============================================================ */

SELECT
    s.student_id,
    s.student_name,
    COUNT(e.course_id) AS enrolled_courses
FROM Student s
LEFT JOIN Enrollment e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;


/* ============================================================
   63. STUDENTS ENROLLED IN MORE THAN ONE COURSE
   ============================================================ */

SELECT
    s.student_id,
    s.student_name,
    COUNT(e.course_id) AS number_of_courses
FROM Student s
JOIN Enrollment e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.course_id) > 1;


/* ============================================================
   64. COURSE ENROLLMENT COUNT
   ============================================================ */

SELECT
    c.course_code,
    c.course_name,
    COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrollment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_name;


/* ============================================================
   65. EXAMINATION DETAILS
   ============================================================ */

SELECT
    e.exam_id,
    c.course_name,
    s.semester_name,
    e.exam_type,
    e.exam_date,
    cl.building_name,
    cl.room_number
FROM Examination e
JOIN Course c
    ON e.course_id = c.course_id
JOIN Semester s
    ON e.semester_id = s.semester_id
JOIN Classroom cl
    ON e.classroom_id = cl.classroom_id;


/* ============================================================
   66. STUDENT RESULT SUMMARY
   ============================================================ */

SELECT
    s.student_id,
    s.student_name,
    SUM(r.marks) AS total_marks,
    AVG(r.marks) AS average_marks
FROM Student s
JOIN Result r
    ON s.student_id = r.student_id
GROUP BY s.student_id, s.student_name;


/* ============================================================
   67. GRADE-WISE STUDENT COUNT
   ============================================================ */

SELECT
    grade,
    COUNT(*) AS total_students
FROM Result
GROUP BY grade
ORDER BY total_students DESC;


/* ============================================================
   68. STUDENTS WHO SCORED ABOVE 85
   ============================================================ */

SELECT
    s.student_name,
    r.marks,
    r.grade
FROM Student s
JOIN Result r
    ON s.student_id = r.student_id
WHERE r.marks > 85
ORDER BY r.marks DESC;


/* ============================================================
   69. STUDENTS WHO FAILED
   ============================================================ */

SELECT
    s.student_name,
    r.marks,
    r.grade
FROM Student s
JOIN Result r
    ON s.student_id = r.student_id
WHERE r.marks < 40;


/* ============================================================
   70. NULL FACULTY COURSES
   ============================================================ */

SELECT
    course_id,
    course_code,
    course_name
FROM Course
WHERE faculty_id IS NULL;


/* ============================================================
   71. LEFT JOIN
   SHOW ALL DEPARTMENTS INCLUDING WITHOUT COURSES
   ============================================================ */

SELECT
    d.department_name,
    c.course_name
FROM Department d
LEFT JOIN Course c
    ON d.department_id = c.department_id;


/* ============================================================
   72. RIGHT JOIN
   ============================================================ */

SELECT
    c.course_name,
    f.faculty_name
FROM Course c
RIGHT JOIN Faculty f
    ON c.faculty_id = f.faculty_id;


/* ============================================================
   73. STUDENT + PROGRAM DETAILS
   ============================================================ */

SELECT
    s.student_id,
    s.student_name,
    p.program_name,
    p.degree,
    p.duration_years
FROM Student s
JOIN Program p
    ON s.program_id = p.program_id;


/* ============================================================
   74. TRANSACTION DEMONSTRATION
   ============================================================ */

START TRANSACTION;

UPDATE Student
SET phone = '8888888888'
WHERE student_id = 102;

SELECT *
FROM Student
WHERE student_id = 102;

ROLLBACK;


/* ============================================================
   75. VERIFY ROLLBACK
   ============================================================ */

SELECT *
FROM Student
WHERE student_id = 102;


/* ============================================================
   76. CREATE INDEX
   ============================================================ */

CREATE INDEX idx_student_name
ON Student(student_name);

CREATE INDEX idx_course_name
ON Course(course_name);

CREATE INDEX idx_result_marks
ON Result(marks);


/* ============================================================
   77. SHOW TABLES
   ============================================================ */

SHOW TABLES;


/* ============================================================
   78. DESCRIBE TABLES
   ============================================================ */

DESCRIBE Student;

DESCRIBE Department;

DESCRIBE Program;

DESCRIBE Faculty;

DESCRIBE Course;

DESCRIBE Semester;

DESCRIBE Enrollment;

DESCRIBE Examination;

DESCRIBE Result;

DESCRIBE Attendance;

DESCRIBE Classroom;


/* ============================================================
   79. FINAL DATABASE CHECK
   ============================================================ */

SELECT 'Departments' AS Table_Name, COUNT(*) AS Records
FROM Department

UNION ALL

SELECT 'Programs', COUNT(*)
FROM Program

UNION ALL

SELECT 'Students', COUNT(*)
FROM Student

UNION ALL

SELECT 'Faculty', COUNT(*)
FROM Faculty

UNION ALL

SELECT 'Courses', COUNT(*)
FROM Course

UNION ALL

SELECT 'Semesters', COUNT(*)
FROM Semester

UNION ALL

SELECT 'Enrollments', COUNT(*)
FROM Enrollment

UNION ALL

SELECT 'Examinations', COUNT(*)
FROM Examination

UNION ALL

SELECT 'Results', COUNT(*)
FROM Result

UNION ALL

SELECT 'Attendance', COUNT(*)
FROM Attendance

UNION ALL

SELECT 'Classrooms', COUNT(*)
FROM Classroom;


/* ============================================================
   END OF UNIVERSITY ACADEMIC DATABASE SYSTEM
   ============================================================ */
















































