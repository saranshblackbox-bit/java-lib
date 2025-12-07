@echo off
echo ========================================
echo Fix Tomcat Access Denied Error
echo ========================================
echo.

echo ISSUE: Access denied when starting Tomcat service
echo SOLUTION: Run as Administrator or use manual startup
echo.

echo ========================================
echo SOLUTION 1: Run as Administrator
echo ========================================
echo.
echo 1. Right-click on Command Prompt
echo 2. Select "Run as Administrator"
echo 3. Navigate to your project folder: cd "c:\Users\DELL\Desktop\java lib"
echo 4. Run: net start Tomcat11
echo.

echo ========================================
echo SOLUTION 2: Manual Tomcat Startup
echo ========================================
echo.
echo Starting Tomcat manually (does not require service permissions)...

set CATALINA_HOME=C:\Program Files\Apache Software Foundation\Tomcat 11.0

echo Setting CATALINA_HOME to: %CATALINA_HOME%

echo.
echo Changing to Tomcat bin directory...
cd /d "%CATALINA_HOME%\bin"

echo Starting Tomcat server...
start "Tomcat Server - Manual" cmd /c "catalina.bat run"

echo.
echo Tomcat is starting in a new window...
echo Please wait 15 seconds for full startup
echo.
echo Then test: http://localhost:8080/library-management/
echo.

echo ========================================
echo SOLUTION 3: If Manual Start Fails
echo ========================================
echo.
echo If manual startup also fails, check:
echo 1. Tomcat installation path
echo 2. Java installation
echo 3. Firewall settings
echo.

pause