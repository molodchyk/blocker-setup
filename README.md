# Blocker setup

This is a guide for me for when I'm setting up blocker configuration for my new laptop/PC.



1. First go to regedit -> Computer\HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer and create REG_DWORD DisableSearchBoxSuggestions with value of 1.

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/7a8e350a-9898-4158-bce3-06d69e456a89)

This removes web results in the windows start:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/6662bc99-9767-49fe-b4ec-0de81ee8a2b5)

2. Remove the upper left arrow on Chrome

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/c553f96b-0620-4752-89b7-397cb68dd46f)

3. Disable Incognito Mode on Chrome

regedit -> Computer\HKEY_CURRENT_USER\Software\Policies\Google\Chrome -> REG_DWORD -> set value 1

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/46b6bcea-35bf-41c4-9671-35b712077790)

now it looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/1d92000f-4c3f-4290-be17-7e92a291148d)

4. Disable Guest Mode on Chrome

regedit -> Computer\HKEY_CURRENT_USER\Software\Policies\Google\Chrome -> BrowserGuestModeEnabled -> leave the value to 0.

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/e49fa010-2a23-40d7-8352-4eebdaca5c6c)

now the profiles window looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/61fa17db-6fec-4e24-a30a-eeacaa3b778f)

5. Disable adding new users to chrome

regedit -> Computer\HKEY_CURRENT_USER\Software\Policies\Google\Chrome -> BrowserAddPersonEnabled -> leave the value to 0.

now the profiles window looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/23fa73e3-b7fb-4aa7-a3f2-e669c4ebe2e8)

6. Enforce the english language as the UI language of the windows

Nls\Language looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/e570fbdb-4213-4b7c-bf03-3bce056ab3b4)

MUI\UILanguages\en-US looks like this: (remove all except en-US)

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/24162e64-6d84-4fc8-a8ec-fae32171c8e5)

MUI\Settings looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/9f278c5c-3119-4cc9-8f71-9d62a5a2729d)

this policy will enforce the language. 

Settings should look like this (now, we can't change the UI language)

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/ae18fa4f-9fd7-4089-9aa5-cdc7f4407221)

7. Our next step is to disable changing time and time zone in settings. It seems impossible to do it in regedit, so we will try to enable local group policy editor and local security policy.

I actually have no idea how robust adding these feature is, and even what it does, but here is the script to paste into cmd with admin rights:

FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") DO (DISM /Online /NoRestart /Add-Package:"%F")
FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~*.mum") DO (DISM /Online /NoRestart /Add-Package:"%F")

8. Now that we've activated these, press start + R to open Run, and type in secpol.msc and press Enter. Here, for "Change the system time" and "Change the time zone" leave only LOCAL SERVICE. Click Remove to remove the other users and click Apply and then Enter.

It should change from something like this:

![Screenshot 2024-02-17 010527](https://github.com/molodchyk/blocker-setup/assets/73010708/ef28e202-2315-42cc-90ce-48685c1fa81f)

To something like this:

![Screenshot 2024-02-17 011427](https://github.com/molodchyk/blocker-setup/assets/73010708/bd6691f6-81b3-4a2e-8e89-6c744677b1ab)

9. Remove permissions for Cold Turkey folders (both in C:\Program Files and in C:\ProgramData). Click on folder -> properties -> security -> advanced -> disable inheritance -> convert inherited permissions into explicit permissions on this object -> add -> select a principal -> advanced -> find now -> select administrators PC -> click ok -> for type, click deny -> for applies to, select "this folder only" -> show advanced permissions -> select ONLY list folder / read data -> click ok -> click ok -> click ok.

Should look something like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/2e3198ac-d21c-47fa-b4f1-3b55600ec1c6)

10. And for hosts file located at C:\Windows\System32\drivers\etc I added these entries to block the marketplace (websites can be accessed through their extensions and Cold Turkey and FocusMe can't block them)

127.0.0.1 plugins.jetbrains.com
127.0.0.1 marketplace.visualstudio.com

After adding these entries, these permissions should be denied:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/72abf637-afd3-49cd-a229-d0a7689d4ecf)

11. Add the URL from channel blocker to URLBlocklist to block removing entries:

go to regedit -> navigate to Computer\HKEY_CURRENT_USER\Software\Policies\Google\Chrome -> create folder URLBlocklist -> add a string and name it "1", add the URL of the extension, for example: chrome-extension://nfkmalbckemmklibjddenhnofgnfcdfp/ui/config/html/config.html


![image](https://github.com/molodchyk/blocker-setup/assets/73010708/37b54461-9214-448c-bffb-f5721d557e84)


12. FocusMe settings:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/12127227-9082-4451-8bae-e9d25d0662e7)

13. Enforce extensions:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/828db37e-711f-4e7f-9784-203b6e3f5444)


