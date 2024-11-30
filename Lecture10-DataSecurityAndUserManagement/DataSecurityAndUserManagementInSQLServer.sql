-- Lecture 10: Data Security and User Management (SQL Server)

-- Step 1: Create a Database
CREATE DATABASE RDBMS_Security;
GO

-- Step 2: Use the Database
USE RDBMS_Security;
GO

-- Step 3: Create a Table for Sensitive Data
CREATE TABLE Users (
    UserID INT IDENTITY PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password VARBINARY(MAX) NOT NULL, -- For encrypted data
    Role NVARCHAR(50)
);
GO

-- Step 4: Insert Encrypted Data
-- Example with SYMMETRIC KEY encryption
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'master_key_password';
GO

CREATE CERTIFICATE SecurityCert 
    WITH SUBJECT = 'Data Security Certificate';
GO

CREATE SYMMETRIC KEY SecurityKey 
    WITH ALGORITHM = AES_256 
    ENCRYPTION BY CERTIFICATE SecurityCert;
GO

OPEN SYMMETRIC KEY SecurityKey DECRYPTION BY CERTIFICATE SecurityCert;
GO

INSERT INTO Users (Username, Password, Role)
VALUES 
    ('Yousuf Naveed', EncryptByKey(Key_GUID('SecurityKey'), 'secure_password_123'), 'Admin'),
    ('Khuzaima Ahmed', EncryptByKey(Key_GUID('SecurityKey'), 'secure_password_456'), 'DataAnalyst');
GO

CLOSE SYMMETRIC KEY SecurityKey;
GO

-- Step 5: Decrypt Data for Verification
OPEN SYMMETRIC KEY SecurityKey DECRYPTION BY CERTIFICATE SecurityCert;
GO

SELECT 
    UserID,
    Username,
    CONVERT(NVARCHAR(MAX), DecryptByKey(Password)) AS DecryptedPassword,
    Role
FROM Users;
GO

CLOSE SYMMETRIC KEY SecurityKey;
GO

-- Step 6: Create a Role and Grant Permissions
CREATE ROLE DataAnalyst;
GO

GRANT SELECT ON Users TO DataAnalyst;
GO

-- Step 7: Create a User and Assign the Role
CREATE LOGIN Huzaifa_Iqbal WITH PASSWORD = 'strong_password_789';
CREATE USER Huzaifa_Iqbal FOR LOGIN Huzaifa_Iqbal;
ALTER ROLE DataAnalyst ADD MEMBER Huzaifa_Iqbal;
GO

-- Step 8: Revoke Permissions
ALTER ROLE DataAnalyst DROP MEMBER Huzaifa_Iqbal;
REVOKE SELECT ON Users FROM DataAnalyst;
GO