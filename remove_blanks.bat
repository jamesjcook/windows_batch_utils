@echo off
@REM remove blanks
@echo off 
setlocal enabledelayedexpansion 
set source=%1
set dest=%2

(for /f "delims=" %%a in ('more +1 %source% ^| find /v ""') do (
  set line=%%~a
  set line=!line:"=!
  set line=!line:,=!
  echo !line!
)) > %dest%
