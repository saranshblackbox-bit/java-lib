@echo off
echo Setting up Library Management Database...
echo.

echo Note: This script requires MySQL to be installed and running.
echo You will need to enter your MySQL root password.
echo.

echo Step 1: Dropping existing database (if any)...
mysql -u root -p -e "DROP DATABASE IF EXISTS library_management;"

echo.
echo Step 2: Creating database and tables...
mysql -u root -p < database.sql

if errorlevel 1 (
    echo.
    echo ERROR: Failed to create database. Please check the error above.
    echo Common issues:
    echo 1. Wrong MySQL password
    echo 2. MySQL service not running
    echo 3. Insufficient privileges
    echo.
    pause
    exit /b 1
)

echo.
echo Step 3: Verifying database creation...
mysql -u root -p -e "USE library_management; SHOW TABLES;"

if errorlevel 1 (
    echo.
    echo ERROR: Database verification failed.
    echo This might be due to password or connection issues.
    echo Try running: mysql -u root -p < database.sql
    pause
    exit /b 1
)

echo.
echo ========================================
echo Database setup completed successfully!
echo ========================================
echo.
echo Database: library_management
echo Tables created:
echo - books
echo - authors  
echo - publishers
echo - book_authors
echo - users
echo - transactions
echo.
echo Your application is now ready to connect to the database!
echo.
pause