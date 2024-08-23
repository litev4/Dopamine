@echo off
title Dopamine Service.

:hide
if "%1"=="hide" goto admincheck
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit

:admincheck
net session >nul 2>&1
if %errorlevel% neq 0 (
    PowerShell -Command "Start-Process '%~dpnx0' -Verb RunAs"
    exit /b
)

:rundisplaymodule
start %appdata%\dopamine\state-display.bat

:mainservice
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
taskkill /f /im SeewoCore.exe
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
taskkill /f /im SeewoAbility.exe
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
taskkill /f /im EasiAgent.exe
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
taskkill /f /im Easiupdate3Protect.exe
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
taskkill /f /im Easiupdate3.exe
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
taskkill /f /im SeewoServiceAssistant.exe
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
taskkill /f /im SeewoHugoLauncher.exe
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
taskkill /f /im SeewoFreezeUpdateAssist.exe
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
goto mainservice
