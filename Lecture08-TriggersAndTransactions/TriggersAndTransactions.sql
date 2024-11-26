-- Database
CREATE DATABASE RDBMS;
USE RDBMS;

-- Creating Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Stock INT,
    Price DECIMAL(10, 2)
);

-- Creating AuditLog table
CREATE TABLE AuditLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    ActionTaken VARCHAR(100),
    ActionDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserting sample data into Products
INSERT INTO Products (ProductName, Stock, Price)
VALUES
('Laptop', 10, 1000.00),
('Smartphone', 25, 500.00);

-- 1. Trigger Example: Log product updates
DELIMITER //
CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (ProductID, ActionTaken)
    VALUES (NEW.ProductID, 'Product updated');
END;
//
DELIMITER ;

-- Updating the Products table to test the trigger
UPDATE Products
SET Price = 1200.00
WHERE ProductName = 'Laptop';

-- 2. Transaction Example: Money transfer between accounts
-- Creating Accounts table
CREATE TABLE Accounts (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    AccountHolder VARCHAR(100),
    Balance DECIMAL(10, 2)
);

-- Inserting sample data into Accounts
INSERT INTO Accounts (AccountHolder, Balance)
VALUES
('Yousuf', 5000.00),
('Muneeb', 3000.00);

-- Start a transaction
START TRANSACTION;

-- Deducting money from Alice's account
UPDATE Accounts
SET Balance = Balance - 1000.00
WHERE AccountHolder = 'Yousuf';

-- Adding money to Bob's account
UPDATE Accounts
SET Balance = Balance + 1000.00
WHERE AccountHolder = 'Muneeb';

-- COMMIT the transaction
COMMIT;
