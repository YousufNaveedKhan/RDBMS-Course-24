# Assignment

**Date:** Wed, Aug 28, 2024  
**Topic:** RDBMS (MySQL and MS SQL Server)  
**Submission Date:** Fri, Aug 30, 2024

## Task #1

1. First, create a database. Then, create a table named `Employees` with 8 columns. Four columns must be: ID, Name, Department, and Salary. The remaining four columns can be any additional columns of your choice.

2. Insert 15 records into this table.

3. Retrieve data based on the following conditions:
   1. Where Salary is greater than 50,000, display the Name and Department columns.
   2. Where Salary is less than 150,000, display only the Name column.
   3. Where Salary is less than 30,000, display all columns.
   4. Where Department is "Sales", display the ID and Name columns.
   5. Where Department is NULL, display all columns.

4. Perform the following aggregate functions on the Salary column:
   - SUM
   - MIN
   - MAX
   - COUNT

## Task #2

1. Create a table named `Students` with 3 columns:
   - ID (Unique Identifier)
   - Name (VARCHAR)
   - Age (VARCHAR)

2. Insert 5 values into this table.

3. Modify the table to add 3 more columns:
   - Designation
   - Department
   - Contact

4. Insert 3 values into these newly added columns.

5. Change the data type of the Age column from VARCHAR to INT.

6. After changing the data type of the Age column, insert a string value into the Age column.

7. Finally, delete the three columns that were added (Designation, Department, and Contact).

**Note:** Ensure that the queries are written correctly. This assignment must be completed using both MySQL Workbench and Microsoft SQL Server.