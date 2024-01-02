@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:: Define the registry paths where uninstall information is stored
SET REG_PATH1=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall
SET REG_PATH2=HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall

:: Initialize variable to store the version and the uninstall string
SET NETSUPPORT_VERSION=
SET UNINSTALL_STRING=

:: Find NetSupport version and uninstall string in the registry
FOR /F "tokens=*" %%A IN ('REG QUERY %REG_PATH1% /s /f "NetSupport" 2^>nul') DO (
    FOR /F "tokens=2,*" %%B IN ('REG QUERY "%%A" /v "DisplayVersion" 2^>nul') DO SET NETSUPPORT_VERSION=%%C
    FOR /F "tokens=2,*" %%B IN ('REG QUERY "%%A" /v "UninstallString" 2^>nul') DO SET UNINSTALL_STRING=%%C
)
IF NOT DEFINED NETSUPPORT_VERSION (
    FOR /F "tokens=*" %%A IN ('REG QUERY %REG_PATH2% /s /f "NetSupport" 2^>nul') DO (
        FOR /F "tokens=2,*" %%B IN ('REG QUERY "%%A" /v "DisplayVersion" 2^>nul') DO SET NETSUPPORT_VERSION=%%C
        FOR /F "tokens=2,*" %%B IN ('REG QUERY "%%A" /v "UninstallString" 2^>nul') DO SET UNINSTALL_STRING=%%C
    )
)


:: Check if the version was found and display it
IF DEFINED NETSUPPORT_VERSION (
    ECHO NetSupport version found: %NETSUPPORT_VERSION%
    ECHO.
    :: Ask the user if they want to uninstall NetSupport
    SET /P REMOVE="Would you like to completely remove NetSupport from your system? (Y/N)? "
	ECHO.
    IF /I "%REMOVE%"=="Y" OR /I "%REMOVE%"=="YES" (
        ECHO Checking for running processes that need to be terminated...

        :: Call killtasks.bat here
        CALL T:\TechServices-FP3\Techs\Jared\Scripts_J\IndividualScripts\killtasks.bat
        IF ERRORLEVEL 1 (
            ECHO Error occurred in killtasks.bat.
        )
		ECHO.

		:: Now, call regRun.bat
		powershell -NoProfile -ExecutionPolicy Bypass -File "T:\TechServices-FP3\Techs\Jared\Scripts_J\RegBangChecker\NetSuppRemoveRegCheck.ps1"
        IF %ERRORLEVEL% NEQ 0 (
            ECHO Error occurred in regCheck.ps1
        )
		echo.
		
        ECHO Attempting to remove NetSupport installation folder...
        RMDIR /S /Q "C:\Program Files (x86)\NetSupport"
        ECHO Folder removed or not found.
		
		
		ECHO.
        ECHO Proceeding with NetSupport uninstallation...
        :: Use the uninstall string from the registry to uninstall NetSupport
        START "" %UNINSTALL_STRING%
        ECHO Uninstallation and cleanup complete.
		ECHO.
		
    ) ELSE (
        ECHO Uninstallation aborted.
		
    )
) ELSE (
    ECHO Unable to determine the installed version of NetSupport.
	ECHO.
)

ENDLOCAL
pause
