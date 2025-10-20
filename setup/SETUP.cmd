reg import %~dp0\KEYMAP.reg
reg import %~dp0\KBD.reg

pwsh.exe .\MakeStartupLink.ps1

echo off

echo ##########################################
echo          Type [Enter] to reboot
echo ##########################################

pause

rem logoff
shutdown /g /t
