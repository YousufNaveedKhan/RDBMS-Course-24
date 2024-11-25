-- Database
CREATE DATABASE RDBMS;
USE RDBMS;

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(100),
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
DELIMITER //
CREATE PROCEDURE GetTotalDepartmentSalary(IN deptID INT)
BEGIN
    SELECT SUM(MonthlySalary) AS TotalSalary 
    FROM Employees 
    WHERE DepartmentID = deptID;
END;
//
DELIMITER ;

-- Call the procedure
CALL GetTotalDepartmentSalary(1);

-- 2. Function Example: Convert monthly salary to annual salary
DELIMITER //
CREATE FUNCTION AnnualSalary(monthlySalary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
BEGIN
    RETURN monthlySalary * 12;
END;
//
DELIMITER ;

-- Use the function
SELECT EmployeeName, AnnualSalary(MonthlySalary) AS AnnualSalary FROM Employees;
