-- Database Creation
CREATE DATABASE RDBMS;
USE RDBMS;

-- Create Products Table with Clustered Index (Implicit with PRIMARY KEY)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT, -- Clustered Index
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    SKU VARCHAR(20) UNIQUE -- Unique Index
);

-- Insert Sample Data
INSERT INTO Products (ProductName, Category, Price, SKU) 
VALUES 
('Laptop', 'Electronics', 1200.50, 'LPT123'),
('Smartphone', 'Electronics', 800.00, 'SMP456'),
('Tablet', 'Electronics', 300.00, 'TBL789'),
('Headphones', 'Accessories', 50.00, 'HP001'),
('Charger', 'Accessories', 20.00, 'CHG002');

-- Add Non-Clustered Index on ProductName
CREATE INDEX idx_ProductName 
ON Products (ProductName);

-- Add Non-Clustered Index on Category
CREATE INDEX idx_Category 
ON Products (Category);

-- Query Examples
-- 1. Search for Products by Category
SELECT * 
FROM Products 
WHERE Category = 'Electronics';

-- 2. Search for a Product by Name
SELECT * 
FROM Products 
WHERE ProductName = 'Tablet';

-- 3. Search for Products with Price > 100
SELECT * 
FROM Products 
WHERE Price > 100;

-- Dropping the Database (Cleanup)
-- DROP DATABASE RDBMS;
