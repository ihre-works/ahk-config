@echo off
rem Save Keyboard Layout Registry

if "%~1" == "" (
    echo Usage: %~0 NAME
    echo    Save Keyboard Layout to KEYMAP-NAME.reg
    exit /b 1
)

reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" KEYMAP-%1.reg
