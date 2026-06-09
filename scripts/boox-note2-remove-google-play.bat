@echo off
setlocal

set "ADB=%~dp0..\platform-tools\adb.exe"
if not exist "%ADB%" set "ADB=adb.exe"

echo Using %ADB%
echo Removing BOOX Note 2 Google Play and mail packages from user 0.
echo.

call :uninstall com.android.vending
call :uninstall com.google.android.gms
call :uninstall com.android.email
call :uninstall com.onyx.mail

pause
exit /b

:uninstall
"%ADB%" shell pm uninstall -k --user 0 %~1
exit /b
