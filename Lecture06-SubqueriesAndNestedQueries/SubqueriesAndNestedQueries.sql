-- Database
CREATE DATABASE RDBMS;
USE RDBMS;

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
);

-- Inserting sample data into Departments
INSERT INTO Departments (DepartmentName, Location)
VALUES 
('Sales', 'Karachi'),
('IT', 'Lahore'),
('HR', 'Islamabad');

-- Inserting sample data into Employees
INSERT INTO Employees (EmployeeName, Salary, DepartmentID)
VALUES
('Yousuf', 70000, 1),
('Muneeb', 50000, 2),
('Khuzaima', 60000, 1),
('Huzaifa', 45000, 3),
('Shoaib', 80000, 2);

-- 1. Subquery Example: Find employees earning above the average salary
SELECT EmployeeName 
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 2. Multi-row Subquery Example: Find employees in departments located in 'Karachi' or 'Lahore'
SELECT EmployeeName 
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Location IN ('Karachi', 'Lahore'));

-- 3. Correlated Subquery Example: Find employees whose salary is above the average salary for their department
SELECT EmployeeName 
FROM Employees E1
WHERE Salary > (SELECT AVG(Salary) FROM Employees E2 WHERE E1.DepartmentID = E2.DepartmentID);
