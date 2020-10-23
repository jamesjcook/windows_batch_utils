@REM path/dir ex

@echo off
@REM SETLOCAL ENABLEDELAYEDEXPANSION
REM Set filename=C:\Documents and Settings\All Users\Desktop\Dostips.cmd
REM Set filename=C:\Documents and Settings\All Users\Desktop

set "FilePath=%1"
:: Remove quotes
SET FilePath=###%FilePath%###
SET FilePath=%FilePath:"###=%
SET FilePath=%FilePath:###"=%
SET FilePath=%FilePath:###=%

@REM if "%1"=="" goto :EOF
if "%FilePath%"=="" (echo NO FILE & goto :EOF)

For %%A in ("!FilePath!") do (
    Set "DIRNAME=%%~dpA"
    set "BASENAME=%%~nA%%~xA"
    Set "F_NAME=%%~nA"
    Set "F_EXT=%%~xA"
)
REM echo FILEPATH is:%FilePath%
REM echo.DIRNAME is: %DIRNAME%
REM echo.BASENAME is: %BASENAME%
REM echo.F_NAME is: %F_NAME%
REM echo.F_EXT is: %F_EXT%
REM timeout 30
