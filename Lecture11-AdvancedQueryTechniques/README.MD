# RDBMS Course - Lecture #11

## **Lecture 11: Advanced Query Techniques**

This lecture introduces advanced querying techniques such as Common Table Expressions (CTEs), window functions, and recursive queries. These techniques are invaluable for solving complex database problems efficiently and elegantly.

---

## **1. Common Table Expressions (CTEs)**

### **What Are CTEs?**
- A **CTE** is a temporary result set defined within the execution scope of a single `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement.
- Useful for simplifying complex queries and improving readability.

### **Practical Use Cases:**
- Replacing subqueries to improve clarity.
- Building recursive queries.
- Organizing data into a temporary structure.

#### **Syntax Example:**
```sql
WITH CTE_Name AS (
    SELECT Columns
    FROM Table
    WHERE Condition
)
SELECT * FROM CTE_Name;
```

#### **MySQL Example:**
```sql
WITH SalesCTE AS (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT EmployeeID, TotalSales
FROM SalesCTE
WHERE TotalSales > 5000;
```

#### **SQL Server Example:**
```sql
WITH HighPerformers AS (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
    HAVING SUM(SalesAmount) > 5000
)
SELECT EmployeeID, TotalSales
FROM HighPerformers;
```

---

## **2. Window Functions**

### **What Are Window Functions?**
- Perform calculations across a set of rows related to the current row.
- Do not collapse rows like aggregate functions; instead, they preserve the row context.

### **Practical Use Cases:**
- Calculating running totals, moving averages, or rankings.
- Identifying trends and patterns in data.

#### **Syntax Example:**
```sql
SELECT Column1,
       Column2,
       Function() OVER (PARTITION BY Column3 ORDER BY Column4) AS ComputedColumn
FROM TableName;
```

#### **MySQL Example:**
```sql
SELECT EmployeeID, 
       Salary, 
       RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS RankWithinDepartment
FROM Employees;
```

#### **SQL Server Example:**
```sql
SELECT EmployeeID, 
       Salary, 
       SUM(Salary) OVER (PARTITION BY DepartmentID ORDER BY Salary) AS RunningTotal
FROM Employees;
```

---

## **3. Recursive Queries**

### **What Are Recursive Queries?**
- Recursive queries use a **recursive CTE** to repeatedly execute a query until a result is achieved.
- Particularly useful for working with hierarchical data like organizational charts or folder structures.

### **Syntax Example:**
```sql
WITH RecursiveCTE AS (
    -- Anchor Member
    SELECT Columns
    FROM Table
    WHERE Condition

    UNION ALL

    -- Recursive Member
    SELECT Columns
    FROM Table
    INNER JOIN RecursiveCTE
    ON Table.Column = RecursiveCTE.Column
)
SELECT * FROM RecursiveCTE;
```

#### **MySQL Example:**
```sql
WITH RECURSIVE OrgChart AS (
    SELECT EmployeeID, ManagerID, 1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.ManagerID, oc.Level + 1
    FROM Employees e
    INNER JOIN OrgChart oc ON e.ManagerID = oc.EmployeeID
)
SELECT * FROM OrgChart;
```

#### **SQL Server Example:**
```sql
WITH OrgChart AS (
    SELECT EmployeeID, ManagerID, 1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.ManagerID, oc.Level + 1
    FROM Employees e
    INNER JOIN OrgChart oc ON e.ManagerID = oc.EmployeeID
)
SELECT * FROM OrgChart;
```

---

## **Real-Life Example: Hierarchical Data Analysis**

### Scenario:  
- **Objective**: Analyze an organizational structure where employees report to managers, and managers report to higher authorities.

### Solution:  
1. Use **Recursive Queries** to generate a hierarchical list of employees and managers.  
2. Apply **Window Functions** to calculate metrics like the total salary of subordinates.  
3. Combine with **CTEs** to improve query readability and performance.

---

## **Key Points and Best Practices**
1. **CTEs** enhance query readability, especially for multi-step data transformations.  
2. **Window Functions** are ideal for row-by-row calculations without reducing rows.  
3. **Recursive Queries** are essential for hierarchical data but can be performance-intensive. Optimize with proper indexing.  
4. Always test recursive queries for potential infinite loops by setting a **MAXRECURSION** limit in SQL Server or a base condition in MySQL.