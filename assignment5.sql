-- Create the database
CREATE DATABASE SailingDB;
USE SailingDB;
-- Create the Sailors table
CREATE TABLE Sailors (
    sid INT PRIMARY KEY, 
    sname VARCHAR(50), 
    rating INT, 
    age FLOAT
);
-- Create the Boats table
CREATE TABLE Boats (
    bid INT PRIMARY KEY, 
    bname VARCHAR(50), 
    color VARCHAR(20)
);
-- Create the Reserves table
CREATE TABLE Reserves (
    sid INT, 
    bid INT, 
    day DATE,
    PRIMARY KEY (sid, bid, day),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

-- Insert sample sailors
INSERT INTO Sailors (sid, sname, rating, age) VALUES
(1, 'Amit', 5, 24.5),
(2, 'Ravi', 7, 30.2),
(3, 'Priya', 4, 22.0),
(4, 'Suresh', 6, 35.0),
(5, 'Anjali', 8, 28.7);

-- Insert sample boats
INSERT INTO Boats (bid, bname, color) VALUES
(101, 'Ganga', 'red'),
(102, 'Yamuna', 'green'),
(103, 'Krishna', 'blue'),
(104, 'Godavari', 'red');

-- Insert sample reservations
INSERT INTO Reserves (sid, bid, day) VALUES
(1, 101, '2025-02-01'),
(2, 102, '2025-02-01'),
(3, 101, '2025-02-02'),
(4, 103, '2025-02-02'),
(5, 104, '2025-02-03'),
(1, 102, '2025-02-03'),
(2, 103, '2025-02-04'),
(3, 104, '2025-02-04');
SELECT * FROM Sailors;
SELECT * FROM Reserves;
SELECT * FROM Boats;

-- 1. Find all information of sailors who have reserved boat number 101.
SELECT S.* 
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 101;

-- 2. Find the name of the boat reserved by Ravi.
SELECT DISTINCT B.bname 
FROM Boats B
JOIN Reserves R ON B.bid = R.bid
JOIN Sailors S ON R.sid = S.sid
WHERE S.sname = 'Ravi';

-- 3. Find the names of sailors who have reserved a red boat, and list them in the order of age.
SELECT DISTINCT S.sname, S.age  
FROM Sailors S  
JOIN Reserves R ON S.sid = R.sid  
JOIN Boats B ON R.bid = B.bid  
WHERE B.color = 'red'  
ORDER BY S.age;


-- 4. Find the names of sailors who have reserved at least one boat.
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid;

-- 5. Find the IDs and names of sailors who have reserved two different boats on the same day.
SELECT DISTINCT S.sid, S.sname
FROM Sailors S
JOIN Reserves R1 ON S.sid = R1.sid
JOIN Reserves R2 ON S.sid = R2.sid
WHERE R1.bid <> R2.bid AND R1.day = R2.day;

-- 6. Find the IDs of sailors who have reserved a red boat or a green boat.
SELECT DISTINCT S.sid
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color IN ('red', 'green');

-- 7. Find the name and age of the youngest sailor.
SELECT S.sname, S.age 
FROM Sailors S
ORDER BY S.age ASC 
LIMIT 1;

-- 8. Count the number of different sailor names.
SELECT COUNT(DISTINCT S.sname) AS unique_sailors 
FROM Sailors S;

-- 9. Find the average age of sailors for each rating level.
SELECT S.rating, AVG(S.age) AS avg_age 
FROM Sailors S
GROUP BY S.rating;

-- 10. Find the average age of sailors for each rating level that has at least two sailors.
SELECT S.rating, AVG(S.age) AS avg_age
FROM Sailors S
GROUP BY S.rating
HAVING COUNT(S.sid) >= 2;


