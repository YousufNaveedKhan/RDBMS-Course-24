-- Create a new database named 'Aptech'
CREATE DATABASE Aptech;

-- Switch to the 'Aptech' database for subsequent operations
USE Aptech;

-- Create a table named 'Students' with columns for ID, Name, Age, and Contact
CREATE TABLE Students (
    ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,  -- Unique identifier for each student, automatically incremented
    Name VARCHAR(33),                           -- Student's name, up to 33 characters (using NVARCHAR for Unicode support)
    Age INT,                                    -- Student's age
    Contact VARCHAR(11)                            -- Student's contact number, exactly 11 characters (using CHAR for fixed length)
);

-- Retrieve and display all columns and rows from the 'Students' table
SELECT * FROM Students;

-- Retrieve and display only the 'Name' and 'Contact' columns from the 'Students' table
SELECT Name, Contact FROM Students;

-- Retrieve and display only the 'Name' column from the 'Students' table
SELECT Name FROM Students;

-- Insert records into all columns of the 'Students' table, specifying the ID explicitly
-- Note: When IDENTITY property is used, it's generally not necessary to specify ID manually
INSERT INTO Students (ID, Name, Age, Contact) VALUES (1, 'Faham', 23, '03312345678');
INSERT INTO Students (Name, Age, Contact) VALUES ('Mahad', 21, '03313345678');
INSERT INTO Students (Name, Age, Contact) VALUES ('Jasema', 19, '03311345678');

-- Insert records into specified columns ('Name' and 'Contact') of the 'Students' table
-- Note: ID will be automatically assigned by the IDENTITY property
INSERT INTO Students (Name, Contact) VALUES ('Mohsin', '03312445678');
INSERT INTO Students (Name, Contact) VALUES ('Farzeen', '03312355678');
INSERT INTO Students (Name, Contact) VALUES ('Zain', '03312345778');
INSERT INTO Students (Name, Contact) VALUES ('Faizan', '03312345671');
INSERT INTO Students (Name, Contact) VALUES ('Hadiqa', '03312345638');

-- Insert records specifying only the 'Name' column, leaving other columns as NULL
INSERT INTO Students (Name) VALUES ('Saad');
INSERT INTO Students (Name) VALUES ('Abdul Aziz');

-- Update specific records in the 'Students' table where ID is 4 and ID is 10
-- Modify the Name, Age, and Contact for the student with ID 4
UPDATE Students SET Name = 'Uzair', Age = 21, Contact = '03312345623' WHERE ID = 4;
-- Modify the Name, Age, and Contact for the student with ID 10
UPDATE Students SET Name = 'Anas', Age = 20, Contact = '03312341123' WHERE ID = 10;

-- Delete specific records from the 'Students' table where ID is 3 and ID is 6
DELETE FROM Students WHERE ID = 3;
DELETE FROM Students WHERE ID = 6;

-- Delete all records from the 'Students' table without resetting the IDENTITY value
DELETE FROM Students;

-- Insert new records into the 'Students' table with the 'Name', 'Age', and 'Contact' columns
-- Note: The ID will continue from the last value used and will not reset after the DELETE operation
INSERT INTO Students (Name, Age, Contact) VALUES ('Faham', 23, '0331234567'),
                                                 ('Faizan', 25, '0332134567'),
                                                 ('Mohsin', 24, '0331234657');

-- Remove all records from the 'Students' table and reset the IDENTITY value
TRUNCATE TABLE Students;

-- Insert new records into the 'Students' table with the 'Name' and 'Contact' columns
-- Note: The ID will start from 1 after the TRUNCATE operation
INSERT INTO Students (Name, Contact) VALUES ('Jasema', '03312347653'),
                                            ('Hadiqa', '03312435678'),
                                            ('Farzeen', '03319245695');
