# RDBMS Course - Lecture #3

In the previous lecture, we explored CRUD operations. In this lecture, we will cover the concepts of table alteration and aggregate functions. Additionally, we will learn how to display records based on various conditions.

## Table Alteration

In both MySQL and SQL Server, we use the `ALTER TABLE` statement to modify the structure of an existing table. This includes adding, updating, or deleting columns, as well as modifying column data types or adding constraints. The syntax for `ALTER TABLE` is quite similar in both MySQL and SQL Server.

### Adding Columns

**MySQL Syntax:**
```sql
ALTER TABLE tablename 
ADD COLUMN columnname datatype(length), 
ADD COLUMN columnname datatype(length);
```

**SQL Server Syntax:**
```sql
ALTER TABLE tablename 
ADD columnname datatype(length), 
columnname datatype(length);
```

### Modifying Columns

**MySQL Syntax:**
```sql
ALTER TABLE tablename 
MODIFY COLUMN columnname datatype(length);
```

**SQL Server Syntax:**
```sql
ALTER TABLE tablename 
ALTER COLUMN columnname datatype(length);
```

### Deleting Columns

**MySQL and SQL Server Syntax:**
```sql
ALTER TABLE tablename 
DROP COLUMN columnname;
```

## Aggregate Functions

Aggregate functions perform calculations on a set of values and return a single value. For instance, the `SUM` function adds up all the values in a column and returns the total. Other common aggregate functions include `MAX`, `MIN`, and `COUNT`.

**Syntax:**
```sql
SELECT function(column_name) FROM tablename;
```

You can use `SUM`, `MAX`, `MIN`, or `COUNT` in place of `function`.

**Example:**
```sql
SELECT SUM(Salary) AS 'Total Salary Amount' FROM Employees;
```

## Aliases

SQL aliases provide temporary names for tables or columns to make queries more readable. Aliases are used within the context of a single query and are created using the `AS` keyword.

**Example:**
```sql
SELECT SUM(Salary) AS 'Total Salary Amount' FROM Employees;
```

## Conditional Filtering with AND and OR Operators

The `AND` and `OR` operators are used to filter records based on multiple conditions.

- **AND Operator:** Displays records if all conditions separated by `AND` are TRUE.
- **OR Operator:** Displays records if any of the conditions separated by `OR` is TRUE.

### Using the AND Operator

To find employees with salaries between $50,000 and $100,000, you would use:
```sql
SELECT * FROM Employees 
WHERE Salary > 50000 AND Salary < 100000;
```

### Using the OR Operator

To filter records based on either department or salary, where either condition being true will display the record:
```sql
SELECT * FROM Employees 
WHERE Department = 'Sales' OR Salary = 50000;
```

In the `OR` condition, a record is returned if any one of the conditions is true, while with `AND`, all specified conditions must be true for the record to be included.

## Summary

In this lecture, we covered table alteration techniques, explored aggregate functions, and learned how to filter data using conditional operators. These concepts are essential for managing and analyzing data in relational databases.