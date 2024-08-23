@echo off
title Dopamine Loader

:createpath
mkdir %appdata%\dopamine_service

:requirefilescheck
if not exist %systemdrive%\Windows\System32\PING.EXE goto requirecheckfilesfailed
if not exist %systemdrive%\Windows\System32\taskkill.exe goto requirecheckfilesfailed
if not exist %systemdrive%\Windows\System32\cmd.exe goto requirecheckfilesfailed
if not exist %systemdrive%\Windows\System32\wscript.exe goto requirecheckfilesfailed

:statecheck
if exist %appdata%\dopamine_service\state.dp goto judgeexistence
goto runservice

:judgeexistence
del /f /s /q %appdata%\dopamine_service\state.dp
cls
color f3
echo ÇëµÈ´ýDopamine¼ÓÔØ...
ping 127.0.0.1 -n 2 >nul
if exist %appdata%\dopamine_service\state.dp goto turnoff
if not exist %appdata%\dopamine_service\state.dp goto runservice

:runservice
start %appdata%\Dopamine\background-service.bat
exit

:turnoff
start %appdata%\Dopamine\state-off.bat
exit

:requirecheckfilesfailed
clip > %appdata%\dopamine_service\nofiles.dp
start %appdata%\Dopamine\state-display.bat
exit