@echo off
SETLOCAL EnableDelayedExpansion
SET version=1.0
title Chrome Tweaker 
chcp 65000
color 0
cls
goto startmenu

:startmenu
@echo off
mode con cols=61 lines=17
cls
echo.
echo.
echo.                    Chrome Tweaker 1.0
echo.            ===================================
echo.
echo.                 1:Tweaks          2:Revert
echo.
echo.                           X:Exit
echo.
echo.            ===================================
echo.
SET /P AREYOUSURE=
IF %AREYOUSURE%==1 GOTO tweaks
IF %AREYOUSURE%==2 GOTO revents
IF %AREYOUSURE%==X GOTO ext
IF %AREYOUSURE%==x GOTO ext
goto startmenu

:tweaks
@echo off
mode con cols=61 lines=17
cls
echo.
echo.
echo.                        Tweaks
echo.          ===================================
echo.
echo.       1:Chrome Config         2:Disable Google Update
echo.
echo.       3:Disable Feedback      4:Disable Error Reporting
echo.
echo.       5:Metrics Tweaks        X:Main Menu
echo.
echo.          ===================================
SET /P AREYOUSURE=
IF %AREYOUSURE%==1 GOTO chromeconf
IF %AREYOUSURE%==2 GOTO disupdate
IF %AREYOUSURE%==3 GOTO hatefeed
IF %AREYOUSURE%==4 GOTO sreport
IF %AREYOUSURE%==5 GOTO btmetrics
IF %AREYOUSURE%==x GOTO home
IF %AREYOUSURE%==X GOTO home
goto tweaks

:revents
@echo off
mode con cols=61 lines=17
cls
echo.
echo.
echo.                        Revent
echo.          ===================================
echo.
echo.       1:Remove Chrome Config       2:Enable Google Update
echo.
echo.       3:Enable Feedback            4:Enable Error Reporting
echo.
echo.       5:Remvove Metrics Tweaks     X: Main Menu
echo.
echo.          ===================================
SET /P AREYOUSURE=
IF %AREYOUSURE%==1 GOTO rechromeconf
IF %AREYOUSURE%==2 GOTO enupdate
IF %AREYOUSURE%==3 GOTO lovefeed
IF %AREYOUSURE%==4 GOTO lreport
IF %AREYOUSURE%==5 GOTO metrics
IF %AREYOUSURE%==x Goto homes
IF %AREYOUSURE%==X GOTO homes
goto revent

:chromeconf
cls
icacls "%localappdata%\Google\Chrome\User Data\SwReporter" /inheritance:r /deny "*S-1-1-0:(OI)(CI)(F)" "*S-1-5-7:(OI)(CI)(F)"
cacls "%localappdata%\Google\Chrome\User Data\SwReporter" /e /c /d %username%
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /t REG_SZ /d "software_reporter_tool.exe" /f
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto tweaks

:disupdate
cls
:: google software update service, not chrome but fits here
sc stop "gupdate" & sc config "gupdate" start=disabled
sc stop "gupdatem" & sc config "gupdatem" start=disabled
schtasks /change /disable /tn "GoogleUpdateTaskMachineCore"
schtasks /change /disable /tn "GoogleUpdateTaskMachineUA"
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto tweaks

:hatefeed
cls
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "UserFeedbackAllowed" /t REG_DWORD /d 0 /f
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto tweaks

:sreport
cls
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupReportingEnabled" /t REG_DWORD /d 0 /f
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto tweaks

:btmetrics
cls
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_DWORD /d 0 /f
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto tweaks

:rechromeconf
cls
icacls "%localappdata%\Google\Chrome\User Data\SwReporter" /inheritance:r /allow "*S-1-1-0:(OI)(CI)(F)" "*S-1-5-7:(OI)(CI)(F)"
cacls "%localappdata%\Google\Chrome\User Data\SwReporter" /e /c /d %username%
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun"
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto revents

:enupdate
cls
:: google software update service, not chrome but fits here
sc config "gupdate" start=demand
sc config "gupdatem" start=demand
schtasks /change /enable /tn "GoogleUpdateTaskMachineCore"
schtasks /change /enable /tn "GoogleUpdateTaskMachineUA"
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto revents

:lovefeed
cls
reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v "UserFeedbackAllowed"
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto revents

:lreport
cls
reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupReportingEnabled"
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto revents

:metrics
cls
reg delete "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled"
cls
echo.
Echo.2
timeout /t 1 /nobreak > nul
Echo.1
timeout /t 1 /nobreak > nul
goto revents

:homes
cls
goto startmenu

:home
cls
goto startmenu

:ext
exit
