# Database Setup Instructions

## Automated Setup (Recommended)

Choose the appropriate script based on your MySQL password:

### For MySQL with password:
```cmd
setup_database.bat
```

### For MySQL without password (root has no password):
```cmd
setup_database_no_password.bat
```

Both scripts will:
1. Drop existing database (if any)
2. Create the `library_management` database
3. Create all required tables
4. Verify the setup

## Manual Setup

If the automated script doesn't work, follow these manual steps:

### Step 1: Check MySQL Status
```cmd
mysql --version
```

### Step 2: Connect to MySQL
```cmd
mysql -u root -p
```
Enter your MySQL root password when prompted.

### Step 3: Execute Database Script
From the MySQL command prompt, run:
```sql
source database.sql
```
Or exit MySQL and run:
```cmd
mysql -u root -p < database.sql
```

### Step 4: Verify Database Creation
```cmd
mysql -u root -p -e "USE library_management; SHOW TABLES;"
```

## Database Details

**Database Name**: `library_management`

**Tables Created**:
- `books` - Book information
- `authors` - Author information  
- `publishers` - Publisher information
- `book_authors` - Many-to-many relationship between books and authors
- `users` - Application users
- `transactions` - Book borrow/return transactions

## Troubleshooting

**MySQL Connection Issues**:
- Ensure MySQL service is running
- Check if MySQL is installed: `mysql --version`
- Try connecting without password: `mysql -u root`

**Access Denied Errors**:
- Run commands as Administrator
- Check MySQL user permissions
- Reset MySQL root password if needed
- Try `setup_database_no_password.bat` if MySQL has no password

**Foreign Key Constraint Errors**:
- This issue has been fixed in the updated `database.sql` file
- Tables are now created in the correct order to resolve dependency issues

**Port Issues**:
- MySQL typically runs on port 3306
- Check if port is already in use: `netstat -an | find "3306"`

## Next Steps

After database setup:
1. Start Tomcat using `start_tomcat.bat`
2. Access your application at: http://localhost:8080/library-management/
3. The application should connect to the database automatically