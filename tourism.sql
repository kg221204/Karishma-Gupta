-- Tourism Management System by Karishma Gupta
CREATE DATABASE tourism_db;
USE tourism_db;

CREATE TABLE Bookings (
 BookingID INT PRIMARY KEY,
 CustomerName VARCHAR(50),
 City VARCHAR(50),
 Package VARCHAR(50),
 Amount INT,
 BookingDate DATE
);

INSERT INTO Bookings VALUES
(1001,'Amit','Goa','Beach Retreat',15000,'2024-01-05'),
(1002,'Neha','Manali','Mountain Trek',12000,'2024-01-07'),
(1003,'Rohan','Delhi','City Tour',8000,'2024-01-08'),
(1004,'Priya','Goa','Beach Retreat',15000,'2024-02-10'),
(1005,'Vikas','Jaipur','Heritage Walk',7000,'2024-02-15'),
(1006,'Anjali','Kochi','Backwaters Stay',10000,'2024-03-01'),
(1007,'Suresh','Jaisalmer','Desert Safari',9000,'2024-03-10'),
(1008,'Karishma','Shimla','Hill Station Getaway',11000,'2024-03-20');

-- 1. City-wise Revenue
SELECT City, SUM(Amount) as Total_Revenue FROM Bookings GROUP BY City ORDER BY Total_Revenue DESC;

-- 2. Popular Package
SELECT Package, COUNT(*) as Bookings FROM Bookings GROUP BY Package ORDER BY Bookings DESC;

-- 3. Monthly Trend
SELECT MONTH(BookingDate) as Month, SUM(Amount) as Revenue FROM Bookings GROUP BY Month;