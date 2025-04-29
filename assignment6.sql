-- Step 1: Create Database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Step 2: Create Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    JobCategory VARCHAR(50),
    Salary INT,
    ManagerID INT,
    DepartmentID INT
);

-- Step 3: Create Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Step 4: Insert Sample Data into Department Table
INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales');

-- Step 5: Insert Sample Data into Employee Table
INSERT INTO Employee (EmpID, Name, JobCategory, Salary, ManagerID, DepartmentID) VALUES
(101, 'Amit Sharma', 'Manager', 50000, NULL, 1),
(102, 'Rohit Verma', 'Engineer', 30000, 101, 3),
(103, 'Priya Singh', 'Clerk', 20000, 101, 2),
(104, 'Neha Gupta', 'Engineer', 25000, 102, 3),
(105, 'Suresh Kumar', 'Technician', 18000, 101, 4),
(106, 'Kavita Joshi', 'Clerk', 15000, 103, 2),
(107, 'Ravi Patel', 'Technician', 17000, 105, 4),
(108, 'Pooja Mehta', 'Manager', 60000, NULL, 2),
(109, 'Vikram Choudhary', 'Engineer', 32000, 108, 3),
(110, 'Anjali Nair', 'Clerk', 14000, 103, 2);

-- Step 6: Display Tables
SELECT * FROM Employee;
SELECT * FROM Department;

-- Query 1: Display total salary spent for each job category
SELECT JobCategory, SUM(Salary) AS TotalSalarySpent
FROM Employee
GROUP BY JobCategory;

-- Query 2: Display lowest paid employee details under each manager
SELECT E1.ManagerID, E1.EmpID, E1.Name, E1.Salary
FROM Employee E1
WHERE Salary = (SELECT MIN(E2.Salary) FROM Employee E2 WHERE E2.ManagerID = E1.ManagerID);

-- Query 3: Display number of employees working in each department and their department name
SELECT D.DepartmentName, COUNT(E.EmpID) AS NumberOfEmployees
FROM Employee E
JOIN Department D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

-- Query 4: Display the details of employees sorting the salary in increasing order
SELECT * FROM Employee
ORDER BY Salary ASC;

-- Query 5: Show the record of employees earning salary greater than 16000 in each department
SELECT * FROM Employee
WHERE Salary > 16000
ORDER BY DepartmentID;

-- Query 6: Implement and practice clauses (already covered in previous queries)
