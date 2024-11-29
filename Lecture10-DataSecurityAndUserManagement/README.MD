# **RDBMS Course - Lecture #10**

## **Data Security and User Management**  

In this lecture, we delve into the critical aspects of database security and user management. Effective user management and securing sensitive data ensure the integrity, confidentiality, and availability of information within a database.

---

## **1. Managing Roles and Permissions**  

### **What Are Roles and Permissions?**  
- **Roles**: Predefined sets of permissions that can be assigned to users or groups to simplify user management.  
- **Permissions**: Rights to perform specific operations (e.g., `SELECT`, `INSERT`, `UPDATE`, `DELETE`) on database objects.  

### **Practical Use**  
Roles and permissions help enforce **Least Privilege Access**, ensuring users only access the resources they need.  

### **Key SQL Commands**  

#### **MySQL Example**  
```sql
-- Creating a Role
CREATE ROLE DataAnalyst;

-- Granting Permissions to the Role
GRANT SELECT, INSERT ON RDBMS.EmployeeData TO DataAnalyst;

-- Assigning the Role to a User
GRANT DataAnalyst TO 'Yousuf_Naveed'@'localhost';

-- Revoking a Role
REVOKE DataAnalyst FROM 'Yousuf_Naveed'@'localhost';
```  

#### **SQL Server Example**  
```sql
-- Creating a Role
CREATE ROLE DataAnalyst;

-- Granting Permissions to the Role
GRANT SELECT, INSERT ON EmployeeData TO DataAnalyst;

-- Adding a User to the Role
ALTER ROLE DataAnalyst ADD MEMBER [Khuzaima_Ahmed];

-- Removing a User from the Role
ALTER ROLE DataAnalyst DROP MEMBER [Khuzaima_Ahmed];
```  

---

## **2. Securing Sensitive Data with Encryption**  

### **Why Encryption?**  
Encryption protects sensitive data (e.g., passwords, financial records) by converting it into an unreadable format, ensuring it is only accessible to authorized individuals.  

### **Types of Encryption**  
1. **Column-Level Encryption**: Encrypts sensitive columns (e.g., Social Security Numbers).  
2. **Transparent Data Encryption (TDE)**: Encrypts the entire database at rest.  

#### **MySQL Example: AES Encryption**  
```sql
-- Encrypting Data
INSERT INTO Users (Username, Password) 
VALUES ('Huzaifa_Iqbal', AES_ENCRYPT('my_secure_password', 'encryption_key'));

-- Decrypting Data
SELECT Username, AES_DECRYPT(Password, 'encryption_key') AS DecryptedPassword 
FROM Users;
```  

#### **SQL Server Example: Always Encrypted**  
```sql
-- Creating a Column Master Key
CREATE COLUMN MASTER KEY MyMasterKey  
WITH (KEY_STORE_PROVIDER_NAME = 'MSSQL_CERTIFICATE_STORE', KEY_PATH = 'CurrentUser/MyKey');

-- Encrypting a Column
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username NVARCHAR(50),
    Password NVARCHAR(50) COLLATE Latin1_General_BIN2 ENCRYPTED WITH 
        (COLUMN_ENCRYPTION_KEY = MyMasterKey, ENCRYPTION_TYPE = RANDOMIZED)
);
```  

---

## **3. User Creation and Management**  

### **Creating Users**  
#### **MySQL**  
```sql
-- Creating a User
CREATE USER 'Muneeb_Hassan'@'localhost' IDENTIFIED BY 'secure_password';

-- Granting Permissions
GRANT SELECT, INSERT ON RDBMS.* TO 'Muneeb_Hassan'@'localhost';

-- Revoking Permissions
REVOKE INSERT ON RDBMS.* FROM 'Muneeb_Hassan'@'localhost';
```  

#### **SQL Server**  
```sql
-- Creating a User
CREATE LOGIN Muneeb_Hassan WITH PASSWORD = 'secure_password';
CREATE USER Muneeb_Hassan FOR LOGIN Muneeb_Hassan;

-- Granting Permissions
GRANT SELECT, INSERT ON EmployeeData TO Muneeb_Hassan;

-- Revoking Permissions
REVOKE INSERT ON EmployeeData FROM Muneeb_Hassan;
```  

---

## **Real-Life Example: Securing a Financial Database**  

Consider a banking application:  

1. **Roles and Permissions**:  
   - **Teller Role**: Can `SELECT` customer data but not `UPDATE` or `DELETE`.  
   - **Manager Role**: Can `SELECT`, `INSERT`, and `UPDATE` data.  

2. **Encryption**:  
   - **Passwords**: Stored using AES encryption for security.  
   - **Transactions Table**: Encrypted using TDE to prevent unauthorized access to sensitive financial data.  

3. **User Management**:  
   - New users (e.g., **Muneeb Hassan** as a newly hired teller) are added to the **Teller Role** with restricted permissions.  

---

## **Key Points and Tips**  

1. Use **roles** to simplify user management for large teams.  
2. Always encrypt sensitive data such as passwords and credit card details.  
3. Regularly audit permissions to ensure compliance with security standards.  
4. Avoid using default usernames (e.g., `root` or `admin`) to enhance security.  
5. For sensitive operations, implement **multi-factor authentication (MFA)** where possible.  

---

## **Summary**  

In this lecture, we covered:  
- Managing roles and permissions to enforce access control.  
- Securing sensitive data using encryption techniques like AES and TDE.  
- Creating and managing database users effectively.  

Explore the **source code examples** for both MySQL and SQL Server to practice these concepts and enhance your understanding.  