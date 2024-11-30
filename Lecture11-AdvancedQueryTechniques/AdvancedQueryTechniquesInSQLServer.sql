-- Lecture 11: Advanced Query Techniques (SQL Server)

-- Step 1: Create Database
CREATE DATABASE RDBMS_AdvancedQueries;
GO

-- Step 2: Use Database
USE RDBMS_AdvancedQueries;
GO

-- Step 3: Create Employee and Sales Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    ManagerID INT NULL
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    SalesAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO

-- Step 4: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, DepartmentID, ManagerID)
VALUES 
(1, 'Yousuf Naveed', 1, NULL), 
(2, 'Khuzaima Ahmed', 1, 1), 
(3, 'Huzaifa Iqbal', 2, 1), 
(4, 'Muneeb Hassan', 2, 2);

INSERT INTO Sales (SaleID, EmployeeID, SalesAmount)
VALUES 
(1, 1, 5000.00), 
(2, 2, 3000.00), 
(3, 3, 4000.00), 
(4, 4, 2500.00);
GO

-- Step 5: Common Table Expression (CTE)
WITH SalesSummary AS (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT * 
FROM SalesSummary
WHERE TotalSales > 3000;
GO

-- Step 6: Window Functions
SELECT EmployeeID, 
       SUM(SalesAmount) OVER (PARTITION BY EmployeeID ORDER BY SaleID) AS RunningTotal,
       RANK() OVER (PARTITION BY EmployeeID ORDER BY SalesAmount DESC) AS SalesRank
FROM Sales;
GO

-- Step 7: Recursive Query (Hierarchical Data)
WITH OrgChart AS (
    SELECT EmployeeID, Name, ManagerID, 1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.Name, e.ManagerID, oc.Level + 1
    FROM Employees e
    INNER JOIN OrgChart oc ON e.ManagerID = oc.EmployeeID
)
SELECT * FROM OrgChart;
GO
