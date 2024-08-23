@echo off

:setversion
set servicename=Dopamine
set version=v1.3
set codename=rewrite-backport
set website=https://litev4.github.io/dopamine-web/

:checkaction
if exist %appdata%\dopamine_service\turnoff.dp goto off

:checkrequiredfiles
if exist %appdata%\dopamine_service\nofiles.dp goto nofiles

:displaystate

:on
echo off
mode con cols=49 lines=10
color f3
title %servicename% Service.
echo.
echo.
echo.
echo                         √
echo              %servicename% 服务已成功运行
echo                按任意键关闭该窗口
echo.
echo.
echo %servicename% Service 版本 / %version% %codename%
set /p =官方网址 / %website%<nul
pause >nul
exit

:off
del /f /s /q %appdata%\dopamine_service\turnoff.dp
start %appdata%\dopamine\state-off.vbs
taskkill /f /im cmd.exe
exit

:nofiles
del /f /s /q %appdata%\dopamine_service\nofiles.dp
echo off
mode con cols=49 lines=10
color f4
title %servicename% Service.
echo.
echo.
echo.
echo                         X
echo              %servicename% 服务无法运行
echo                   缺少系统文件
echo                按任意键关闭该窗口
echo.
echo %servicename% Service 版本 / %version% %codename%
set /p =官方网址 / %website%<nul
pause >nul
exit