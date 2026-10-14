create database if not exists Student_Database;
use Student_Database;

DROP TABLE IF EXISTS Students;

create table Students(
students_id int primary key,
students_name varchar(50),
department varchar(30),
marks int
);

INSERT INTO Students (students_id, students_name, department, marks)
VALUES
(101, 'Arun', 'CSE', 85),
(102, 'Priya', 'ECE', 92),
(103, 'Karthik', 'CSE', 76),
(104, 'Meena', 'IT', 88),
(105, 'David', 'ECE', 67);

select * from Students;

-- 1.	Find the average marks scored by students in each department. 
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department;

-- 2.	Find departments whose average marks are above 75. 
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) > 75;

-- 3.	Find the highest mark scored in each department. 
SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department;

-- 4.	Find the total number of students in each department. 
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department;

-- 5.	Find departments having more than 5 students. 
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(*) > 5;

-- 6.	Display departments sorted by average marks in descending order. 
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC;

-- 7.	Find the top 3 departments based on average marks. 
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC
LIMIT 3;

-- 8.	Find departments whose average marks are between 70 and 90. 
SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;

-- 9.	Find the total marks scored by students in each department. 
SELECT department, SUM(marks) AS total_marks
FROM Students
GROUP BY department;

-- 10.	Display departments sorted by the total number of students. 
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
ORDER BY total_students ASC;

-- 11.	Find the lowest mark scored in each department. 
SELECT department, MIN(marks) AS lowest_marks
FROM Students
GROUP BY department;

-- 12.	Find departments where the highest mark is greater than 90. 
SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
HAVING MAX(marks) > 90;

-- 13.	Find the number of students scoring above 80 in each department. 
SELECT department, COUNT(*) AS students_above_80
FROM Students
WHERE marks > 80
GROUP BY department;

-- 14.	Find departments where more than 3 students scored above 75. 
SELECT department, COUNT(*) AS students_above_75
FROM Students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;

-- 15.	Display departments ordered by highest mark in descending order. 
SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
ORDER BY highest_marks DESC;