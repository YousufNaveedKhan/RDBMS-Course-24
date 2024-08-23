# RDBMS Course - Lecture #2

## Overview

In the previous lecture, we covered the creation of databases and tables, including the use of the `USE` keyword and concepts of columns and rows. We also discussed various data types, and how to read data using `SELECT` queries and create data using `INSERT` statements. In today's lecture, we will focus on completing CRUD operations (Create, Read, Update, Delete), and how to delete all records from a table.

## Key Points to Remember

- **SQL Variations**: We are working with both MySQL and SQL Server, so you may encounter some differences in behavior between these systems. For instance, if the data length exceeds the defined length of a column (e.g., a `VARCHAR` column with a length of 11), MySQL will issue a warning and truncate the data, whereas SQL Server will generate an error and prevent the query from executing.

- **Clauses**: Although we haven’t yet covered clauses in detail, we have used the `FROM` clause in previous lectures. Today, we will introduce the `WHERE` clause, which is used for data filtering. Detailed coverage of all clauses will be provided in upcoming lectures.

## Syntax and Examples

### Update Query

To update existing records in a table, use the following syntax:

```sql
UPDATE tablename
SET col_name = updated_value, col_name = updated_value
WHERE primary_key_column = targeted_id;
```

### Delete Query

To delete specific records based on a condition, use the syntax:

```sql
DELETE FROM tablename
WHERE primary_key_column = targeted_id;
```

To delete all records from a table without resetting the identity value (auto-increment), use:

```sql
DELETE FROM tablename;
```

**Note**: Using `DELETE` removes all rows from the table but does not reset the identity value. The auto-increment value will continue from the last used value.

### Truncate Query

To remove all records from a table and reset the identity value, use:

```sql
TRUNCATE TABLE tablename;
```

`TRUNCATE TABLE` not only deletes all records but also resets the auto-increment counter to its starting value.

## Summary

- **Update Records**: Use the `UPDATE` statement to modify existing records.
- **Delete Records**: Use the `DELETE` statement to remove specific records or all records.
- **Truncate Table**: Use `TRUNCATE TABLE` to remove all records and reset the auto-increment value.

By mastering these CRUD operations, you will be able to manage data in your tables effectively. Future lectures will cover additional SQL clauses and advanced database concepts.