14. Download platform-tools folder. Connect BOOX Note 2 e reader to your PC via USB. Enable USB Debug Mode.

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/ecd8647e-535b-42a4-ac05-da4cc9d5f142)


First, we probably need to add platform-tools to the PATH. 

Search for Environment Variables:

Right-click on the 'Start' button and select 'System'.
Click on 'Advanced system settings' on the left sidebar.
In the 'System Properties' window, click on the 'Environment Variables...' button near the bottom.
Edit the PATH Environment Variable:

In the 'Environment Variables' window, under the 'System variables' section, scroll and find the Path variable, then click 'Edit...'.
Add the New Path:

In the 'Edit Environment Variable' window, click 'New' and then paste the path to your platform-tools directory: C:\Users\molod(""OR WHATEVER USER NAME YOU WILL HAVE HERE"")\AppData\Local\Android\Sdk\platform-tools.
Save the Changes:

Click 'OK' to close the 'Edit Environment Variable' window.
Click 'OK' again to close the 'Environment Variables' window.
Click 'OK' once more to close the 'System Properties' window.

Right click timelimit.bat. 

timelimit.bat contains the following script:

adb.exe shell pm uninstall -k --user 0 com.android.vending
adb.exe shell pm uninstall -k --user 0 com.google.android.gms
adb.exe shell pm uninstall -k --user 0 com.android.email
adb.exe shell pm uninstall -k --user 0 com.onyx.mail
pause


Click "Run as Administrator". In "Do you want to make changes to your device?" window, click Yes. 

Now ebook apps tab looks like this, even when having "Enable Google Play" "on"



![image](https://github.com/molodchyk/blocker-setup/assets/73010708/e028e345-0d4e-4764-8bc5-2cde73715db1)

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/31129408-41e7-4c63-816c-46b096507759)


15. Here I will keep track of Samsung's system apps I uninstalled.

Unfortunately there is script that enables them back and without rooting the phone it seems there is no way to remove that capability. But I just blocked the "adb shell" keyword from chat.openai.com and google.com so my hope is that I don't really remembered it and can't search it/ the reward effort calculation in my mind makes it not worth it. 


found this list made by google:


Critical Android system apps
Some system apps are critical for a device to function correctly. We do not recommend blocking or hiding these critical system apps:

android
com.android.bluetooth
com.android.contacts
com.android.keychain
com.android.keyguard
com.android.launcher
com.android.nfc
com.android.phone
com.android.providers.downloads
com.android.settings
com.android.systemui
com.android.vending
com.google.android.deskclock
com.google.android.dialer
com.google.android.gms
com.google.android.GoogleCamera
com.google.android.googlequicksearchbox
com.google.android.gsf
com.google.android.gsf.login
com.google.android.inputmethod.latin
com.google.android.marvin.talkback
com.google.android.nfcprovision
com.google.android.setupwizard
com.google.android.webview
com.samsung.android.contacts
com.samsung.android.phone

Android accessibility apps
Some Android system apps are for accessibility. We do not recommend blocking or hiding these apps:

com.google.android.accessibility.soundamplifier
com.google.audio.hearing.visualization.accessibility.scribe



::3/25/2024
adb.exe shell pm uninstall -k --user 0 com.samsung.android.kidsinstaller
adb.exe shell pm uninstall -k --user 0 com.samsung.storyservice
adb.exe shell pm uninstall -k --user 0 com.samsung.android.app.cocktailbarservice
adb.exe shell pm uninstall -k --user 0 com.samsung.android.themestore
adb.exe shell pm uninstall -k --user 0 com.sec.android.app.vepreload
adb.exe shell pm uninstall -k --user 0 com.samsung.android.app.dressroom
adb.exe shell pm uninstall -k --user 0 com.sec.android.easyonehand

:: related to wallpapers and icons I have downloaded from Themes or Wallpaper and style apps
adb.exe shell pm uninstall -k --user 0 minuhome.Earth.aodonly
adb.exe shell pm uninstall -k --user 0 com.xuanthai.NeonGalaxyAOD.aodonly
adb.exe shell pm uninstall -k --user 0 phinton_art.com.FREE_Moon_Light.aodonly
adb.exe shell pm uninstall -k --user 0 com.Maythemes.PicnicRabbits.aod.aodonly

adb.exe shell pm uninstall -k --user 0 com.einsindrei.EarthIIAOD
adb.exe shell pm uninstall -k --user 0 darkartcreations.AuroraNightsRT
adb.exe shell pm uninstall -k --user 0 com.pixome.ColorfulCheshire
adb.exe shell pm uninstall -k --user 0 com.xuanthai.tinyshootsfree

