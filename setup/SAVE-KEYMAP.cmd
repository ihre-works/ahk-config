@echo off
rem Save Keyboard Layout Registry

reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" KEYMAP.reg
