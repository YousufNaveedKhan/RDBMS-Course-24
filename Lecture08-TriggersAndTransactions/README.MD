# RDBMS Course - Lecture #8

## Triggers and Transactions

In this lecture, we delve deeper into **Triggers** and **Transactions**, two critical features of relational database systems. These concepts are fundamental for automating tasks and ensuring data consistency.

---

## **Triggers**

### What is a Trigger?

A **Trigger** is a database mechanism that automatically executes a predefined action when specific events occur on a table, such as `INSERT`, `UPDATE`, or `DELETE`. Triggers are powerful tools for enforcing business rules and maintaining database integrity.

---

### Types of Triggers

1. **BEFORE Trigger**: Executes **before** the database action (e.g., before inserting or updating data).
   - **Use Case**: Validate data or set default values before they are written to the database.

2. **AFTER Trigger**: Executes **after** the database action (e.g., after data is inserted, updated, or deleted).
   - **Use Case**: Automatically log actions or update related data after a change.

---

### Key Characteristics of Triggers

- **Automated**: Triggers eliminate the need for manual intervention.
- **Enforce Rules**: They can enforce constraints beyond what is possible with standard database rules.
- **Unobtrusive**: They run in the background, invisible to users.

---

### Practical Example in Code

#### **Source Code Example (MySQL)**

```sql
-- Trigger to log updates in the Products table
CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (ProductID, ActionTaken)
    VALUES (NEW.ProductID, 'Product updated');
END;
```

- **Explanation**: This trigger logs every update in the `Products` table into an `AuditLog` table, capturing the `ProductID` and the action taken.

---

#### **Real-Life Example**

Imagine you run an **e-commerce platform**, and whenever a product's price changes, you want to:
1. Notify your sales team.
2. Log the price change for compliance and reporting purposes.

Here’s how you would handle this scenario:
- Use a **BEFORE Trigger** to validate the price update (e.g., ensure it's within a permissible range).
- Use an **AFTER Trigger** to:
  - Record the change in a log table.
  - Send notifications to the sales team.

---

## **Transactions**

### What is a Transaction?

A **Transaction** is a sequence of operations that are executed as a single unit of work. Either all operations succeed, or none do. Transactions are essential for ensuring data integrity, particularly in multi-step processes.

---

### ACID Properties of Transactions

1. **Atomicity**: Ensures that all operations in a transaction are completed successfully or none are applied.
2. **Consistency**: Ensures the database remains in a valid state after the transaction.
3. **Isolation**: Ensures concurrent transactions don’t interfere with each other.
4. **Durability**: Guarantees that changes made by a committed transaction persist even in the event of a system failure.

---

### Transaction Control Commands

1. **COMMIT**: Saves the changes made during the transaction.
2. **ROLLBACK**: Reverts changes made during the transaction.
3. **Savepoints**: Allows partial rollbacks to specific points within the transaction.

---

### Practical Example in Code

#### **Source Code Example (SQL Server)**

```sql
BEGIN TRANSACTION;

-- Deduct money from Alice's account
UPDATE Accounts
SET Balance = Balance - 1000.00
WHERE AccountHolder = 'Alice';

-- Add money to Bob's account
UPDATE Accounts
SET Balance = Balance + 1000.00
WHERE AccountHolder = 'Bob';

-- Commit the transaction
COMMIT;
```

- **Explanation**: This transaction handles a money transfer between two accounts. If either step fails (e.g., insufficient funds), the transaction is rolled back to maintain consistency.

---

#### **Real-Life Example**

Think of a **banking system** where you transfer money between accounts. If:
1. Money is deducted from the sender's account but not credited to the recipient's account, it leads to discrepancies.
2. A system failure occurs during the transfer, resulting in incomplete data changes.

By using **Transactions**, the bank ensures:
- Both accounts are updated together (Atomicity).
- The database remains consistent after the transaction.
- Other transfers happening concurrently don’t interfere (Isolation).
- Changes are permanent once completed (Durability).

---

## **Key Points & Tips**

1. Use **Triggers** for:
   - Automated logging (e.g., tracking changes to critical data).
   - Enforcing constraints (e.g., preventing negative stock values).

2. Use **Transactions** for:
   - Financial operations (e.g., payments, refunds).
   - Batch data processing (e.g., bulk updates or imports).

3. Always test triggers thoroughly to avoid unintended consequences.

4. Optimize transaction logic for performance to prevent deadlocks.

---

## Summary

In this lecture, we explored:
1. **Triggers**: Automated responses to database events.
2. **Transactions**: Ensuring data consistency with COMMIT, ROLLBACK, and Savepoints.
3. Real-life applications and best practices for both.

Refer to the provided **MySQL** and **SQL Server** scripts for hands-on practice. Practice these concepts to build a solid understanding of database automation and consistency mechanisms.