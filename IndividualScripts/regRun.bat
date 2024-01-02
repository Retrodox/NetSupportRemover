@echo off
SET reg_file=Win10_EnableLUA_Off.reg
SET reg_file_path=T:\%reg_file%
SET user_desktop=%UserProfile%\Desktop\

:: Check if the registry file exists in the specified directory
IF EXIST "%reg_file_path%" (
    :: Copy the registry file to the user's desktop
    xcopy "%reg_file_path%" "%user_desktop%"
    :: Check if the file was successfully copied
    IF EXIST "%user_desktop%%reg_file%" (
        :: Execute the registry file
        START "" regedit "%user_desktop%%reg_file%"
        ECHO Registry file has been copied and executed.
    ) ELSE (
        ECHO Failed to copy the registry file to the desktop.
    )
) ELSE (
    ECHO The registry file %reg_file% does not exist at %reg_file_path%.
)