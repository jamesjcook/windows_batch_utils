@REM shortname.bat
@echo off

FOR /F "usebackq tokens=*" %%i IN (`cscript //nologo "%~dp0\file_select.vbs"`) DO (
    set FILEPATH=%%i
)
