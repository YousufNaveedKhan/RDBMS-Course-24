-- Lecture 04: Database Relationships and Keys (MySQL)
-- DB
CREATE DATABASE RDBMS;
USE RDBMS;

-- Step 1: Create tables to demonstrate relationships
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    ReviewText TEXT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Step 2: Insert data into Authors
INSERT INTO Authors (Name, Email) 
VALUES ('Yousuf', 'yousuf@example.com'),
       ('Muneeb', 'muneeb@example.com');

-- Step 3: Insert data into Books
INSERT INTO Books (Title, AuthorID) 
VALUES ('MySQL Basics', 1),
       ('Advanced SQL', 1),
       ('SQL Server Mastery', 2);

-- Step 4: Insert data into Reviews
INSERT INTO Reviews (BookID, ReviewText, Rating)
VALUES (1, 'Great introductory book!', 5),
       (2, 'Comprehensive but a bit complex.', 4),
       (3, 'Very detailed and helpful.', 5);

-- Step 5: Demonstrate relationships with SELECT queries
-- Fetch all books and their respective authors
SELECT Books.Title, Authors.Name AS AuthorName
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;

-- Fetch all reviews with book titles
SELECT Reviews.ReviewText, Reviews.Rating, Books.Title
FROM Reviews
JOIN Books ON Reviews.BookID = Books.BookID;
