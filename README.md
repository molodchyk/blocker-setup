# blocker-setup

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

