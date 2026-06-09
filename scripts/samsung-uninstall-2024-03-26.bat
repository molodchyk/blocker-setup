@echo off
setlocal

set "ADB=%~dp0..\platform-tools\adb.exe"
if not exist "%ADB%" set "ADB=adb.exe"

echo Using %ADB%
echo Samsung app removal blocks from 2024-03-26.
echo.

call :uninstall com.samsung.knox.securefolder
call :uninstall com.samsung.android.fast
call :uninstall com.samsung.android.forest
call :uninstall com.google.audio.hearing.visualization.accessibility.scribe
call :uninstall com.samsung.android.app.notes.addons
call :uninstall com.samsung.android.mdecservice
call :uninstall com.samsung.android.lool
call :uninstall com.sec.android.widgetapp.webmanual
call :uninstall com.samsung.android.vtcamerasettings
call :uninstall com.samsung.android.smartsuggestions
call :uninstall com.sec.android.easyMover.Agent
call :uninstall com.samsung.android.mcfserver
call :uninstall com.samsung.android.inputshare
call :uninstall com.sec.unifiedwfc

call :uninstall com.samsung.android.bixby.wakeup
call :uninstall de.axelspringer.yana.zeropage
call :uninstall com.sec.android.easyMover
call :uninstall com.samsung.android.app.spage
call :uninstall com.samsung.android.mdx
call :uninstall com.sec.android.mimage.avatarstickers
call :uninstall com.samsung.android.visionintelligence
call :uninstall com.samsung.android.bixby.agent
call :uninstall com.sec.android.app.samsungapps

pause
exit /b

:uninstall
"%ADB%" shell pm uninstall -k --user 0 %~1
exit /b
