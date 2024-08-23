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
ping 127.0.0.1 -n 3 >nul
if exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\turnoff.dp
start %appdata%\dopamine\state-display.bat

:mainservice
taskkill /f /im SeewoCore.exe
taskkill /f /im SeewoAbility.exe
taskkill /f /im EasiAgent.exe
taskkill /f /im Easiupdate3Protect.exe
taskkill /f /im Easiupdate3.exe
taskkill /f /im SeewoServiceAssistant.exe
taskkill /f /im SeewoHugoLauncher.exe
taskkill /f /im SeewoFreezeUpdateAssist.exe

:keepstate
if not exist %appdata%\dopamine_service\state.dp clip > %appdata%\dopamine_service\state.dp
goto mainservice

:requirecheckfilesfailed
clip > %appdata%\dopamine_service\nofiles.dp
start %appdata%\dopamine\state-display.bat
exit