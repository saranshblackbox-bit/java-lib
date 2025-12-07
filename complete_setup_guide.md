# Complete Setup Guide - Fix Connection Issues

## The Issue: Connection Refused Error

**Cause**: Tomcat is not running on your system.

## Step-by-Step Solution:

### Step 1: Setup Database First
Choose the script that matches your MySQL setup:

**If MySQL has a password:**
```cmd
setup_database.bat
```

**If MySQL has NO password:**
```cmd
setup_database_no_password.bat
```

### Step 2: Start Tomcat
Run the troubleshooting script to diagnose and start Tomcat:

```cmd
troubleshoot_tomcat.bat
```

This script will:
- Check if port 8080 is available
- Start Tomcat service automatically
- Provide detailed diagnostics
- Show you exactly what's happening

### Step 3: Access Your Application
After running the troubleshooting script:

1. **Wait 10-15 seconds** for Tomcat to fully start
2. **Test Tomcat**: Visit http://localhost:8080/
   - You should see the Tomcat welcome page
3. **Test Your App**: Visit http://localhost:8080/library-management/
   - You should see your library management application

## If You Still Have Connection Issues:

### Check Port 8080:
```cmd
netstat -an | find "8080"
```
You should see something like:
```
TCP    0.0.0.0:8080    0.0.0.0:0    LISTENING
```

### Check Tomcat Service:
```cmd
sc query Tomcat11
```
Should show `STATE: 4  RUNNING`

### Check Java Processes:
```cmd
tasklist | find "java"
```

### Firewall Issues:
- Windows Firewall might be blocking port 8080
- Try temporarily disabling firewall to test
- Add exception for port 8080 if needed

### Manual Tomcat Start:
If automated scripts don't work:

1. **Open Command Prompt as Administrator**
2. **Set environment variable:**
   ```cmd
   set CATALINA_HOME=C:\Program Files\Apache Software Foundation\Tomcat 11.0
   ```
3. **Navigate to Tomcat bin:**
   ```cmd
   cd /d "C:\Program Files\Apache Software Foundation\Tomcat 11.0\bin"
   ```
4. **Start Tomcat:**
   ```cmd
   startup.bat
   ```

## Common Solutions:

| Problem | Solution |
|---------|----------|
| Connection Refused | Run `troubleshoot_tomcat.bat` |
| Port 8080 in use | Stop other web servers or change Tomcat port |
| Access Denied | Run commands as Administrator |
| Service won't start | Check Java installation and PATH |

## Verification Checklist:
- [ ] Database created successfully
- [ ] Tomcat service running
- [ ] Port 8080 accessible
- [ ] http://localhost:8080/ loads (Tomcat page)
- [ ] http://localhost:8080/library-management/ loads (your app)

Your application will work once all these steps are completed!