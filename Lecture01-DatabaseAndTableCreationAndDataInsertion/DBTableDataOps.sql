-- Create a new database named 'Aptech'
CREATE DATABASE Aptech;

-- Switch to the 'Aptech' database to perform subsequent operations
USE Aptech;

-- Create a table named 'Students' with columns for ID, Name, Age, and Contact
CREATE TABLE Students (
    ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  -- Unique identifier for each student, automatically incremented
    Name VARCHAR(33),                           -- Student's name, up to 33 characters
    Age INT,                                    -- Student's age
    Contact VARCHAR(11)                         -- Student's contact number, up to 11 characters
);

-- Retrieve and display all columns and rows from the 'Students' table
SELECT * FROM Students;

-- Retrieve and display only the 'Name' and 'Contact' columns from the 'Students' table
SELECT Name, Contact FROM Students;

-- Retrieve and display only the 'Name' column from the 'Students' table
SELECT Name FROM Students;

-- Insert records into all columns of the 'Students' table
INSERT INTO Students (ID, Name, Age, Contact) VALUES (1, 'Faham', 23, '03312345678');
INSERT INTO Students (ID, Name, Age, Contact) VALUES (NULL, 'Mahad', 21, '03313345678');
INSERT INTO Students (ID, Name, Age, Contact) VALUES (NULL, 'Jasema', 19, '03311345678');

-- Insert records into specified columns ('Name' and 'Contact') of the 'Students' table
INSERT INTO Students (Name, Contact) VALUES ('Mohsin', '03312445678');
INSERT INTO Students (Name, Contact) VALUES ('Farzeen', '03312355678');
INSERT INTO Students (Name, Contact) VALUES ('Zain', '03312345778');
INSERT INTO Students (Name, Contact) VALUES ('Faizan', '03312345671');
INSERT INTO Students (Name, Contact) VALUES ('Hadiqa', '03312345638');

-- Insert records into the 'Name' column only, leaving other columns as NULL
INSERT INTO Students (Name) VALUES ('Saad');
INSERT INTO Students (Name) VALUES ('Abdul Aziz');
