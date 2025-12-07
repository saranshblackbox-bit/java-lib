@echo off
echo ========================================
echo Tomcat Connection Troubleshooting
echo ========================================
echo.

echo Step 1: Checking if port 8080 is in use...
netstat -an | find "8080"
if errorlevel 1 (
    echo Port 8080 is NOT in use - Tomcat is not running
) else (
    echo Port 8080 is in use - Tomcat might be running
)

echo.
echo Step 2: Checking Tomcat processes...
tasklist | find "java" || echo No Java processes found

echo.
echo Step 3: Attempting to start Tomcat...
echo Starting Tomcat service...

net start Tomcat11
if errorlevel 1 (
    echo.
    echo Windows service start failed. Trying manual startup...
    echo.
    echo Setting CATALINA_HOME...
    set CATALINA_HOME=C:\Program Files\Apache Software Foundation\Tomcat 11.0
    
    echo Changing to Tomcat bin directory...
    cd /d "C:\Program Files\Apache Software Foundation\Tomcat 11.0\bin"
    
    echo Starting Tomcat...
    start "Tomcat Server" cmd /c "catalina.bat run"
    
    echo.
    echo Tomcat is starting in a new window...
    echo Please wait 10-15 seconds for it to fully start
    echo Then try accessing: http://localhost:8080/library-management/
) else (
    echo.
    echo Tomcat service started successfully!
    echo.
    echo Waiting 10 seconds for Tomcat to fully initialize...
    timeout /t 10 /nobreak >nul
    
    echo.
    echo Checking if port 8080 is now accessible...
    netstat -an | find "8080"
)

echo.
echo ========================================
echo Troubleshooting Complete
echo ========================================
echo.
echo If you still get connection errors:
echo 1. Check Windows Firewall settings
echo 2. Ensure port 8080 is not blocked
echo 3. Try accessing http://localhost:8080/ (Tomcat default page)
echo 4. Check Tomcat logs in logs directory
echo.
pause