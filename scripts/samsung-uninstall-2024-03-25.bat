@echo off
setlocal

set "ADB=%~dp0..\platform-tools\adb.exe"
if not exist "%ADB%" set "ADB=adb.exe"

echo Using %ADB%
echo Samsung app removal block from 2024-03-25.
echo.

call :uninstall com.samsung.android.kidsinstaller
call :uninstall com.samsung.storyservice
call :uninstall com.samsung.android.app.cocktailbarservice
call :uninstall com.samsung.android.themestore
call :uninstall com.sec.android.app.vepreload
call :uninstall com.samsung.android.app.dressroom
call :uninstall com.sec.android.easyonehand

rem Related to wallpapers and icons downloaded from Themes or Wallpaper and style apps.
call :uninstall minuhome.Earth.aodonly
call :uninstall com.xuanthai.NeonGalaxyAOD.aodonly
call :uninstall phinton_art.com.FREE_Moon_Light.aodonly
call :uninstall com.Maythemes.PicnicRabbits.aod.aodonly

call :uninstall com.einsindrei.EarthIIAOD
call :uninstall darkartcreations.AuroraNightsRT
call :uninstall com.pixome.ColorfulCheshire
call :uninstall com.xuanthai.tinyshootsfree

call :uninstall com.xuanthai.tinyshootsfree.callbg
call :uninstall com.pixome.ColorfulCheshire.callbg
call :uninstall kr.co.cogulplanet.www.SimpleRainbowPlaent.callbg
call :uninstall darkartcreations.AuroraNightsRT.callbg

call :uninstall com.pixome.ColorfulCheshire.home
call :uninstall com.einsindrei.EarthIIAOD.home
call :uninstall com.xuanthai.tinyshootsfree.home
call :uninstall darkartcreations.AuroraNightsRT.home
call :uninstall kr.co.cogulplanet.www.SimpleRainbowPlaent.home

rem These are probably wallpapers or icons downloaded at some point.
call :uninstall kimiroll.blog.me.Bluenight.wallpaperpack
call :uninstall com.einsindrei.EarthIIAOD.wallpaper
call :uninstall com.pixome.ColorfulCheshire.wallpaper
call :uninstall com.xuanthai.tinyshootsfree.wallpaper
call :uninstall darkartcreations.AuroraNightsRT.wallpaper
call :uninstall kr.co.cogulplanet.www.SimpleRainbowPlaent.wallpaper

call :uninstall xiehanying.Starsgalaxypurple.wallpaperpack

call :uninstall FelipeLeite.BlackestOS.appiconpack
call :uninstall SR.BeautifulForest.appiconpack
call :uninstall XIEHANYING.samsungtheme.NostalgiaO2_Wind.appiconpack
call :uninstall gabrielsantana.SimpleBlack.appiconpack

call :uninstall com.einsindrei.EarthIIAOD.appicon
call :uninstall com.pixome.ColorfulCheshire.appicon
call :uninstall com.xuanthai.tinyshootsfree.appicon
call :uninstall darkartcreations.AuroraNightsRT.appicon
call :uninstall kr.co.cogulplanet.www.SimpleRainbowPlaent.appicon

pause
exit /b

:uninstall
"%ADB%" shell pm uninstall -k --user 0 %~1
exit /b
