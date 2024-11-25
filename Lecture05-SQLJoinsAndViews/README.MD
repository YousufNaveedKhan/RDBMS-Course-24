# RDBMS Course - Lecture #5

## SQL Joins and Views

In this lecture, we will explore two powerful SQL concepts: **Joins** and **Views**. These are essential tools for retrieving and managing data across multiple tables efficiently.

---

## SQL Joins

**Joins** are used to retrieve data from two or more tables based on a related column between them. Different types of joins allow us to control how data is matched and combined from these tables.

### **Types of Joins**
1. **Inner Join**  
   Retrieves records that have matching values in both tables.  
   **Example in Practice**:
   ```sql
   SELECT Employees.Name, Departments.DepartmentName
   FROM Employees
   INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
   ```
   This query fetches only employees who are assigned to a department.

2. **Left Join (or Left Outer Join)**  
   Retrieves all records from the left table, and the matched records from the right table. If there’s no match, NULL is returned for the right table’s columns.  
   **Example in Practice**:
   ```sql
   SELECT Employees.Name, Departments.DepartmentName
   FROM Employees
   LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
   ```
   This query includes all employees, even those who are not assigned to any department.

3. **Right Join (or Right Outer Join)**  
   Retrieves all records from the right table, and the matched records from the left table. If there’s no match, NULL is returned for the left table’s columns.  
   **Example in Practice**:
   ```sql
   SELECT Employees.Name, Departments.DepartmentName
   FROM Employees
   RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
   ```

4. **Full Join (or Full Outer Join)**  
   Combines the results of both Left and Right Joins. Returns all records from both tables, with NULLs where there is no match.  
   **Example in Practice**:
   ```sql
   SELECT Employees.Name, Departments.DepartmentName
   FROM Employees
   FULL OUTER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
   ```

5. **Cross Join**  
   Returns the Cartesian product of two tables. Every row in the first table is matched with every row in the second table.  
   **Example in Practice**:
   ```sql
   SELECT Employees.Name, Departments.DepartmentName
   FROM Employees
   CROSS JOIN Departments;
   ```

---

## Database Views

A **View** is a virtual table based on the result of a SQL query. It does not store data physically but provides a way to simplify complex queries and enhance security.

### **Creating a View**
To create a view, use the `CREATE VIEW` statement:
```sql
CREATE VIEW EmployeeDetails AS
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
```
This creates a view named `EmployeeDetails` to show employee names and their department names.

### **Querying a View**
Once a view is created, it can be queried like a regular table:
```sql
SELECT * FROM EmployeeDetails;
```

### **Advantages of Using Views**
1. **Simplification**: Combines complex queries into a single view.
2. **Security**: Restricts access to specific rows or columns.
3. **Reusability**: Reusable for multiple queries without writing redundant code.

### **Managing Views**
- **Updating a View**:  
   ```sql
   CREATE OR REPLACE VIEW EmployeeDetails AS
   SELECT Employees.Name, Departments.DepartmentName
   FROM Employees
   LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
   ```
- **Dropping a View**:  
   ```sql
   DROP VIEW EmployeeDetails;
   ```

---

## Practical Demonstration

### Tables Used
1. **Employees**: Contains employee data with a `DepartmentID` foreign key.
2. **Departments**: Contains department details with a primary key `DepartmentID`.

### Steps Demonstrated
1. **Creating Joins**:  
   Using `INNER`, `LEFT`, `RIGHT`, `FULL`, and `CROSS` joins to retrieve combined data.
2. **Creating Views**:  
   Simplifying complex queries and restricting column access using views.
3. **Querying Views**:  
   Running `SELECT` queries on views for efficient data retrieval.

---

## Key Points and Professional Tips
1. Use **Inner Joins** for retrieving matched records only.
2. Use **Left Joins** to include all records from the main (left) table, even without matches.
3. Views are great for hiding complex logic and providing security for sensitive data.
4. Always name views and joins meaningfully to improve code readability.
5. Test joins on smaller datasets to verify their accuracy before applying them to large tables.
6. Avoid `CROSS JOIN` unless explicitly required, as it can result in very large datasets.

---

## SQL Concepts Demonstrated in the Scripts
1. **Joins**: Inner, Left, Right, Full, and Cross Joins.
2. **Views**: Creating, querying, and managing database views.
3. **Combining Data**: Using joins to link data from related tables.

---

## Summary
In this lecture, you learned:
- The types of SQL Joins and their practical applications.
- How to create and manage database views.
- Real-world use cases for views to simplify and secure data retrieval.

Explore the provided MySQL and SQL Server scripts to practice these concepts. Experiment with different join types and views to deepen your understanding.
