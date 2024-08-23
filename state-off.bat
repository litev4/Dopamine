@echo off
title Dopamine Loader

:hide
if "%1"=="hide" goto admincheck
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit

:admincheck
net session >nul 2>&1
if %errorlevel% neq 0 (
    PowerShell -Command "Start-Process '%~dpnx0' -Verb RunAs"
    exit /b
)


:off
del /f /s /q %appdata%\dopamine_service\turnoff.dp
start %appdata%\dopamine\state-off.vbs
taskkill /f /im cmd.exe
exit