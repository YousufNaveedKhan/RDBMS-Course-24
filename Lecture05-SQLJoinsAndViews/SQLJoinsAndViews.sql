-- Creating the RDBMS database
CREATE DATABASE IF NOT EXISTS RDBMS;
USE RDBMS;

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key for unique identification
    Name VARCHAR(100) NOT NULL,               -- Employee name
    DepartmentID INT                           -- Foreign Key references Departments
);

-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key for unique identification
    DepartmentName VARCHAR(100) NOT NULL         -- Name of the department
);

-- Inserting sample data into Employees
INSERT INTO Employees (Name, DepartmentID) VALUES
('Yousuf', 1),
('Muneeb', 2),
('Khuzaima', 3),
('Huzaifa', NULL); -- NULL represents no assigned department

-- Inserting sample data into Departments
INSERT INTO Departments (DepartmentName) VALUES
('Human Resources'),
('Finance'),
('IT');

-- Example 1: INNER JOIN - Fetching employees and their department names
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- Example 2: LEFT JOIN - Fetching all employees with department names
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- Example 3: RIGHT JOIN - Fetching all departments with employees
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- Example 4: FULL OUTER JOIN (simulated in MySQL using UNION)
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
UNION
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- Example 5: CROSS JOIN - Cartesian product of Employees and Departments
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;

-- Creating a view to simplify data retrieval
CREATE VIEW EmployeeDetails AS
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- Querying data from the view
SELECT * FROM EmployeeDetails;
