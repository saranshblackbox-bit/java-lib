@echo off
echo ========================================
echo Advanced Tomcat Setup - Manual Method
echo ========================================
echo.

echo Step 1: Checking Java installation...
java -version
if errorlevel 1 (
    echo ERROR: Java is not installed or not in PATH
    echo Please install Java 8 or later and add it to PATH
    echo Download from: https://www.oracle.com/java/technologies/downloads/
    pause
    exit /b 1
)

echo.
echo Step 2: Checking Tomcat installation...
if not exist "C:\Program Files\Apache Software Foundation\Tomcat 11.0" (
    echo ERROR: Tomcat 11.0 not found in expected location
    echo.
    echo Alternative: Let me download and set up portable Tomcat...
    echo This will download Tomcat and set it up in your project directory
    echo.
    
    set /p download_tomcat="Download portable Tomcat? (y/n): "
    if /i "%download_tomcat%"=="y" (
        echo.
        echo Download Tomcat from: https://tomcat.apache.org/download-11.cgi
        echo Look for "64-bit Windows zip" 
        echo.
        echo Place the downloaded file in: C:\temp\
        echo Name it: apache-tomcat-11.0-windows-x64.zip
        echo.
        echo Or I can provide a manual setup approach...
    )
    pause
    exit /b 1
)

echo.
echo Step 3: Setting up environment variables...
set CATALINA_HOME=C:\Program Files\Apache Software Foundation\Tomcat 11.0
set JAVA_HOME=%JAVA_HOME%
echo CATALINA_HOME set to: %CATALINA_HOME%

echo.
echo Step 4: Checking Tomcat permissions...
icacls "C:\Program Files\Apache Software Foundation\Tomcat 11.0" | find "Everyone\|Users\|%USERNAME%"

echo.
echo Step 5: Attempting manual Tomcat startup...
echo.
echo Trying to start Tomcat manually...

cd /d "%CATALINA_HOME%\bin"

echo Current directory: %CD%
echo Checking for startup.bat...
if not exist "startup.bat" (
    echo ERROR: startup.bat not found in Tomcat bin directory
    echo This suggests Tomcat installation is incomplete
    pause
    exit /b 1
)

echo Starting Tomcat...
start "Tomcat Server - Manual Start" cmd /c "catalina.bat run"

echo.
echo Tomcat is starting in a new window...
echo Please wait 20-30 seconds for full startup
echo.
echo Then test these URLs:
echo - http://localhost:8080/ (Tomcat welcome page)
echo - http://localhost:8080/library-management/ (your application)
echo.

pause