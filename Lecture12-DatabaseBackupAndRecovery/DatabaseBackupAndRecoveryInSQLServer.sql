-- Lecture 12: Database Backup and Recovery (SQL Server)

-- Step 1: Create a Sample Database and Table
CREATE DATABASE RDBMS_BackupRecovery;
GO

USE RDBMS_BackupRecovery;
GO

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);
GO

-- Step 2: Insert Sample Data
INSERT INTO Orders (CustomerName, OrderDate, TotalAmount)
VALUES 
    ('Yousuf Naveed', '2024-11-01', 500.00),
    ('Khuzaima Ahmed', '2024-11-15', 1200.50),
    ('Huzaifa Iqbal', '2024-11-20', 799.99),
    ('Muneeb Hassan', '2024-11-25', 300.25);
GO

-- Step 3: Perform a Full Backup
BACKUP DATABASE RDBMS_BackupRecovery
TO DISK = 'C:\Backups\RDBMS_BackupRecovery_Full.bak'
WITH FORMAT, NAME = 'Full Backup of RDBMS_BackupRecovery';
GO

-- Step 4: Simulate Data Loss (Drop the Table)
DROP TABLE Orders;
GO

-- Step 5: Restore the Full Backup
RESTORE DATABASE RDBMS_BackupRecovery
FROM DISK = 'C:\Backups\RDBMS_BackupRecovery_Full.bak'
WITH REPLACE;
GO

-- Step 6: Perform a Differential Backup
-- Insert more data for demonstration
INSERT INTO Orders (CustomerName, OrderDate, TotalAmount)
VALUES ('Ali Raza', '2024-11-30', 1500.75);
GO

BACKUP DATABASE RDBMS_BackupRecovery
TO DISK = 'C:\Backups\RDBMS_BackupRecovery_Diff.bak'
WITH DIFFERENTIAL;
GO

-- Step 7: Restore Differential Backup
RESTORE DATABASE RDBMS_BackupRecovery
FROM DISK = 'C:\Backups\RDBMS_BackupRecovery_Full.bak'
WITH NORECOVERY;

RESTORE DATABASE RDBMS_BackupRecovery
FROM DISK = 'C:\Backups\RDBMS_BackupRecovery_Diff.bak'
WITH RECOVERY;
GO

