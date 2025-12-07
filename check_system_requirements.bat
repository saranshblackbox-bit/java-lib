@echo off
echo ========================================
echo System Requirements Check
echo ========================================
echo.

echo Step 1: Checking Java installation...
java -version
if errorlevel 1 (
    echo ❌ Java is NOT installed or not in PATH
    echo.
    echo SOLUTION: Download and install Java 8 or later
    echo Download from: https://adoptium.net/temurin/releases/
    echo Or: https://www.oracle.com/java/technologies/downloads/
) else (
    echo ✅ Java is installed
)

echo.
echo Step 2: Checking MySQL...
mysql --version
if errorlevel 1 (
    echo ❌ MySQL command line tool not found
    echo.
    echo SOLUTION: Make sure MySQL is installed and in PATH
) else (
    echo ✅ MySQL is available
)

echo.
echo Step 3: Checking Tomcat installation...
if exist "C:\Program Files\Apache Software Foundation\Tomcat 11.0" (
    echo ✅ Tomcat 11.0 found in expected location
    echo.
    echo Checking Tomcat bin directory...
    if exist "C:\Program Files\Apache Software Foundation\Tomcat 11.0\bin\startup.bat" (
        echo ✅ Tomcat startup.bat found
    ) else (
        echo ❌ Tomcat startup.bat NOT found - installation may be incomplete
    )
) else (
    echo ❌ Tomcat 11.0 NOT found in expected location
    echo.
    echo SOLUTION: Install Tomcat 11.0 from:
    echo https://tomcat.apache.org/download-11.cgi
)

echo.
echo Step 4: Checking port 8080...
netstat -an | find "8080" >nul
if errorlevel 1 (
    echo ✅ Port 8080 is available (not in use)
) else (
    echo ❌ Port 8080 is already in use
    echo Running processes on port 8080:
    netstat -ano | find "8080"
)

echo.
echo ========================================
echo DIAGNOSIS SUMMARY
echo ========================================
echo.
if errorlevel 1 echo ❌ Java issues detected
if errorlevel 1 echo ❌ Tomcat startup may fail
echo.
echo NEXT STEPS:
echo 1. Install Java if missing
echo 2. Install Tomcat 11.0 if missing
echo 3. Run: advanced_tomcat_setup.bat
echo.
pause