@echo off
setlocal

echo This script should be run from an elevated Command Prompt.
echo It mirrors the Local Group Policy Editor setup commands from README.md.
echo.

for %%F in ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") do (
  DISM /Online /NoRestart /Add-Package:"%%~F"
)

for %%F in ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~*.mum") do (
  DISM /Online /NoRestart /Add-Package:"%%~F"
)

pause
