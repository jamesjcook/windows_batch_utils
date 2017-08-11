@REM path/dir ex

@echo off
REM Set filename=C:\Documents and Settings\All Users\Desktop\Dostips.cmd
REM Set filename=C:\Documents and Settings\All Users\Desktop
if "%1"=="" goto :EOF

For %%A in ("%1") do (
    Set DIRNAME=%%~dpA
	set BASENAME=%%~nA%%~xA
    Set F_NAME=%%~nA
	Set F_EXT=%%~xA
)
REM echo.DIRNAME is: %DIRNAME%
REM echo.BASENAME is: %BASENAME%
REM echo.F_NAME is: %F_NAME%
REM echo.F_EXT is: %F_EXT%
REM timeout 30