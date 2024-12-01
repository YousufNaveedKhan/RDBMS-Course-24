# **RDBMS Course - Lecture #12**

## **Lecture 12: Database Backup and Recovery**

In this lecture, we delve into the **importance of database backups**, how to establish effective backup strategies, and how to restore databases to ensure data integrity and availability. We also discuss disaster recovery planning as a critical element of database management.

---

## **1. Introduction to Backups**

### **What is a Backup?**
A backup is a copy of your database that can be used to restore data in case of accidental loss, corruption, or hardware/software failures.

### **Importance of Backups**
1. Protects against data loss due to system crashes, ransomware, or human errors.
2. Ensures uninterrupted business continuity.
3. Meets compliance standards for regulatory bodies.
4. Forms the backbone of disaster recovery plans.

---

## **2. Backup Strategies**

### **Types of Backups**
1. **Full Backup**: A complete copy of the entire database.
2. **Differential Backup**: Copies changes made since the last full backup.
3. **Transaction Log Backup**: Captures all transactions performed after the last backup, used for point-in-time recovery.

### **Best Practices**
- Perform full backups at regular intervals and supplement them with differential or transaction log backups.
- Store backups securely in multiple locations (both on-site and off-site).
- Automate the backup process and regularly verify the integrity of backup files.
- Conduct periodic restoration tests to confirm backup usability.

---

## **3. Backup in MySQL**

### **Important Prerequisite: Ensure MySQL Server Installation**

To perform backups in MySQL, you need **MySQL Server** properly installed on your system. Here’s how to ensure this:

---

### **3.1 Check if MySQL Server is Installed**
1. Open a **Command Prompt** and type:
   ```cmd
   mysql --version
   ```
   - If you see the MySQL version, the installation is fine.
   - If not, continue to the next step.

---

### **3.2 Install MySQL Server**
1. **Download the Installer**:
   - Visit [MySQL Community Downloads](https://dev.mysql.com/downloads/installer/).
   - Choose the appropriate installer:
     - `mysql-installer-community-8.0.xx.msi` for the complete package.
     - `mysql-installer-web-community-8.0.xx.msi` for a smaller, web-based installer.

2. **Run the Installer**:
   - Select **MySQL Server** during the setup.
   - Follow the installation prompts to configure the root password and other settings.

3. **Verify Installation**:
   - After installation, run the `mysql --version` command again to confirm.

---

### **3.3 Add `bin` Directory to System PATH**

Adding the `bin` directory to your system PATH allows you to run MySQL commands from anywhere in the Command Prompt.

1. **Locate the `bin` Folder**:
   - Default location: `C:\Program Files\MySQL\MySQL Server 8.0\bin`.

2. **Add to PATH Variable**:
   - **Windows Steps**:
     1. Right-click on **This PC** or **My Computer** and select **Properties**.
     2. Click **Advanced system settings** > **Environment Variables**.
     3. Under **System Variables**, find **Path**, select it, and click **Edit**.
     4. Click **New**, paste the `bin` path (e.g., `C:\Program Files\MySQL\MySQL Server 8.0\bin`), and click **OK**.

3. **Verify PATH Update**:
   - Open a new Command Prompt and type:
     ```cmd
     mysql --version
     ```
   - You should see the MySQL version displayed.

---

### **3.4 Perform Backup and Restore**

#### **Full Backup with `mysqldump`**
```bash
# Back up a database
mysqldump -u [username] -p [database_name] > backup.sql

# Restore a database
mysql -u [username] -p [database_name] < backup.sql
```

#### **Incremental Backup with Binary Logs**
1. **Enable Binary Logs**:
   - Add the following to the MySQL configuration file (`my.ini` or `my.cnf`):
     ```ini
     [mysqld]
     log-bin=/var/log/mysql/mysql-bin
     ```

2. **Copy Binary Logs**:
   ```bash
   cp /var/log/mysql/mysql-bin.* /backup/location/
   ```

---

## **4. Backup in SQL Server**

### **4.1 Commands for Backup and Restore**

#### **Full Backup**
```sql
-- Backup
BACKUP DATABASE [DatabaseName]
TO DISK = 'C:\Backup\DatabaseName_Full.bak'
WITH FORMAT, NAME = 'Full Backup';

-- Restore
RESTORE DATABASE [DatabaseName]
FROM DISK = 'C:\Backup\DatabaseName_Full.bak'
WITH REPLACE;
```

#### **Differential Backup**
```sql
-- Backup changes
BACKUP DATABASE [DatabaseName]
TO DISK = 'C:\Backup\DatabaseName_Diff.bak'
WITH DIFFERENTIAL;

-- Restore differential
RESTORE DATABASE [DatabaseName]
FROM DISK = 'C:\Backup\DatabaseName_Full.bak'
WITH NORECOVERY;

RESTORE DATABASE [DatabaseName]
FROM DISK = 'C:\Backup\DatabaseName_Diff.bak'
WITH RECOVERY;
```

---

## **5. Disaster Recovery Planning**

### **Key Considerations**
1. Assess risks (e.g., hardware failure, ransomware).
2. Create a robust backup strategy.
3. Define acceptable **Recovery Time Objective (RTO)** and **Recovery Point Objective (RPO)**.
4. Regularly test restoration processes.

---

## **6. Real-Life Example: E-Commerce Platform**

An online store uses:
1. **Daily Full Backups** at midnight.
2. **Differential Backups** every 6 hours.
3. **Cloud Storage** for off-site safety.
4. Quarterly restoration tests to ensure disaster readiness.

---

## **Key Points and Tips**
1. Keep backups encrypted for data security.
2. Document procedures for backup and restore.
3. Automate processes with tools like **MySQL Workbench** or **SQL Server Management Studio**.

---

## **Summary**
In this lecture, we covered:
- Backup strategies (full, differential, incremental).
- Command-line techniques for MySQL and SQL Server.
- Disaster recovery principles to ensure data safety.  

For further assistance, ensure MySQL installation is correct and refer to this guide for setting up your environment.