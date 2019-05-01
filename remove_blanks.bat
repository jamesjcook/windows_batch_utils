@REM remove blanks
@echo off 
endlocal
set source=%1
set dest=%2
set "clean=false"
if [%2]==[] ( 
  set "dest=%source%.clean"
  set "clean=true"
)

@REM remove any trailing whitespace.
@REM side effect of removing exclaimation punctuation.

@REM @echo off > %dest% & setLocal enableDELAYedeXpansioN
@REM for /f "tokens=1* delims=]" %%a in ('find /N /V "" ^<%source%') do (
@REM     SET "str=%%b"
@REM     for /l %%i in (1,1,31) do if "!str:~-1!"==" " set "str=!str:~0,-1!"
@REM     >>%dest% SET /P "l=!str!"<nul
@REM     >>%dest% echo.
@REM )
@REM echo "trailing whitespace removed.
@REM timeout 30
@REM if %clean%==true (
@REM   del %source%
@REM   move %dest% %source%
@REM )

@REM remove any completely blank lines
for /f "usebackq tokens=* delims=" %%a in ("%source%") do (echo(%%a)>>%dest%

if %clean%==true (
  del %source%
  move %dest% %source%
)


exit /b 
