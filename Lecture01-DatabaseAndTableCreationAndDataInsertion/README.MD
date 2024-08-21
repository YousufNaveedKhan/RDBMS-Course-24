# RDBMS Course: Lecture 01

## Introduction

In this lecture, we will start with the basics of databases and how they are managed using Database Management Systems (DBMS). A **database** is a structured collection of data stored and managed according to the principles of a DBMS. We use a DBMS to create, manipulate, and manage these databases efficiently.

### Types of DBMS

DBMS can be categorized into:

1. **Relational DBMS (RDBMS)**
2. **Non-Relational DBMS**

An **RDBMS (Relational Database Management System)**, such as MySQL and SQL Server, organizes data into tables and defines relationships between these tables to maintain data integrity and support complex queries.

## Key Topics Covered

### 1. Database Creation

In this section, we will cover how to create and manage databases. Key tasks include:

- **Creating a Database**: Use the following syntax in MySQL and SQL Server:
  ```sql
  CREATE DATABASE dbname;
  ```
- **Switching Databases**: To use a specific database, execute:
  ```sql
  USE dbname;
  ```

### 2. Table Creation

When creating tables, consider the following:

- **Syntax for Creating a Table**:
  ```sql
  CREATE TABLE tablename (
    col_name1 datatype(length),
    col_name2 datatype(length),
    col_name3 datatype(length)
  );
  ```

- **Primary Key and Auto Increment**:
  - For **Primary Key**:
    ```sql
    col_name datatype(length) PRIMARY KEY
    ```
  - For **Auto Increment** in MySQL:
    ```sql
    col_name datatype(length) PRIMARY KEY AUTO_INCREMENT
    ```
    In SQL Server:
    ```sql
    col_name datatype(length) PRIMARY KEY IDENTITY(start_value, increment_value)
    ```

- **Constraints**: Add constraints like `NOT NULL` after the datatype, e.g.:
  ```sql
  col_name datatype(length) NOT NULL
  ```

### 3. Data Insertion

To insert data into tables:

- **Syntax for Inserting Data**:
  ```sql
  INSERT INTO tablename (col_name1, col_name2, col_name3) VALUES ('value1', 'value2', 'value3');
  ```

  **Note**: Use single quotes for string values in SQL Server, while MySQL accepts both single and double quotes.

## Important Notes

- **Terminators**: In MySQL Workbench or MS SQL Server, each query must end with a semicolon (`;`).
- **Execution**: Queries must be executed after writing.
- **Local Server**: MySQL requires a local server like XAMPP. SQL Server does not require additional local servers.
- **Naming Conventions**: Avoid special characters in database and table names, except for underscores (`_`). Spaces are not allowed.

## Summary

In this lecture, we introduced the fundamental concepts of databases, DBMS, and RDBMS. We covered how to create databases and tables, insert data, and understand key aspects such as terminators, constraints, and naming conventions.

For any questions or further clarifications, please feel free to reach out. [Yousuf Naveed Khan](https://pk.linkedin.com/in/yousufnaveedkhan)
