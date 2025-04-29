use basics;
CREATE TABLE EMPLOYEE (
    Emp_no INT PRIMARY KEY,
    E_name VARCHAR(100),
    E_address VARCHAR(255),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(100),
    Job_id INT,
    Designation VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO EMPLOYEE (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary) 
VALUES 
(101, 'Rajesh Sharma', '12 MG Road, Mumbai', '9876543210', 1, 'HR', 201, 'MANAGER', 75000.00),
(102, 'Priya Iyer', '45 Anna Nagar, Chennai', '8765432109', 2, 'Finance', 202, 'ACCOUNTANT', 55000.00),
(103, 'Amit Verma', '78 Sector 18, Noida', '7654321098', 3, 'IT', 203, 'ENGINEER', 60000.00),
(104, 'Sunita Nair', '89 Jayanagar, Bangalore', '6543210987', 1, 'HR', 204, 'MANAGER', 80000.00),
(105, 'Vikram Singh', '21 Gariahat, Kolkata', '5432109876', 4, 'Sales', 205, 'SALES EXECUTIVE', 50000.00),
(106, 'Deepak Patel', '99 Ellis Bridge, Ahmedabad', '4321098765', 2, 'Finance', 206, 'MANAGER', 78000.00),
(107, 'Anjali Das', '32 Salt Lake, Kolkata', '3210987654', 3, 'IT', 207, 'SOFTWARE ENGINEER', 65000.00),
(108, 'Ravi Kumar', '15 Banjara Hills, Hyderabad', '2109876543', 4, 'Sales', 208, 'MANAGER', 82000.00);
SELECT * FROM EMPLOYEE;
SELECT Emp_no, E_name, Salary 
FROM EMPLOYEE 
WHERE Designation = 'MANAGER';

SELECT * 
FROM EMPLOYEE 
WHERE Salary > ANY (SELECT Salary FROM EMPLOYEE WHERE Dept_name = 'IT');

ALTER TABLE EMPLOYEE ADD Join_Date DATE;
UPDATE EMPLOYEE 
SET Join_Date = '1985-06-15' WHERE Emp_no = 101;
UPDATE EMPLOYEE 
SET Join_Date = '1990-08-20' WHERE Emp_no = 102;
UPDATE EMPLOYEE 
SET Join_Date = '1978-12-05' WHERE Emp_no = 103;
UPDATE EMPLOYEE 
SET Join_Date = '1995-03-10' WHERE Emp_no = 104;
UPDATE EMPLOYEE 
SET Join_Date = '1982-09-18' WHERE Emp_no = 105;
UPDATE EMPLOYEE 
SET Join_Date = '1979-11-22' WHERE Emp_no = 106;
UPDATE EMPLOYEE 
SET Join_Date = '2000-01-30' WHERE Emp_no = 107;
UPDATE EMPLOYEE 
SET Join_Date = '1983-07-25' WHERE Emp_no = 108;

SELECT * 
FROM EMPLOYEE 
WHERE Join_Date > '1981-12-31'
ORDER BY Designation ASC;

SELECT 
    Emp_no, 
    E_name, 
    Designation, 
    Salary, 
    Join_Date, 
    TIMESTAMPDIFF(YEAR, Join_Date, CURDATE()) AS Experience_Years, 
    Salary / 30 AS Daily_Salary
FROM EMPLOYEE
LIMIT 1000;

INSERT INTO EMPLOYEE (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary, Join_Date) 
VALUES 
(109, 'Pooja Mehta', '50 Andheri East, Mumbai', '9988776655', 5, 'Admin', 209, 'CLERK', 30000.00, '2018-04-10'),
(110, 'Arvind Rao', '22 Indira Nagar, Bangalore', '9876541230', 2, 'Finance', 210, 'ANALYST', 60000.00, '2015-09-25'),
(111, 'Sneha Kapoor', '77 Connaught Place, Delhi', '8765432109', 1, 'HR', 211, 'CLERK', 32000.00, '2019-02-15'),
(112, 'Manoj Tiwari', '88 Boring Road, Patna', '7654321098', 3, 'IT', 212, 'ANALYST', 62000.00, '2014-07-08');
SELECT * 
FROM EMPLOYEE 
WHERE Designation = 'CLERK' OR Designation = 'ANALYST';

INSERT INTO EMPLOYEE (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary, Join_Date) 
VALUES 
(113, 'Ramesh Gupta', '10 Civil Lines, Lucknow', '9988771122', 1, 'HR', 213, 'MANAGER', 75000.00, '1981-05-01'),
(114, 'Kiran Desai', '25 MG Road, Pune', '9876547890', 2, 'Finance', 214, 'ANALYST', 60000.00, '1981-12-03'),
(115, 'Anita Joshi', '78 Rajaji Nagar, Bangalore', '8765434567', 3, 'IT', 215, 'CLERK', 35000.00, '1981-12-17'),
(116, 'Suresh Nair', '11 Marine Drive, Kochi', '7654321234', 4, 'Sales', 216, 'EXECUTIVE', 45000.00, '1980-01-19');
SELECT * 
FROM EMPLOYEE 
WHERE Join_Date IN ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19');

INSERT INTO EMPLOYEE (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary, Join_Date) 
VALUES 
(117, 'Amit Trivedi', '45 Sector 62, Noida', '9876543210', 10, 'Operations', 217, 'MANAGER', 85000.00, '2012-06-15'),
(118, 'Meera Shah', '12 Park Street, Kolkata', '8765432109', 20, 'Marketing', 218, 'EXECUTIVE', 50000.00, '2015-08-10'),
(119, 'Vikram Malhotra', '99 Banjara Hills, Hyderabad', '9988776655', 10, 'Operations', 219, 'CLERK', 30000.00, '2019-04-05'),
(120, 'Sonal Agarwal', '33 MG Road, Chennai', '7890123456', 20, 'Marketing', 220, 'ANALYST', 62000.00, '2018-11-22');

SELECT * 
FROM EMPLOYEE 
WHERE Dept_no IN (10, 20);

SELECT E_name 
FROM EMPLOYEE 
WHERE E_name LIKE 'S%';

INSERT INTO EMPLOYEE (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary, Join_Date) 
VALUES 
(125, 'Harish Mehta', '88 Nehru Nagar, Delhi', '9876543211', 5, 'Admin', 225, 'MANAGER', 78000.00, '2012-05-20'),
(126, 'Hemant Kumar', '12 Jubilee Hills, Hyderabad', '8765432198', 2, 'Finance', 226, 'ANALYST', 62000.00, '2016-09-10'),
(127, 'Hema Malini', '99 Marine Drive, Mumbai', '7654321987', 3, 'IT', 227, 'ENGINEER', 55000.00, '2018-11-25');
SELECT E_name, LEFT(E_name, 5) AS First_Five_Chars
FROM EMPLOYEE 
WHERE E_name LIKE 'H%';

SELECT * 
FROM EMPLOYEE 
WHERE Designation NOT IN ('PRESIDENT', 'MGR')
ORDER BY Salary ASC;





