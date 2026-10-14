create database employee_management;
use employee_management;

create table employee(
emp_id int primary key,
emp_name varchar(50),
department varchar(30),
salary decimal(10,2),
city varchar(30),
joining_date date
);

INSERT INTO Employee
    (emp_id, emp_name, department, salary, city, joining_date)
VALUES
    (101, 'John', 'IT', 60000, 'Chennai', '2022-01-15'),
    (102, 'David', 'HR', 45000, 'Bangalore', '2021-03-10'),
    (103, 'Smith', 'IT', 70000, 'Chennai', '2020-07-12'),
    (104, 'Mary', 'Finance', 55000, 'Mumbai', '2023-01-20'),
    (105, 'James', 'HR', 48000, 'Delhi', '2022-05-05'),
    (106, 'Linda', 'Finance', 65000, 'Mumbai', '2021-08-18');
    
    select * from employee;

-- 1. Find the total number of employees in each department

SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department;

-- 2. Find the average salary of employees in each department

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

-- 3. Display departments having more than one employee

SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1;

-- 4. Find the highest salary in each department

SELECT department, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department;

-- 5. Find the lowest salary in each department

SELECT department, MIN(salary) AS lowest_salary
FROM Employee
GROUP BY department;

-- 6. Find departments whose average salary is greater than 50,000

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 50000;

-- 7. Calculate the total salary expenditure for each department

SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;

-- 8. Display all employees sorted by salary in descending order

SELECT * FROM Employee ORDER BY salary DESC;

-- 9. Display employees sorted first by department and then by salary in descending order

SELECT *
FROM Employee
ORDER BY department ASC, salary DESC;

-- 10. Find cities that have more than one employee

SELECT city, COUNT(*) AS total_employees
FROM Employee
GROUP BY city
HAVING COUNT(*) > 1;

-- 11. Find the total salary paid in each city

SELECT city, SUM(salary) AS total_salary
FROM Employee
GROUP BY city;

-- 12. Display departments ordered by total salary expenditure from highest to lowest

SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
ORDER BY total_salary DESC;

-- 13. Find the number of employees in each department whose salary is greater than 50,000

SELECT department, COUNT(*) AS employee_count
FROM Employee
WHERE salary > 50000
GROUP BY department;

-- 14. Find the difference between the highest and lowest salary in each department

SELECT department,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary,
       MAX(salary) - MIN(salary) AS salary_difference
FROM Employee
GROUP BY department;

-- 15. Display the top 3 highest-paid employees

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;