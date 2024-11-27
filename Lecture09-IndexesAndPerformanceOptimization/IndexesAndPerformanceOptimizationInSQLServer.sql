-- Database Creation
CREATE DATABASE RDBMS;
GO
USE RDBMS;
GO

-- Create Products Table with Clustered Index (Implicit with PRIMARY KEY)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY CLUSTERED, -- Clustered Index
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50),
    Price MONEY,
    SKU NVARCHAR(20) UNIQUE -- Unique Index
);
GO

-- Insert Sample Data
INSERT INTO Products (ProductID, ProductName, Category, Price, SKU)
VALUES 
(1, 'Laptop', 'Electronics', 1200.50, 'LPT123'),
(2, 'Smartphone', 'Electronics', 800.00, 'SMP456'),
(3, 'Tablet', 'Electronics', 300.00, 'TBL789'),
(4, 'Headphones', 'Accessories', 50.00, 'HP001'),
(5, 'Charger', 'Accessories', 20.00, 'CHG002');
GO

-- Add Non-Clustered Index on ProductName
CREATE NONCLUSTERED INDEX idx_ProductName 
ON Products (ProductName);
GO

-- Add Non-Clustered Index on Category
CREATE NONCLUSTERED INDEX idx_Category 
ON Products (Category);
GO

-- Query Examples
-- 1. Search for Products by Category
SELECT * 
FROM Products 
WHERE Category = 'Electronics';
GO

-- 2. Search for a Product by Name
SELECT * 
FROM Products 
WHERE ProductName = 'Tablet';
GO

-- 3. Search for Products with Price > 100
SELECT * 
FROM Products 
WHERE Price > 100;
GO

-- Dropping the Database (Cleanup)
-- DROP DATABASE RDBMS;
GO
