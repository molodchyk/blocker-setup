@echo off
setlocal

set "ADB=%~dp0..\platform-tools\adb.exe"
if not exist "%ADB%" set "ADB=adb.exe"

echo Using %ADB%
echo Samsung app removal block from 2024-09-01.
echo.

call :uninstall com.google.android.partnersetup
call :uninstall com.google.android.gms.supervision
call :uninstall com.android.dreams.basic
call :uninstall com.samsung.app.newtrim

rem Probably Samsung's OTA update app that keeps installing bloatware on the phone.
call :uninstall com.wssyncmldm

pause
exit /b

:uninstall
"%ADB%" shell pm uninstall -k --user 0 %~1
exit /b
