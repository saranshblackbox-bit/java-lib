@echo off
echo Quick Tomcat Diagnostic
java -version
echo.
echo Tomcat service status:
sc query Tomcat11
echo.
echo Port 8080 status:
netstat -an | find "8080"
echo.
echo Trying to start Tomcat:
net start Tomcat11
echo.
echo Final port check:
netstat -an | find "8080"
pause