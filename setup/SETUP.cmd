reg import %~dp0\KEYMAP.reg
reg import %~dp0\KBD.reg

echo off

echo ##########################################
echo          Type [Enter] to reboot
echo ##########################################

pause

rem logoff
shutdown /g /t 0
