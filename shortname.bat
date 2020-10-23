@REM shortname.bat
@echo off

set "F_PATH=%~1"

FOR /F "usebackq tokens=*" %%i IN (`cscript //nologo "%~dp0\shortname.vbs" "%F_PATH%"`) DO (
    set SHORTNAME=%%i
)
