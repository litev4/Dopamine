@echo off

:createpath
mkdir %appdata%\dopamine_service

:hide
if "%1"=="hide" goto admincheck
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit

:admincheck
net session >nul 2>&1
if %errorlevel% neq 0 (
    PowerShell -Command "Start-Process '%~dpnx0' -Verb RunAs"
    exit /b
)

:requirefilescheck
if not exist %systemdrive%\Windows\System32\PING.EXE goto requirecheckfilesfailed
if not exist %systemdrive%\Windows\System32\taskkill.exe goto requirecheckfilesfailed
if not exist %systemdrive%\Windows\System32\cmd.exe goto requirecheckfilesfailed
if not exist %systemdrive%\Windows\System32\wscript.exe goto requirecheckfilesfailed

:statecheck
if exist %appdata%\dopamine_service\state.dp goto judgeexist
start %appdata%\dopamine\state-display.bat
goto mainservice

:judgeexist
del /f /s /q %appdata%\dopamine_service\state.dp
ping 127.0.0.1 -n 2 >nul
if exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\turnoff.dp
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

:requirecheckfilesfailed
clip > %appdata%\dopamine_service\nofiles.dp
start %appdata%\dopamine\state-display.bat
exit