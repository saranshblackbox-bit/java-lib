@echo off
echo Starting Tomcat server...

setlocal enabledelayedexpansion

set TOMCAT_HOME=C:\Program Files\Apache Software Foundation\Tomcat 11.0
set CATALINA_HOME=%TOMCAT_HOME%

echo Setting CATALINA_HOME to: %CATALINA_HOME%

cd /d "%CATALINA_HOME%\bin"
start "Tomcat" cmd /c "catalina.bat run"

echo.
echo Tomcat is starting...
echo The application should be available at:
echo http://localhost:8080/library-management/
echo.
echo Please wait a few moments for Tomcat to fully start up.
pause