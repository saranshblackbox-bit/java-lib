# Java Installation Required - Connection Refused Fix

## 🔍 Root Cause Identified

**Problem**: Java is not installed on your system
**Result**: Tomcat cannot start → Connection refused errors

## 🎯 Solution: Install Java

### Option 1: Quick Install (Recommended)

**Download Eclipse Temurin 17 (Free & Trusted):**
1. Visit: https://adoptium.net/temurin/releases/
2. Select these exact options:
   - **Version**: 17 (LTS)
   - **Package**: JDK
   - **Platform**: Windows
   - **Architecture**: x64
3. Download the `.msi` installer
4. Run installer (install for all users)
5. **Restart your computer**

### Option 2: Latest Version
**Download Eclipse Temurin 21:**
- Link: https://adoptium.net/temurin/releases/?version=21&package=jdk&platform=windows_x64

### Option 3: Oracle JDK
**Download from Oracle:**
- Link: https://www.oracle.com/java/technologies/downloads/
- Choose Java 17 or 21

## ✅ After Java Installation

1. **Verify installation:**
   ```cmd
   java -version
   ```
   Should show Java version 17 or 21

2. **Setup database:**
   ```cmd
   setup_database.bat
   ```
   or
   ```cmd
   setup_database_no_password.bat
   ```

3. **Start Tomcat:**
   ```cmd
   troubleshoot_tomcat.bat
   ```

4. **Access application:**
   - http://localhost:8080/library-management/

## 🛠️ Troubleshooting

### If Java Still Not Found:
1. **Restart computer** (required after Java installation)
2. **Check PATH**: Java should be automatically added to system PATH
3. **Manual PATH setup** if needed:
   - Java typically installs to: `C:\Program Files\Eclipse Adoptium\jdk-17.x.x.x-hotspot\bin`
   - Add this path to system PATH variable

### Verification Commands:
```cmd
java -version
javac -version
```

## 📋 Complete Setup Order:
1. ✅ Install Java (17 or 21)
2. ✅ Restart computer
3. ✅ Run database setup script
4. ✅ Run Tomcat troubleshooting script
5. ✅ Access your application

## 🎉 Expected Result:
After Java installation and restart, all scripts should work and your application should be accessible at http://localhost:8080/library-management/

**The connection refused errors will be completely resolved once Java is installed!**