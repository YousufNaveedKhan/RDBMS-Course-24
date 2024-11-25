# RDBMS Course - Lecture #4

## Database Relationships and Keys

In this lecture, we will explore the key concepts that form the backbone of relational databases: **Keys** and **Relationships**. These are essential for maintaining data integrity, linking tables, and making data retrieval easier.

---

### **What is a Primary Key?**
A **Primary Key** is a unique identifier for each row in a table. It ensures:
1. No two rows have the same primary key value.
2. The column (or combination of columns) with the primary key cannot contain `NULL`.

**Example in Practice**:  
In the provided MySQL and SQL Server scripts, the `Authors` table uses the `AuthorID` column as the primary key:
```sql
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key ensures unique AuthorID
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);
```

---

### **What is a Foreign Key?**
A **Foreign Key** links two tables by referencing the primary key in another table. This relationship ensures consistency between related data.

**Example in Practice**:  
In the `Books` table, the `AuthorID` column is a foreign key that refers to the `AuthorID` in the `Authors` table:
```sql
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT, -- This is the Foreign Key
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
```
This means each book must have a valid `AuthorID` that exists in the `Authors` table.

---

### **What is a Unique Key?**
A **Unique Key** ensures that all values in a column are unique. Unlike the primary key, a unique key allows `NULL` values.

**Example in Practice**:  
In the `Authors` table, the `Email` column is defined as `UNIQUE`:
```sql
Email VARCHAR(100) UNIQUE -- Ensures no two authors have the same email
```

---

## Relationships in Databases

Relational databases allow you to connect data across tables using relationships. Here are the common types:

### **1. One-to-One Relationship**
- One record in Table A is linked to one record in Table B.
- **Example**: A `User` table and a `Profile` table, where each user has exactly one profile.

### **2. One-to-Many Relationship**
- One record in Table A is linked to multiple records in Table B.
- **Example in Practice**:  
   - An author can write multiple books.
   - The `Books` table uses the `AuthorID` foreign key to create this relationship.

### **3. Many-to-Many Relationship**
- Multiple records in Table A are linked to multiple records in Table B.
- Requires a **junction table** to store the relationship.
- **Example**: Students and Courses, where each student can enroll in many courses, and each course can have many students.

---

## Practical Demonstration

### **Tables Created**
1. **Authors**: Contains author details with a unique `AuthorID`.
2. **Books**: Stores book details, linking each book to an author via the `AuthorID` foreign key.
3. **Reviews**: Stores reviews for books, linking each review to a book via the `BookID` foreign key.

### **Inserting Data**
We inserted data into the tables to demonstrate relationships. For example:
```sql
-- Adding a book with an author
INSERT INTO Books (Title, AuthorID) VALUES ('MySQL Basics', 1);
```

### **Query Examples**

1. **Fetching Books and their Authors**:  
   Using a `JOIN` to retrieve book titles along with author names:
   ```sql
   SELECT Books.Title, Authors.Name AS AuthorName
   FROM Books
   JOIN Authors ON Books.AuthorID = Authors.AuthorID;
   ```

2. **Fetching Reviews with Book Titles**:  
   Linking reviews with books to show which review belongs to which book:
   ```sql
   SELECT Reviews.ReviewText, Books.Title
   FROM Reviews
   JOIN Books ON Reviews.BookID = Books.BookID;
   ```

---

## Key Points and Professional Tips
1. Always use **Primary Keys** to uniquely identify each row in your table.
2. Use **Foreign Keys** to ensure data integrity between related tables.
3. Define **Unique Keys** for columns that should not have duplicate values, like emails.
4. Use proper **naming conventions** for keys (e.g., `AuthorID`, `BookID`) to make your database easy to understand.
5. Relationships should always reflect the real-world structure of your data.
6. Use `JOIN` statements effectively to retrieve related data from multiple tables.

---

## SQL Concepts Demonstrated in the Scripts
- **Creating Tables** with Primary, Foreign, and Unique Keys.
- **Establishing Relationships** (One-to-Many in this lecture).
- **Inserting Data** to demonstrate relationships in action.
- **Writing Queries** using `JOIN` to fetch related data.
- **CHECK Constraints** (in SQL Server) to validate data inputs.

---

## Summary
In this lecture, you learned:
- The role of **Primary**, **Foreign**, and **Unique Keys** in maintaining database integrity.
- Different types of **relationships**: One-to-One, One-to-Many, and Many-to-Many.
- Practical examples to understand how relationships are implemented in MySQL and SQL Server.

Practice the provided scripts and examples to solidify your understanding. If you have any questions, revisit the examples and use the queries provided to explore the data further.