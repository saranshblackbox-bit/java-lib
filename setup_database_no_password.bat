@echo off
echo Setting up Library Management Database (No Password)...
echo.

echo Step 1: Dropping existing database (if any)...
mysql -u root -e "DROP DATABASE IF EXISTS library_management;"

echo.
echo Step 2: Creating database and tables...
mysql -u root < database.sql

if errorlevel 1 (
    echo.
    echo ERROR: Failed to create database.
    echo.
    echo If MySQL has a password, try: setup_database.bat
    echo.
    pause
    exit /b 1
)

echo.
echo Step 3: Verifying database creation...
mysql -u root -e "USE library_management; SHOW TABLES;"

if errorlevel 1 (
    echo.
    echo ERROR: Database verification failed.
    echo.
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