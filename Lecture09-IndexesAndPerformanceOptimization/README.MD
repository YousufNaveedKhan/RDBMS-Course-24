# RDBMS Course - Lecture #9

## Indexes and Performance Optimization

Indexes are vital components of database systems, designed to enhance query performance by reducing data retrieval time. They act like a "table of contents" for your database, making it easier to locate data quickly.

---

### **What is an Index?**

An **Index** is a database structure that improves the speed of data retrieval. Instead of scanning every row in a table to find the desired data, the database engine uses the index to locate data efficiently.

### **Key Characteristics of Indexes**

1. **Faster Data Retrieval**: Queries execute faster by reducing the number of rows scanned.
2. **Storage Overhead**: Indexes occupy additional storage space.
3. **Write Performance Impact**: Inserts, updates, and deletes may take longer as indexes need to be updated.

---

## **Types of Indexes**

### 1. **Clustered Index**
- **Definition**: A clustered index sorts and stores the data rows in the table based on the key values. There can be only one clustered index per table.
- **Use Case**: Best for columns frequently used in range queries or sorting (e.g., `ID`, `Date`).

**Example (MySQL):**
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    HireDate DATE
);
```
In this example, the **primary key** creates a clustered index on `EmployeeID`.

---

### 2. **Non-Clustered Index**
- **Definition**: A non-clustered index maintains a separate structure from the table data, storing only pointers to the actual data rows.
- **Use Case**: Best for columns used in search or filtering (e.g., `Name`, `Department`).

**Example (SQL Server):**
```sql
CREATE NONCLUSTERED INDEX idx_EmployeeName
ON Employees (Name);
```
Here, a non-clustered index is created on the `Name` column for faster searches.

---

### **Unique Index**
- **Definition**: Ensures that all values in the indexed column are unique.
- **Use Case**: Enforce uniqueness on columns like `Email` or `Username`.

**Example:**
```sql
CREATE UNIQUE INDEX idx_Email ON Users (Email);
```

---

## **Improving Query Performance**

### **How Indexes Improve Performance**
1. **Speeds Up SELECT Queries**: Indexes reduce the number of rows scanned.
2. **Optimizes Sorting and Filtering**: Queries with `ORDER BY`, `WHERE`, or `JOIN` conditions execute faster.

---

### **When to Use Indexes**

- Use indexes for:
  - Frequently searched columns.
  - Columns used in joins or sorting.
  - Columns in `WHERE` or `HAVING` clauses.

- Avoid over-indexing, as it may:
  - Increase storage usage.
  - Slow down `INSERT`, `UPDATE`, and `DELETE` operations.

---

## **Best Practices for Database Optimization**

1. **Choose Appropriate Index Types**: Use clustered indexes for primary keys and non-clustered indexes for frequently searched fields.
2. **Limit the Number of Indexes**: Too many indexes can degrade performance.
3. **Regularly Monitor Index Usage**: Use tools like `EXPLAIN` (MySQL) or `Execution Plan` (SQL Server) to analyze query performance.
4. **Use Covering Indexes**: Include frequently queried columns in non-clustered indexes to avoid table lookups.
5. **Partition Large Tables**: Divide large tables into smaller chunks to improve query performance.

---

## **Real-Life Example**

### **Scenario: E-commerce Search Optimization**

Imagine an online store with millions of products. Customers frequently search for products by category, price, or name. Using indexes:

1. Create a **clustered index** on the `ProductID` for sorting and primary key access.
2. Add a **non-clustered index** on the `ProductName` and `Category` columns to optimize search queries.
3. Add a **unique index** on the `SKU` to ensure each product has a distinct identifier.

**Result**: Faster search results and better user experience.

---

## **Source Code Example**

#### **MySQL**

```sql
-- Create a table for products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY, -- Clustered Index
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Add a non-clustered index on ProductName
CREATE INDEX idx_ProductName
ON Products (ProductName);

-- Add a unique index on SKU
CREATE UNIQUE INDEX idx_SKU
ON Products (SKU);
```

#### **SQL Server**

```sql
-- Create a table for products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY CLUSTERED, -- Clustered Index
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price MONEY,
    SKU NVARCHAR(20)
);

-- Add a non-clustered index on Category
CREATE NONCLUSTERED INDEX idx_Category
ON Products (Category);

-- Add a unique index on SKU
CREATE UNIQUE INDEX idx_SKU
ON Products (SKU);
```

---

## **Key Points & Tips**

1. **Clustered Index**: Best for sorting and range queries.
2. **Non-Clustered Index**: Use for searching or filtering.
3. **Avoid Over-Indexing**: Too many indexes can slow down write operations.
4. **Analyze Performance**: Regularly monitor index usage and optimize as needed.

---

## **Summary**

In this lecture, we covered:
1. Types of indexes (Clustered, Non-Clustered, Unique).
2. Techniques for improving query performance.
3. Real-life applications and best practices for database optimization.

Explore the provided **MySQL** and **SQL Server** scripts for hands-on practice. Apply these concepts to improve the performance of your own database systems!