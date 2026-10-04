
CREATE DATABASE tourism_db;
USE tourism_db;

-- TABLE 1: ADMIN LOGIN KE LIYE
CREATE TABLE admin (
  AdminID INT AUTO_INCREMENT PRIMARY KEY,
  Username VARCHAR(50),
  Password VARCHAR(50)
);
INSERT INTO admin VALUES (1, 'admin', 'admin123');

-- TABLE 2: USER / CUSTOMER DETAILS
CREATE TABLE users (
  UserID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  Phone VARCHAR(15)
);
INSERT INTO users (Name, Email, Phone) VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210'),
('Priya Verma', 'priya@gmail.com', '9876543211'),
('Aman Singh', 'aman@gmail.com', '9876543212'),
('Neha Gupta', 'neha@gmail.com', '9876543213'),
('Vikash Kumar', 'vikash@gmail.com', '9876543214'),
('Anjali Singh', 'anjali@gmail.com', '9876543215');

-- TABLE 3: TOUR PACKAGES
CREATE TABLE packages (
  PackageID INT AUTO_INCREMENT PRIMARY KEY,
  PackageName VARCHAR(100),
  City VARCHAR(50),
  Price INT,
  Duration VARCHAR(50)
);
INSERT INTO packages VALUES
(1, 'Beach Retreat', 'Goa', 15000, '4 Days / 3 Nights'),
(2, 'Mountain Trek', 'Manali', 12000, '5 Days / 4 Nights'),
(3, 'Heritage Tour', 'Jaipur', 10000, '3 Days / 2 Nights'),
(4, 'Houseboat Special', 'Kerala', 18000, '4 Days / 3 Nights'),
(5, 'Temple Tour', 'Varanasi', 8000, '2 Days / 1 Night');

-- TABLE 4: BOOKINGS - YE MAIN TABLE HAI (SAARE SAAL KA DATA ISME HAI)
CREATE TABLE bookings (
  BookingID INT AUTO_INCREMENT PRIMARY KEY,
  CustomerName VARCHAR(100),
  City VARCHAR(50),
  Package VARCHAR(100),
  Amount INT,
  BookingDate DATE,
  BookingYear INT,
  Status VARCHAR(20)
);

-- PURE SAAL 2024 KA DATA (12 MAHINE KA)
INSERT INTO bookings (CustomerName, City, Package, Amount, BookingDate, BookingYear, Status) VALUES
('Rahul Sharma', 'Goa', 'Beach Retreat', 15000, '2024-01-15', 2024, 'Confirmed'),
('Priya Verma', 'Manali', 'Mountain Trek', 12000, '2024-02-10', 2024, 'Confirmed'),
('Aman Singh', 'Jaipur', 'Heritage Tour', 10000, '2024-03-05', 2024, 'Confirmed'),
('Neha Gupta', 'Goa', 'Beach Retreat', 15000, '2024-03-20', 2024, 'Confirmed'),
('Vikash Kumar', 'Kerala', 'Houseboat Special', 18000, '2024-04-12', 2024, 'Confirmed'),
('Anjali Singh', 'Varanasi', 'Temple Tour', 8000, '2024-05-01', 2024, 'Confirmed'),
('Rahul Sharma', 'Goa', 'Beach Retreat', 15000, '2024-06-18', 2024, 'Confirmed'),
('Priya Verma', 'Goa', 'Beach Retreat', 15000, '2024-07-22', 2024, 'Confirmed'),
('Aman Singh', 'Manali', 'Mountain Trek', 12000, '2024-08-10', 2024, 'Confirmed'),
('Neha Gupta', 'Jaipur', 'Heritage Tour', 10000, '2024-09-15', 2024, 'Confirmed'),
('Vikash Kumar', 'Goa', 'Beach Retreat', 15000, '2024-10-05', 2024, 'Confirmed'),
('Anjali Singh', 'Kerala', 'Houseboat Special', 18000, '2024-11-20', 2024, 'Confirmed'),
('Rahul Sharma', 'Manali', 'Mountain Trek', 12000, '2024-12-25', 2024, 'Confirmed');

-- TABLE 5: PAYMENTS REPORT KE LIYE
CREATE TABLE payments (
  PaymentID INT AUTO_INCREMENT PRIMARY KEY,
  BookingID INT,
  PaymentMode VARCHAR(20),
  PaymentStatus VARCHAR(20)
);
INSERT INTO payments (BookingID, PaymentMode, PaymentStatus) VALUES
(1, 'UPI', 'Paid'), (2, 'Card', 'Paid'), (3, 'UPI', 'Paid'),
(4, 'UPI', 'Paid'), (5, 'Card', 'Paid'), (6, 'UPI', 'Paid'),
(7, 'UPI', 'Paid'), (8, 'UPI', 'Paid'), (9, 'Card', 'Paid'),
(10, 'UPI', 'Paid'), (11, 'UPI', 'Paid'), (12, 'Card', 'Paid'), (13, 'UPI', 'Paid');