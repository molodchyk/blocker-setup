# Extracted scripts

These scripts mirror command blocks from `README.md`. Review each script before running it, connect the intended Android device over USB, enable USB debugging, and run from an elevated Command Prompt when Windows asks for administrator permission.

The ADB scripts first try to use `..\platform-tools\adb.exe` from this repository. If that file is not present, they fall back to `adb.exe` from `PATH`.

| Script | Purpose |
| --- | --- |
| `enable-local-policy-tools.cmd` | Enables Local Group Policy Editor and Local Security Policy packages on Windows editions where they are missing. |
| `boox-note2-remove-google-play.bat` | Removes Google Play, Google Play Services, Android Email, and Onyx Mail for the BOOX Note 2 setup from the guide. |
| `boox-note2-uninstall-2024-08-26.bat` | Mirrors the BOOX Note 2 app removal block dated 2024-08-26. |
| `samsung-uninstall-2024-03-25.bat` | Mirrors the Samsung app removal block dated 2024-03-25. |
| `samsung-uninstall-2024-03-26.bat` | Mirrors the Samsung app removal blocks dated 2024-03-26. |
| `samsung-uninstall-2024-09-01.bat` | Mirrors the Samsung app removal block dated 2024-09-01. |
