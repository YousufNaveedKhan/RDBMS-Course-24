-- Lecture 10: Data Security and User Management (MySQL)

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS RDBMS_Security;

-- Step 2: Use the Database
USE RDBMS_Security;

-- Step 3: Create a Table for Sensitive Data
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE, -- Ensure username is unique
    Password VARBINARY(255) NOT NULL,     -- Store encrypted passwords
    Role VARCHAR(50) NOT NULL             -- User role
);

-- Step 4: Insert Encrypted Data
-- Note: Encryption Key is hardcoded for demonstration purposes.
INSERT INTO Users (Username, Password, Role)
VALUES 
    ('admin_user', AES_ENCRYPT('admin_password', 'encryption_key'), 'Admin'),
    ('yousuf_naveed', AES_ENCRYPT('password123', 'encryption_key'), 'DataAnalyst');

-- Step 5: Decrypt Data for Verification
-- Decrypting stored data to verify encryption works as intended.
SELECT Username, 
       CAST(AES_DECRYPT(Password, 'encryption_key') AS CHAR) AS DecryptedPassword, 
       Role
FROM Users;

-- Step 6: Create a Role and Grant Permissions
-- Creating a custom role for data analysts.
CREATE ROLE IF NOT EXISTS DataAnalyst;

-- Grant SELECT permission on Users table to the DataAnalyst role.
GRANT SELECT ON RDBMS_Security.Users TO DataAnalyst;

-- Step 7: Create a User and Assign the Role
-- Creating a new user for data analyst activities.
CREATE USER IF NOT EXISTS 'yousuf_naveed'@'localhost' IDENTIFIED BY 'secure_password';

-- Assign the DataAnalyst role to the new user.
GRANT DataAnalyst TO 'yousuf_naveed'@'localhost';

-- Step 8: Revoke Permissions
-- Revoke SELECT permission from the DataAnalyst role.
REVOKE SELECT ON RDBMS_Security.Users FROM DataAnalyst;
