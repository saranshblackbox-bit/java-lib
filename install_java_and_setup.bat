@echo off
echo ========================================
echo Java Installation and Tomcat Setup
echo ========================================
echo.

echo ISSUE IDENTIFIED: Java is not installed or not in PATH
echo This is why Tomcat cannot start and you get "connection refused" errors.
echo.

echo ========================================
echo SOLUTION 1: Download and Install Java
echo ========================================
echo.

echo Please download and install Java 17 or later:
echo.
echo RECOMMENDED: Eclipse Temurin (Free)
echo 1. Go to: https://adoptium.net/temurin/releases/
echo 2. Select:
echo    - Version: 17 (LTS) or 21 (LTS)
echo    - JDK
echo    - Windows
echo    - x64
echo 3. Download the .msi installer
echo 4. Run the installer (install for all users)
echo 5. Restart your computer after installation
echo.

echo ALTERNATIVE: Oracle JDK
echo 1. Go to: https://www.oracle.com/java/technologies/downloads/
echo 2. Download Java 17 or 21
echo 3. Install and restart
echo.

echo ========================================
echo SOLUTION 2: Quick Download Links
echo ========================================
echo.

echo Temurin 17 (Recommended):
echo https://adoptium.net/temurin/releases/?version=17&package=jdk&platform=windows_x64

echo.
echo Temurin 21 (Latest LTS):
echo https://adoptium.net/temurin/releases/?version=21&package=jdk&platform=windows_x64

echo.
echo ========================================
echo SOLUTION 3: After Java Installation
echo ========================================
echo.

echo After installing Java and restarting:
echo 1. Verify Java: java -version
echo 2. Run: setup_database.bat (or setup_database_no_password.bat)
echo 3. Run: troubleshoot_tomcat.bat
echo 4. Access: http://localhost:8080/library-management/

echo.
echo ========================================
echo ALTERNATIVE: Portable Java Setup
echo ========================================
echo.

echo If you prefer not to install Java system-wide:
echo 1. Download the .zip version of Java
echo 2. Extract to: C:\Java\
echo 3. Set JAVA_HOME=C:\Java\jdk-17.x.x
echo 4. Add C:\Java\jdk-17.x.x\bin to PATH
echo.

echo ========================================
echo NEXT STEPS
echo ========================================
echo.
echo 1. Install Java using one of the methods above
echo 2. Restart your computer
echo 3. Run this script again to verify installation
echo 4. Then run the database and Tomcat setup scripts
echo.

pause