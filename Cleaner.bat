@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Prosze czekac
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:--------------------------------------
title Cleaner 2.0
:menu
cls
echo Cleaner 2.0 - by HeXed
echo ----------------------------------------
echo 1 - szybkie czysczenie
echo ----------------------------------------
echo 2 - dokladne czysczenie
echo ----------------------------------------
echo 3 - optymalizacja
echo ----------------------------------------
echo 4 - Wyjdz
echo ----------------------------------------
set/p "wybor= > "
if %wybor%==1 goto otemp
if %wybor%==2 goto all
if %wybor%==3 goto opt
if %wybor%==4 exit
echo Bledny wybor
goto menu
:otemp
echo Prosze czekac
del /F /S /Q %TEMP%
echo Ukonczono
pause
goto menu
:all
del /F /S /Q %TEMP%
del /F /S /Q "%localappdata%\Google\Chrome\User Data\Default\cache\"
del /F /S /Q "%localappdata%\Google\Chrome\User Data\Default\Code Cache\"
del /F /S /Q "%localappdata%\Microsoft\Edge\User Data\Default\Cache\"
del /F /S /Q "%localappdata%\Microsoft\Edge\User Data\Default\Code Cache\"
:opt
cls
taskkill /F /IM YourPhone.exe
taskkill /F /IM YourPhoneServer.exe
taskkill /F /IM SearchApp.exe
taskkill /F /IM TabTip.exe
taskkill /F /IM TextInputHost.exe
taskkill /F /IM WinStore.App.exe
echo Ukonczono
goto menu