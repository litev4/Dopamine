@echo off
:preventnotgettingkilled
title mwtonthe_top

:createpath
mkdir "%appdata%\dopamine_service"
cls

:hide
if "%1"=="hide" goto admincheck
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit

:admincheck
net session >nul 2>&1
if %errorlevel% neq 0 (
    PowerShell -Command "Start-Process '%~dpnx0' -Verb RunAs"
    exit /b
)

:checklanguage
ver|find "版本" >nul&&set ver=chinese||set ver=notchinese
if %ver%==notchinese goto languagecheckfailed

:requirefilescheck
if not exist "%systemdrive%\Windows\System32\PING.EXE" goto requirecheckfilesfailed
if not exist "%systemdrive%\Windows\System32\taskkill.exe" goto requirecheckfilesfailed
if not exist "%systemdrive%\Windows\System32\cmd.exe goto" requirecheckfilesfailed

:statecheck
if exist "%appdata%\dopamine_service\state.dp" goto judgeexist
start "%appdata%\dopamine\state-display.bat"
goto mainservice

:judgeexist
del /f /s /q "%appdata%\dopamine_service\state.dp"
cls
ping 127.0.0.1 -n 2 >nul
if exist "%appdata%\dopamine_service\state.dp" clip > "%appdata%\dopamine_service\turnoff.dp"
start "%appdata%\dopamine\state-display.bat"

:mainservice
taskkill /f /fi "imagename eq cmd.exe" /fi "windowtitle eq 管理员:  Dopamine Service stopped."
:loop
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
goto loop

:requirecheckfilesfailed
clip > "%appdata%\dopamine_service\nofiles.dp"
start "%appdata%\dopamine\state-display.bat"
exit

:languagecheckfailed
clip > "%appdata%\dopamine_service\language.dp"
start "%appdata%\dopamine\state-display.bat"
exit