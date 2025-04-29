-- Step 1: Create the database and use it
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- Step 2: Drop EMP table if it already exists (for clean re-run)
DROP TABLE IF EXISTS EMP;

-- Step 3: Create the EMP table with all constraints
CREATE TABLE EMP (
    EMPNO INT(6),
    ENAME VARCHAR(20) NOT NULL,
    JOB VARCHAR(10) NOT NULL,
    DEPTNO INT(3) UNIQUE,               -- Unique constraint on DEPTNO
    SAL DECIMAL(7,2),
    CONSTRAINT chk_empno CHECK (EMPNO > 100),  -- CHECK: empno > 100 (MySQL 8.0.16+)
    CONSTRAINT pk_emp PRIMARY KEY (EMPNO)      -- Primary Key on EMPNO
);

-- Step 4: Insert valid data into EMP table
INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL)
VALUES 
    (101, 'JOHN DOE', 'CLERK', 10, 3000.00),
    (102, 'JANE DOE', 'MANAGER', 20, 5000.00),
    (103, 'MARK SMITH', 'ANALYST', 30, 4000.00),
    (104, 'ALICE GREEN', 'SALESMAN', 40, 2800.00),
    (105, 'BOB WILSON', 'CLERK', 50, 2500.00);

-- Step 5: Queries to Practice Constraints

-- 🔸 Test Primary Key Constraint: Duplicate EMPNO (will fail)
-- INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL)
-- VALUES (101, 'DUPLICATE EMP', 'CLERK', 60, 2100.00);

-- 🔸 Test CHECK Constraint: EMPNO <= 100 (will fail if CHECK enforced)
-- INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL)
-- VALUES (99, 'LOW EMPNO', 'ANALYST', 60, 2700.00);

-- 🔸 Test UNIQUE Constraint: Duplicate DEPTNO (will fail)
-- INSERT INTO EMP (EMPNO, ENAME, JOB, DEPTNO, SAL)
-- VALUES (106, 'DUP DEPT', 'CLERK', 10, 2300.00);

-- 🔸 Test NOT NULL Constraint: Missing ENAME (will fail)
-- INSERT INTO EMP (EMPNO, JOB, DEPTNO, SAL)
-- VALUES (107, 'CLERK', 70, 2000.00);

-- 🔸 Test NOT NULL Constraint: Missing JOB (will fail)
-- INSERT INTO EMP (EMPNO, ENAME, DEPTNO, SAL)
-- VALUES (108, 'NO JOB', 80, 2900.00);

-- Step 6 (Optional): View all rows
SELECT * FROM EMP;
