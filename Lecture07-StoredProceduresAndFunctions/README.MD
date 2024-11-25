# RDBMS Course - Lecture #7

## Stored Procedures and Functions

In this lecture, we will learn about **stored procedures** and **user-defined functions**, which allow you to encapsulate and reuse SQL logic. We will also explore parameterized queries and error handling to build robust database solutions.

---

### **1. Stored Procedures**

A **stored procedure** is a precompiled SQL block that can be executed with a single call. It is commonly used to encapsulate business logic and reduce redundant queries.

**Example:**
Create a stored procedure to calculate the total salary for a department:
```sql
CREATE PROCEDURE CalculateDepartmentSalary(@DeptID INT)
AS
BEGIN
    SELECT SUM(Salary) AS TotalSalary 
    FROM Employees 
    WHERE DepartmentID = @DeptID;
END;
```

---

### **2. User-Defined Functions**

A **user-defined function (UDF)** is a reusable SQL block that returns a value. Functions can be used in queries like built-in SQL functions (`SUM`, `AVG`).

**Example:**
Create a function to calculate annual salary:
```sql
CREATE FUNCTION CalculateAnnualSalary(@MonthlySalary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @MonthlySalary * 12;
END;
```

---

### **3. Parameterized Queries**

Parameterized queries use placeholders to prevent SQL injection and simplify dynamic query execution.

**Example:**
Retrieve employees by department:
```sql
DECLARE @DeptID INT = 1;
SELECT EmployeeName 
FROM Employees 
WHERE DepartmentID = @DeptID;
```

---

### **4. Error Handling**

In SQL Server, error handling is done using `TRY...CATCH` blocks, while MySQL uses `DECLARE` and `HANDLER`.

**SQL Server Example:**
```sql
BEGIN TRY
    -- Code that may cause an error
    SELECT * FROM NonExistentTable;
END TRY
BEGIN CATCH
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;
```

**MySQL Example:**
```sql
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    SELECT 'An error occurred.';
END;
```

---

### **5. Practical Examples**

#### **Stored Procedure**
Find the total salary for all departments:
```sql
CREATE PROCEDURE GetTotalSalaries()
BEGIN
    SELECT DepartmentID, SUM(Salary) AS TotalSalary 
    FROM Employees 
    GROUP BY DepartmentID;
END;
```

#### **Function**
Convert a monthly salary to an annual salary:
```sql
CREATE FUNCTION AnnualSalary(MonthlySalary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
BEGIN
    RETURN MonthlySalary * 12;
END;
```

---

### **6. Key Points**
- Stored procedures encapsulate reusable logic.
- Functions return values and can be used in SQL expressions.
- Always use parameterized queries to prevent SQL injection.
- Implement error handling for robust query execution.

---

### **Summary**
- Stored procedures and functions are essential for modular and maintainable database design.
- They simplify complex queries and promote code reuse.
- Parameterized queries enhance security, and error handling ensures reliability.
```