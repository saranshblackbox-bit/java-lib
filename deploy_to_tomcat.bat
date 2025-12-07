@echo off
echo Deploying library-management application to Tomcat...

set TOMCAT_HOME=C:\Program Files\Apache Software Foundation\Tomcat 11.0
set WAR_FILE=target\library-management.war
set PROJECT_DIR=%CD%

echo.
echo Step 1: Checking if WAR file exists...
if not exist "%WAR_FILE%" (
    echo ERROR: WAR file not found at %WAR_FILE%
    echo Building project first...
    call mvn clean package
)

if not exist "%WAR_FILE%" (
    echo ERROR: Failed to build WAR file
    pause
    exit /b 1
)

echo WAR file found: %WAR_FILE%

echo.
echo Step 2: Stopping Tomcat service...
net stop Tomcat11 2>nul || echo Tomcat service may not be running

echo.
echo Step 3: Copying WAR file to Tomcat webapps directory...
if exist "%TOMCAT_HOME%\webapps\%WAR_FILE%" del "%TOMCAT_HOME%\webapps\%WAR_FILE%"
copy "%WAR_FILE%" "%TOMCAT_HOME%\webapps\" 
if errorlevel 1 (
    echo ERROR: Failed to copy WAR file. Please check permissions.
    echo Try running this script as Administrator.
    pause
    exit /b 1
)

echo.
echo Step 4: Starting Tomcat service...
net start Tomcat11

echo.
echo Deployment completed successfully!
echo.
echo The application should be available at:
echo http://localhost:8080/library-management/
echo.
pause