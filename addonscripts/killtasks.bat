@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:: Check and terminate client32.exe if it is running
TASKLIST | FINDSTR /I "client32.exe" >nul 2>&1
IF NOT ERRORLEVEL 1 (
    TASKKILL /F /IM "client32.exe" >nul 2>&1
    IF NOT ERRORLEVEL 1 (
        ECHO client32.exe process terminated.
    ) ELSE (
        ECHO Failed to terminate client32.exe.
    )
) ELSE (
    ECHO client32.exe is not running.
)

:: Check and terminate RevitAccelerator.exe if it is running
TASKLIST | FINDSTR /I "RevitAccelerator.exe" >nul 2>&1
IF NOT ERRORLEVEL 1 (
    TASKKILL /F /IM "RevitAccelerator.exe"
    ECHO RevitAccelerator.exe process terminated.
) ELSE (
    ECHO RevitAccelerator.exe is not running.
)

:: Check and terminate Runplugin64.exe if it is running
TASKLIST | FINDSTR /I "Runplugin64.exe" >nul 2>&1
IF NOT ERRORLEVEL 1 (
    TASKKILL /F /IM "Runplugin64.exe"
    ECHO Runplugin64.exe process terminated.
) ELSE (
    ECHO Runplugin64.exe is not running.
)

:: Check and terminate runplugin.exe if it is running
TASKLIST | FINDSTR /I "runplugin.exe" >nul 2>&1
IF NOT ERRORLEVEL 1 (
    TASKKILL /F /IM "runplugin.exe"
    ECHO runplugin.exe process terminated.
) ELSE (
    ECHO runplugin.exe is not running.
)

:: Check and terminate node.exe if it is running
TASKLIST | FINDSTR /I "node.exe" >nul 2>&1
IF NOT ERRORLEVEL 1 (
    TASKKILL /F /IM "node.exe"
    ECHO node.exe process terminated.
) ELSE (
    ECHO node.exe is not running.
)

:: Check and terminate msedge.exe if it is running
TASKLIST | FINDSTR /I "msedge.exe" >nul 2>&1
IF NOT ERRORLEVEL 1 (
    TASKKILL /F /IM "msedge.exe"
    ECHO msedge.exe process terminated.
) ELSE (
    ECHO msedge.exe is not running.
)

:: Check and terminate smartscreen.exe if it is running
TASKLIST | FINDSTR /I "smartscreen.exe" >nul 2>&1
IF NOT ERRORLEVEL 1 (
    TASKKILL /F /IM "smartscreen.exe"
    ECHO smartscreen.exe process terminated.
) ELSE (
    ECHO smartscreen.exe is not running.
) 

:: Check and terminate CollaborationKeysController.exe if it is running
TASKLIST | FINDSTR /I "CollaborationKeysController.exe" >nul 2>&1
IF NOT ERRORLEVEL 1 (
    TASKKILL /F /IM "CollaborationKeysController.exe"
    ECHO CollaborationKeysController.exe process terminated.
) ELSE (
    ECHO CollaborationKeysController.exe is not running.
)