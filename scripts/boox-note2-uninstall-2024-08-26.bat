@echo off
setlocal

set "ADB=%~dp0..\platform-tools\adb.exe"
if not exist "%ADB%" set "ADB=adb.exe"

echo Using %ADB%
echo BOOX Note 2 app removal block from 2024-08-26.
echo.

call :uninstall com.android.calendar
call :uninstall com.google.android.syncadapters.calendar
call :uninstall com.onyx.easytransfer
call :uninstall com.simplemobiletools.clock
call :uninstall com.qualcomm.qti.sva
call :uninstall com.simplemobiletools.voicerecorder
call :uninstall com.simplemobiletools.musicplayer
call :uninstall com.simplemobiletools.gallery
call :uninstall com.onyx.dict
call :uninstall com.onyx.appmarket
call :uninstall com.onyx.calculator
call :uninstall com.qualcomm.timeservice
call :uninstall com.android.stk
call :uninstall com.qualcomm.qti.poweroffalarm
call :uninstall com.google.android.syncadapters.contacts
call :uninstall com.google.android.tts
call :uninstall com.google.android.gsf
call :uninstall com.google.android.partnersetup
call :uninstall com.qualcomm.qti.ims
call :uninstall com.qti.dpmserviceapp

pause
exit /b

:uninstall
"%ADB%" shell pm uninstall -k --user 0 %~1
exit /b
