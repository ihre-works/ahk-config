reg import %~dp0\KEYMAP.reg
reg import %~dp0\KBD.reg

copy %~dp0\AutoHotkey64_UIA.lnk "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

echo off

echo ##########################################
echo          Type [Enter] to reboot
echo ##########################################

pause

rem logoff
shutdown /g /t 0
