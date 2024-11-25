# RDBMS Course - Lecture #6

## Subqueries and Nested Queries

In this lecture, we will explore **subqueries** and **nested queries**, which are powerful tools for breaking down complex SQL operations. Subqueries are queries nested within another query to provide intermediate results or filtering. We will also discuss performance considerations and best practices for writing efficient nested queries.

---

### **1. What are Subqueries?**

A **subquery** is a query embedded within another SQL statement. It is used to retrieve data for the main query and is often placed in the `WHERE`, `FROM`, or `SELECT` clauses.

**Example:**
Find employees who earn more than the average salary in the company.

```sql
SELECT EmployeeName 
FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
```

---

### **2. Types of Subqueries**

1. **Single-row Subquery**: Returns a single value (e.g., scalar result).
2. **Multi-row Subquery**: Returns multiple values that can be used with operators like `IN`, `ANY`, or `ALL`.
3. **Correlated Subquery**: Refers to columns from the outer query and is evaluated repeatedly for each row.

---

### **3. Nested Queries**

Nested queries involve placing one query inside another to refine results or perform calculations.

#### **Key Differences Between Subqueries and Nested Queries:**
- Subqueries are typically placed in specific clauses (`WHERE`, `FROM`, `SELECT`).
- Nested queries may contain multiple layers of queries inside each other.

---

### **4. Performance Considerations**
- **Use indexes**: Ensure that the columns in subqueries are indexed to improve performance.
- **Avoid correlated subqueries**: They execute repeatedly and can be resource-intensive.
- **Consider joins**: For some cases, joins can be more efficient than subqueries.

---

### **5. Practical Examples**

#### **Single-row Subquery**
Find the highest-paid employee:
```sql
SELECT EmployeeName 
FROM Employees 
WHERE Salary = (SELECT MAX(Salary) FROM Employees);
```

#### **Multi-row Subquery**
Find employees who work in departments located in New York:
```sql
SELECT EmployeeName 
FROM Employees 
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Location = 'New York');
```

#### **Correlated Subquery**
List employees whose salary is above the average for their department:
```sql
SELECT EmployeeName 
FROM Employees E1 
WHERE Salary > (SELECT AVG(Salary) FROM Employees E2 WHERE E1.DepartmentID = E2.DepartmentID);
```

---

### **6. Key Points**
- Subqueries can simplify complex SQL queries.
- Use joins as an alternative when performance is a concern.
- Avoid nesting queries unnecessarily to prevent performance degradation.

---

### **Summary**
- Subqueries are an essential tool for breaking down complex problems into manageable parts.
- Nested queries allow for deep filtering and analysis.
- Proper indexing and query design can optimize performance for subqueries and nested queries.
```