adb.exe shell pm uninstall -k --user 0 com.xuanthai.tinyshootsfree.callbg
adb.exe shell pm uninstall -k --user 0 com.pixome.ColorfulCheshire.callbg
adb.exe shell pm uninstall -k --user 0 kr.co.cogulplanet.www.SimpleRainbowPlaent.callbg
adb.exe shell pm uninstall -k --user 0 darkartcreations.AuroraNightsRT.callbg

adb.exe shell pm uninstall -k --user 0 com.pixome.ColorfulCheshire.home
adb.exe shell pm uninstall -k --user 0 com.einsindrei.EarthIIAOD.home
adb.exe shell pm uninstall -k --user 0 com.xuanthai.tinyshootsfree.home
adb.exe shell pm uninstall -k --user 0 darkartcreations.AuroraNightsRT.home
adb.exe shell pm uninstall -k --user 0 kr.co.cogulplanet.www.SimpleRainbowPlaent.home

::these I just think are wallpapers or icons I at some point downloaded
adb.exe shell pm uninstall -k --user 0 kimiroll.blog.me.Bluenight.wallpaperpack
adb.exe shell pm uninstall -k --user 0 com.einsindrei.EarthIIAOD.wallpaper
adb.exe shell pm uninstall -k --user 0 com.pixome.ColorfulCheshire.wallpaper
adb.exe shell pm uninstall -k --user 0 com.xuanthai.tinyshootsfree.wallpaper
adb.exe shell pm uninstall -k --user 0 darkartcreations.AuroraNightsRT.wallpaper
adb.exe shell pm uninstall -k --user 0 kr.co.cogulplanet.www.SimpleRainbowPlaent.wallpaper

adb.exe shell pm uninstall -k --user 0 xiehanying.Starsgalaxypurple.wallpaperpack

adb.exe shell pm uninstall -k --user 0 FelipeLeite.BlackestOS.appiconpack
adb.exe shell pm uninstall -k --user 0 SR.BeautifulForest.appiconpack
adb.exe shell pm uninstall -k --user 0 XIEHANYING.samsungtheme.NostalgiaO2_Wind.appiconpack
adb.exe shell pm uninstall -k --user 0 gabrielsantana.SimpleBlack.appiconpack

adb.exe shell pm uninstall -k --user 0 com.einsindrei.EarthIIAOD.appicon
adb.exe shell pm uninstall -k --user 0 com.pixome.ColorfulCheshire.appicon
adb.exe shell pm uninstall -k --user 0 com.xuanthai.tinyshootsfree.appicon
adb.exe shell pm uninstall -k --user 0 darkartcreations.AuroraNightsRT.appicon
adb.exe shell pm uninstall -k --user 0 kr.co.cogulplanet.www.SimpleRainbowPlaent.appicon

::3/26/2024
adb.exe shell pm uninstall -k --user 0 com.samsung.knox.securefolder
adb.exe shell pm uninstall -k --user 0 com.samsung.android.fast
adb.exe shell pm uninstall -k --user 0 com.samsung.android.forest
adb.exe shell pm uninstall -k --user 0 com.google.audio.hearing.visualization.accessibility.scribe
adb.exe shell pm uninstall -k --user 0 com.samsung.android.app.notes.addons
adb.exe shell pm uninstall -k --user 0 com.samsung.android.mdecservice
adb.exe shell pm uninstall -k --user 0 com.samsung.android.lool
adb.exe shell pm uninstall -k --user 0 com.sec.android.widgetapp.webmanual
adb.exe shell pm uninstall -k --user 0 com.samsung.android.vtcamerasettings
adb.exe shell pm uninstall -k --user 0 com.samsung.android.smartsuggestions
adb.exe shell pm uninstall -k --user 0 com.sec.android.easyMover.Agent
adb.exe shell pm uninstall -k --user 0 com.samsung.android.mcfserver
adb.exe shell pm uninstall -k --user 0 com.samsung.android.inputshare
adb.exe shell pm uninstall -k --user 0 com.sec.unifiedwfc

::3/26/2024
adb.exe shell pm uninstall -k --user 0 com.samsung.android.bixby.wakeup
adb.exe shell pm uninstall -k --user 0 de.axelspringer.yana.zeropage
adb.exe shell pm uninstall -k --user 0 com.sec.android.easyMover
adb.exe shell pm uninstall -k --user 0 com.samsung.android.app.spage
adb.exe shell pm uninstall -k --user 0 com.samsung.android.mdx
adb.exe shell pm uninstall -k --user 0 com.sec.android.mimage.avatarstickers
adb.exe shell pm uninstall -k --user 0 com.samsung.android.visionintelligence
adb.exe shell pm uninstall -k --user 0 com.samsung.android.bixby.agent
adb.exe shell pm uninstall -k --user 0 com.sec.android.app.samsungapps

pause








16. the place to store the password, permissions restriction:

![image](https://github.com/user-attachments/assets/31b2f942-10ad-40ec-81ad-80542886fcdf)
