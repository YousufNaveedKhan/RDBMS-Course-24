# **RDBMS Course - Lecture #9**

## **Indexes and Performance Optimization**

In this lecture, we explore the critical role of indexes in SQL databases and how they can significantly enhance query performance. We'll cover types of indexes, practical examples, and best practices for optimization.

---

## **What Are Indexes?**

Indexes in SQL are database objects that improve the speed of data retrieval operations on a table. They function like a "table of contents" in a book, helping the database locate data more efficiently.

Without indexes, the database engine would need to scan every row in the table to find the desired data, which can be very slow for large datasets.

---

## **Types of Indexes**

SQL supports various types of indexes, each designed for specific use cases. Below are the **6 important types of indexes in SQL**:

1. **Clustered Index**  
   - Sorts and stores data rows in the table based on key values.  
   - Only one clustered index is allowed per table.  
   - Example: Primary keys often create a clustered index automatically.

2. **Non-Clustered Index**  
   - Maintains a separate structure from the data rows, pointing to the actual data.  
   - A table can have multiple non-clustered indexes.

3. **Unique Index**  
   - Ensures all values in the indexed column(s) are unique.  
   - Used to enforce unique constraints like email addresses or usernames.

4. **Full-Text Index**  
   - Enables efficient searching of textual data.  
   - Supports advanced text queries, such as finding words or phrases.

5. **Composite Index**  
   - Combines multiple columns into a single index.  
   - Useful for queries involving multiple conditions.

6. **Filtered Index**  
   - Applies to a subset of rows based on a filter condition.  
   - Enhances performance for queries targeting specific data.

### **Visual Representation**

Below is a diagram that summarizes these types of indexes:  
![Types of Indexes in SQL](https://api.reliasoftware.com/uploads/types_of_indexes_in_sql_e71c79b2d7.webp)

---

## **Practical Examples**

### **Clustered Index**

- Automatically created on a table’s primary key.  
- Example: Searching for a product using its ID (a primary key).

```sql
-- Example of Clustered Index in MySQL/SQL Server
CREATE TABLE Products (
    ProductID INT PRIMARY KEY, -- Clustered Index
    ProductName NVARCHAR(100),
    Price DECIMAL(10, 2)
);
```

### **Non-Clustered Index**

- Separate from the data rows and can point to them using a reference.  
- Example: Searching for products by name.

```sql
CREATE NONCLUSTERED INDEX idx_ProductName 
ON Products (ProductName);
```

### **Composite Index**

- Combines two or more columns into a single index.  
- Example: Searching for customers by their first name and city.

```sql
CREATE INDEX idx_FirstName_City 
ON Customers (FirstName, City);
```

### **Filtered Index**

- Applies a condition to the indexed rows.  
- Example: Indexing only products priced above $100.

```sql
CREATE INDEX idx_FilteredPrice 
ON Products (Price) 
WHERE Price > 100;
```

---

## **Why Use Indexes?**

Indexes can significantly improve the performance of SELECT queries by reducing the amount of data scanned. However, they can slightly decrease the performance of INSERT, UPDATE, and DELETE operations because the index needs to be updated as well.

---

## **Best Practices for Indexing**

1. Use indexes only on columns frequently used in WHERE, JOIN, ORDER BY, and GROUP BY clauses.  
2. Avoid excessive indexing; it can increase storage and maintenance overhead.  
3. Use composite indexes for multi-condition queries.  
4. Regularly monitor and analyze query performance using tools like **EXPLAIN** (MySQL) or **Query Execution Plan** (SQL Server).  
5. Rebuild or reorganize indexes periodically to maintain performance.

---

## **Key Points**

- Indexes are powerful tools for optimizing query performance.  
- Choose the appropriate type of index based on your query patterns and data distribution.  
- Avoid over-indexing; prioritize essential columns for indexing.  
- Regularly analyze your database to identify and remove unused or redundant indexes.

---

## **Summary**

This lecture covered:  
1. The importance and types of indexes (Clustered, Non-Clustered, Unique, etc.).  
2. Practical examples for creating and using indexes.  
3. Best practices for efficient indexing and database optimization.  

By leveraging indexes wisely, you can significantly enhance the performance and scalability of your SQL databases.