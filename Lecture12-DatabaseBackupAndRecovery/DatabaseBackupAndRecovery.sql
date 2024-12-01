-- Lecture 12: Database Backup and Recovery (MySQL)

-- Step 1: Create a Sample Database and Table
CREATE DATABASE RDBMS_BackupRecovery;
USE RDBMS_BackupRecovery;

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

-- Step 2: Insert Sample Data
INSERT INTO Orders (CustomerName, OrderDate, TotalAmount)
VALUES 
    ('Yousuf Naveed', '2024-11-01', 500.00),
    ('Khuzaima Ahmed', '2024-11-15', 1200.50),
    ('Huzaifa Iqbal', '2024-11-20', 799.99),
    ('Muneeb Hassan', '2024-11-25', 300.25);

-- Step 3: Create a Backup (Command Line Example)
-- mysqldump -u root -p RDBMS_BackupRecovery > RDBMS_BackupRecovery.sql;

-- Step 4: Simulate Data Loss (Drop the Table)
DROP TABLE Orders;

-- Step 5: Restore the Backup (Command Line Example)
-- mysql -u root -p RDBMS_BackupRecovery < RDBMS_BackupRecovery.sql;

-- Step 6: Enable Binary Logging for Incremental Backups
-- This requires changes to the MySQL configuration file (my.cnf):
-- [mysqld]
-- log-bin=/var/log/mysql/mysql-bin
-- Restart MySQL Server after making changes.
