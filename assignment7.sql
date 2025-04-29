-- 1. Create and use the database
CREATE DATABASE SalesDB;
USE SalesDB;

-- 2. Create tables
CREATE TABLE Salesperson (
    Snum INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Commission DECIMAL(4,2)
);

CREATE TABLE Customer (
    Cnum INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Rating INT,
    Snum INT,
    FOREIGN KEY (Snum) REFERENCES Salesperson(Snum)
);

CREATE TABLE Orders (
    Onum INT PRIMARY KEY,
    Amount DECIMAL(10,2),
    OrderDate DATE,
    Cnum INT,
    Snum INT,
    FOREIGN KEY (Cnum) REFERENCES Customer(Cnum),
    FOREIGN KEY (Snum) REFERENCES Salesperson(Snum)
);

-- 3. Insert data from the PDF

-- Salesperson
INSERT INTO Salesperson VALUES 
(1001, 'Peel', 'London', 0.12),
(1002, 'Serres', 'San Jose', 0.13),
(1004, 'Motika', 'London', 0.11),
(1007, 'Rifkin', 'Barcelona', 0.15),
(1003, 'Axelrod', 'New York', 0.10);

-- Customer
INSERT INTO Customer VALUES 
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

-- Orders
INSERT INTO Orders VALUES 
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-04-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002);

-- 4. Show all tables before queries

SELECT * FROM Salesperson;
SELECT * FROM Customer;
SELECT * FROM Orders;

-- 5. Assignment Queries

-- a. Count Salesperson names starting with A/a
SELECT COUNT(*) 
FROM Salesperson 
WHERE Name LIKE 'A%';

-- b. Salespersons whose ALL orders are > 2000
SELECT S.Snum, S.Name 
FROM Salesperson S
WHERE NOT EXISTS (
    SELECT * 
    FROM Orders O 
    WHERE O.Snum = S.Snum AND O.Amount <= 2000
);

-- c. Count of Salespersons from New York
SELECT COUNT(*) 
FROM Salesperson 
WHERE City = 'New York';

-- d. Number of Salespersons in London and Paris (Paris not in data, so adjust)
SELECT City, COUNT(*) AS Num_Salespeople
FROM Salesperson
WHERE City IN ('London', 'Paris')
GROUP BY City;

-- e. Number of orders per Salesperson and date
SELECT Snum, OrderDate, COUNT(*) AS Num_Orders
FROM Orders
GROUP BY Snum, OrderDate;

-- f. Salespeople registering orders per day
SELECT OrderDate, COUNT(DISTINCT Snum) AS Num_Salespeople
FROM Orders
GROUP BY OrderDate;

-- g. First customer alphabetically whose name starts with 'G'
SELECT * 
FROM Customer 
WHERE Name LIKE 'G%' 
ORDER BY Name 
LIMIT 1;

-- h. Largest orders for Salesperson 1002 & 1007
SELECT Snum, MAX(Amount) AS Max_Order
FROM Orders
WHERE Snum IN (1002, 1007)
GROUP BY Snum;

-- i. Max single order > 3000 per Salesperson per day
SELECT Snum, OrderDate, MAX(Amount) AS Max_Order
FROM Orders
WHERE Amount > 3000
GROUP BY Snum, OrderDate;

-- j. Salespersons from same city with same commission
SELECT City, Commission, COUNT(*) AS Num_Salespeople
FROM Salesperson
GROUP BY City, Commission
HAVING COUNT(*) > 1;