-- Step 1: Create a database
CREATE DATABASE IF NOT EXISTS TransactionDB;
USE TransactionDB;

-- Step 2: Create a sample table
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Step 3: Start a transaction manually
START TRANSACTION;

-- Step 4: Insert some records
INSERT INTO Products (ProductID, ProductName, Price) VALUES (1, 'Laptop', 800.00);
INSERT INTO Products (ProductID, ProductName, Price) VALUES (2, 'Smartphone', 400.00);

-- Step 5: Create a SAVEPOINT after these inserts
SAVEPOINT Savepoint_A;
SELECT * FROM Products;
-- Step 6: Insert more records
INSERT INTO Products (ProductID, ProductName, Price) VALUES (3, 'Tablet', 300.00);
INSERT INTO Products (ProductID, ProductName, Price) VALUES (4, 'Smartwatch', 200.00);

-- Step 7: Create another SAVEPOINT
SAVEPOINT Savepoint_B;
SELECT * FROM Products;
-- Step 8: Insert another record (we will rollback this later)
INSERT INTO Products (ProductID, ProductName, Price) VALUES (5, 'Headphones', 150.00);
SELECT * FROM Products;
-- Step 9: Rollback to Savepoint_B (removes 'Headphones' insert)
ROLLBACK TO Savepoint_B;
SELECT * FROM Products;
-- Step 10: Now commit the transaction to save everything else
COMMIT;

-- Step 11: View the final records
SELECT * FROM Products;

