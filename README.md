# blocker-setup

This is a guide for me for when I'm setting up blocker configuration for my new laptop/PC.



1. First go to regedit -> Computer\HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer and create REG_DWORD DisableSearchBoxSuggestions with value of 1.

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/7a8e350a-9898-4158-bce3-06d69e456a89)

This removes web results in the windows start:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/6662bc99-9767-49fe-b4ec-0de81ee8a2b5)

2. Remove the upper left arrow on Chrome

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/c553f96b-0620-4752-89b7-397cb68dd46f)

4. Disable Incognito Mode on Chrome

regedit -> Computer\HKEY_CURRENT_USER\Software\Policies\Google\Chrome -> REG_DWORD -> set value 1

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/46b6bcea-35bf-41c4-9671-35b712077790)

now it looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/1d92000f-4c3f-4290-be17-7e92a291148d)

5. Disable Guest Mode on Chrome

regedit -> Computer\HKEY_CURRENT_USER\Software\Policies\Google\Chrome -> BrowserGuestModeEnabled -> leave the value to 0.

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/e49fa010-2a23-40d7-8352-4eebdaca5c6c)

now the profiles window looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/61fa17db-6fec-4e24-a30a-eeacaa3b778f)

6. Disable adding new users to chrome

regedit -> Computer\HKEY_CURRENT_USER\Software\Policies\Google\Chrome -> BrowserAddPersonEnabled -> leave the value to 0.

now the profiles window looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/23fa73e3-b7fb-4aa7-a3f2-e669c4ebe2e8)

7. Enforce the english language as the UI language of the windows

Nls\Language looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/e570fbdb-4213-4b7c-bf03-3bce056ab3b4)

MUI\UILanguages\en-US looks like this: (remove all except en-US)

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/24162e64-6d84-4fc8-a8ec-fae32171c8e5)

MUI\Settings looks like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/9f278c5c-3119-4cc9-8f71-9d62a5a2729d)

this policy will enforce the language. 

Settings should look like this (now, we can't change the UI language)

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/ae18fa4f-9fd7-4089-9aa5-cdc7f4407221)

8. Our next step is to disable changing time and time zone in settings. It seems impossible to do it in regedit, so we will try to enable local group policy editor and local security policy.

I actually have no idea how robust adding these feature is, and even what it does, but here is the script to paste into cmd with admin rights:

FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") DO (DISM /Online /NoRestart /Add-Package:"%F")
FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~*.mum") DO (DISM /Online /NoRestart /Add-Package:"%F")

9. Now that we've activated these, press start + R to open Run, and type in secpol.msc and press Enter. Here, for "Change the system time" and "Change the time zone" leave only LOCAL SERVICE. Click Remove to remove the other users and click Apply and then Enter.

It should change from something like this:

![Screenshot 2024-02-17 010527](https://github.com/molodchyk/blocker-setup/assets/73010708/ef28e202-2315-42cc-90ce-48685c1fa81f)

To something like this:

![Screenshot 2024-02-17 011427](https://github.com/molodchyk/blocker-setup/assets/73010708/bd6691f6-81b3-4a2e-8e89-6c744677b1ab)

10. FocusMe settings:


![image](https://github.com/molodchyk/blocker-setup/assets/73010708/1da15769-a545-4fde-a996-eca0e2ea83c6)

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/40198da4-1565-40d1-baae-e97395709ddf)

11. Remove permissions for Cold Turkey folders (both in C:\Program Files and in C:\ProgramData). Click on folder -> properties -> security -> advanced -> disable inheritance -> convert inherited permissions into explicit permissions on this object -> add -> select a principal -> advanced -> find now -> select administrators PC -> click ok -> for type, click deny -> for applies to, select "this folder only" -> show advanced permissions -> select list folder / read data -> click ok -> click ok -> click ok.

Should look something like this:

![image](https://github.com/molodchyk/blocker-setup/assets/73010708/2e3198ac-d21c-47fa-b4f1-3b55600ec1c6)

14. And for hosts file located at C:\Windows\System32\drivers\etc, ...
