@echo off
echo ========================================
echo Final Tomcat Diagnosis - Java Installed
echo ========================================
echo.

echo Step 1: Verifying Java installation...
java -version
if errorlevel 1 (
    echo ❌ Java still not working - check PATH
    echo.
    echo MANUAL FIX NEEDED:
    echo 1. Find Java installation path (usually C:\Program Files\Eclipse Adoptium\jdk-17.x.x.x-hotspot\)
    echo 2. Add to PATH: [Java Path]\bin
    echo 3. Restart command prompt
    pause
    exit /b 1
) else (
    echo ✅ Java is working
)

echo.
echo Step 2: Checking Tomcat service status...
sc query Tomcat11
if errorlevel 1 (
    echo Tomcat11 service not found
) else (
    for /f "tokens=3" %%a in ('sc query Tomcat11 ^| find "STATE"') do set state=%%a
    echo Tomcat11 service state: %state%
)

echo.
echo Step 3: Checking port 8080...
netstat -an | find "8080"
if errorlevel 1 (
    echo ✅ Port 8080 is available
) else (
    echo ❌ Port 8080 is already in use
    echo Current processes on port 8080:
    netstat -ano | find "8080"
)

echo.
echo Step 4: Attempting to start Tomcat service...
net start Tomcat11
if errorlevel 1 (
    echo ❌ Service start failed - trying alternative method
    echo.
    echo Setting up manual Tomcat start...
    set CATALINA_HOME=C:\Program Files\Apache Software Foundation\Tomcat 11.0
    
    if not exist "%CATALINA_HOME%\bin\startup.bat" (
        echo ❌ Tomcat installation not found at expected location
        echo.
        echo ALTERNATIVE SOLUTION: Let me help you set up portable Tomcat
        echo 1. Download Tomcat zip from: https://tomcat.apache.org/download-11.cgi
        echo 2. Extract to: C:\Tomcat\
        echo 3. I'll create a script to work with that
        pause
        exit /b 1
    )
    
    echo Starting Tomcat manually...
    cd /d "%CATALINA_HOME%\bin"
    start "Tomcat Manual Start" cmd /c "catalina.bat run"
    
) else (
    echo ✅ Tomcat service started successfully!
)

echo.
echo Step 5: Waiting for Tomcat startup...
echo Please wait 15 seconds for Tomcat to fully initialize...
timeout /t 15 /nobreak >nul

echo.
echo Step 6: Final status check...
netstat -an | find "8080"
if errorlevel 1 (
    echo ❌ Tomcat is still not listening on port 8080
    echo.
    echo CHECKING TOMCAT LOGS:
    echo Look in: C:\Program Files\Apache Software Foundation\Tomcat 11.0\logs\
    echo For files like: catalina.YYYY-MM-DD.log
    echo.
    echo COMMON ISSUES:
    echo 1. Port 8080 blocked by firewall
    echo 2. Tomcat installation incomplete
    echo 3. Java version compatibility issues
    echo 4. Insufficient permissions
    echo.
    echo TRY ACCESSING THESE URLs:
    echo - http://localhost:8080/ (Tomcat default)
    echo - http://127.0.0.1:8080/ (alternative)
) else (
    echo ✅ Tomcat is now running on port 8080!
    echo.
    echo TEST YOUR APPLICATION:
    echo - http://localhost:8080/library-management/
)

echo.
echo ========================================
echo DIAGNOSIS COMPLETE
echo ========================================
echo.
pause