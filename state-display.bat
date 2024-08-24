@echo off
title dontkillme

:setversion
set servicename=Dopamine
set version=v1.7
set codename=alpha
set website=https://litev4.github.io/dopamine-web/

:checkaction
if exist "%appdata%\dopamine_service\turnoff.dp" goto off

:checkrequiredfiles
if exist "%appdata%\dopamine_service\nofiles.dp" goto nofiles

:checklanguagefiles
if exist "%appdata%\dopamine_service\language.dp" goto lang

:displaystate

:on
echo off
mode con cols=49 lines=10
color f3
title %servicename% Service is running!
echo.
echo.
echo.
echo                         √
echo              %servicename% 服务已成功运行
echo                按任意键关闭该窗口
echo.
echo.
echo %servicename% Service 版本 - %version% %codename%
set /p =官方网址 - %website%<nul
pause >nul
exit

:off
del /f /s /q "%appdata%\dopamine_service\turnoff.dp"
taskkill /f /fi "imagename eq cmd.exe" /fi "windowtitle eq 管理员:  mwtonthe_top"
taskkill /f /fi "imagename eq cmd.exe" /fi "windowtitle eq 管理员:  %servicename% Service is running!"
taskkill /f /fi "imagename eq cmd.exe" /fi "windowtitle eq 管理员:  %servicename% Service start failed."
echo off
mode con cols=49 lines=10
color fa
title %servicename% Service stopped.
echo.
echo.
echo.
echo                         O
echo              %servicename% 服务已成功停止
echo                按任意键关闭该窗口
echo.
echo.
echo %servicename% Service 版本 - %version% %codename%
set /p =官方网址 - %website%<nul
pause >nul
exit

:nofiles
del /f /s /q "%appdata%\dopamine_service\nofiles.dp"
echo off
mode con cols=49 lines=10
color f4
title %servicename% Service start failed.
echo.
echo.
echo.
echo                         X
echo              %servicename% 服务无法运行
echo                   缺少系统文件
echo                按任意键关闭该窗口
echo.
echo %servicename% Service 版本 - %version% %codename%
set /p =官方网址 - %website%<nul
pause >nul
exit

:lang
del /f /s /q "%appdata%\dopamine_service\language.dp"
echo off
mode con cols=49 lines=10
color f4
title %servicename% Service start failed.
echo.
echo.
echo.
echo                         X
echo              %servicename% 服务无法运行
echo                   系统语言错误
echo                按任意键关闭该窗口
echo.
echo %servicename% Service 版本 - %version% %codename%
set /p =官方网址 - %website%<nul
pause >nul
exit