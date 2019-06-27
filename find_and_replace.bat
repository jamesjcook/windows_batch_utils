@echo off &setlocal
@REM From https://stackoverflow.com/q/23075953
set "textfile=%1"
set "search=%2"
set "replace=%3"
set "newfile=%4"
if not exist "%textfile%" (
  echo Input missing %textfile%
  timeout 3
  exit /b
)
if "%newfile%"=="" (
  echo Please specify output!
  timeout 3
  exit /b
)
if exist "%newfile%" (
  echo %newfile% exists! not updating
  timeout 3
  exit /b
)
(for /f "delims=" %%F in (%textfile%) do (
    set "line=%%F"
    setlocal enabledelayedexpansion
    set "line=!line:%search%=%replace%!"
    echo(!line!
    endlocal
))>"%newfile%"
@REM echo Replace complete!
@REM timeout 3
@REM del %textfile%
@REM rename %newfile%  %textfile%
