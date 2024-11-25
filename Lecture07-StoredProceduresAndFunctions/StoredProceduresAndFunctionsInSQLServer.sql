-- Database
CREATE DATABASE RDBMS;
USE RDBMS;

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    MonthlySalary DECIMAL(10, 2),
    DepartmentID INT
);

-- Inserting sample data into Employees
INSERT INTO Employees (EmployeeName, MonthlySalary, DepartmentID)
VALUES
('Yousuf', 5000, 1),
('Muneeb', 4500, 2),
('Khuzaima', 7000, 1),
('Huzaifa', 3000, 3);

-- 1. Stored Procedure Example: Calculate total salary for a department
CREATE PROCEDURE GetTotalDepartmentSalary
    @deptID INT
AS
BEGIN
    SELECT SUM(MonthlySalary) AS TotalSalary 
    FROM Employees 
    WHERE DepartmentID = @deptID;
END;

-- Execute the procedure
EXEC GetTotalDepartmentSalary @deptID = 1;

-- 2. Function Example: Convert monthly salary to annual salary
CREATE FUNCTION AnnualSalary(@monthlySalary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @monthlySalary * 12;
END;

-- Use the function
SELECT EmployeeName, dbo.AnnualSalary(MonthlySalary) AS AnnualSalary FROM Employees;
