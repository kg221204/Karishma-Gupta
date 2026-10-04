-- DATABASE BANAO
CREATE DATABASE IF NOT EXISTS tourism_db;
USE tourism_db;

-- 1. ADMIN TABLE
CREATE TABLE admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL
);

INSERT INTO admin (Username, Password) VALUES
('admin', 'admin123');

-- 2. USERS TABLE
CREATE TABLE users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

INSERT INTO users (Name, Email, Phone) VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210'),
('Priya Verma', 'priya@gmail.com', '9876543211'),
('Aman Singh', 'aman@gmail.com', '9876543212'),
('Neha Gupta', 'neha@gmail.com', '9876543213'),
('Vikash Kumar', 'vikash@gmail.com', '9876543214');

-- 3. PACKAGES TABLE
CREATE TABLE packages (
    PackageID INT AUTO_INCREMENT PRIMARY KEY,
    PackageName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Price INT NOT NULL,
    Duration VARCHAR(50)
);

INSERT INTO packages (PackageName, City, Price, Duration) VALUES
('Beach Retreat', 'Goa', 15000, '4 Days / 3 Nights'),
('Mountain Trek', 'Manali', 12000, '5 Days / 4 Nights'),
('Heritage Tour', 'Jaipur', 10000, '3 Days / 2 Nights'),
('Houseboat Special', 'Kerala', 18000, '4 Days / 3 Nights'),
('Temple Tour', 'Varanasi', 8000, '2 Days / 1 Night');

-- 4. BOOKINGS TABLE - MAIN TABLE
CREATE TABLE bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Package VARCHAR(100),
    Amount INT,
    BookingDate DATE,
    Status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (UserID) REFERENCES users(UserID)
);

INSERT INTO bookings (UserID, CustomerName, City, Package, Amount, BookingDate, Status) VALUES
(1, 'Rahul Sharma', 'Goa', 'Beach Retreat', 15000, '2024-03-10', 'Confirmed'),
(2, 'Priya Verma', 'Manali', 'Mountain Trek', 12000, '2024-03-15', 'Confirmed'),
(3, 'Aman Singh', 'Jaipur', 'Heritage Tour', 10000, '2024-04-02', 'Confirmed'),
(4, 'Neha Gupta', 'Goa', 'Beach Retreat', 15000, '2024-04-10', 'Confirmed'),
(5, 'Vikash Kumar', 'Kerala', 'Houseboat Special', 18000, '2024-04-12', 'Pending'),
(1, 'Rahul Sharma', 'Varanasi', 'Temple Tour', 8000, '2024-05-01', 'Confirmed'),
(2, 'Priya Verma', 'Goa', 'Beach Retreat', 15000, '2024-05-05', 'Confirmed'),
(3, 'Aman Singh', 'Goa', 'Beach Retreat', 15000, '2024-05-20', 'Confirmed');

-- 5. PAYMENTS TABLE
CREATE TABLE payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    PaymentMode VARCHAR(20),
    PaymentStatus VARCHAR(20) DEFAULT 'Paid',
    FOREIGN KEY (BookingID) REFERENCES bookings(BookingID)
);

INSERT INTO payments (BookingID, PaymentMode, PaymentStatus) VALUES
(1, 'UPI', 'Paid'),
(2, 'Card', 'Paid'),
(3, 'UPI', 'Paid'),
(4, 'UPI', 'Paid'),
(5, 'Cash', 'Pending'),
(6, 'UPI', 'Paid'),
(7, 'Card', 'Paid'),
(8, 'UPI', 'Paid');

-- ANALYSIS KE LIYE QUERIES (README me daal dena)

-- Total Revenue
-- SELECT SUM(Amount) as Total_Revenue FROM bookings;

-- Top City
-- SELECT City, COUNT(*) as Total_Bookings, SUM(Amount) as Revenue FROM bookings GROUP BY City ORDER BY Revenue DESC;

-- Best Selling Package
-- SELECT Package, COUNT(*) as Total_Sold FROM bookings GROUP BY Package ORDER BY Total_Sold DESC;

-- Monthly Trend
-- SELECT MONTH(BookingDate) as Month, COUNT(*) as Bookings FROM bookings GROUP BY MONTH(BookingDate);