set pid=%1
:waitforpid
tasklist /fi "pid eq %1" 2>nul | find "%1" >nul
if %ERRORLEVEL%==0 (
  timeout /t 2 /nobreak >nul
  echo .
  goto :waitforpid
)
goto :eof

exit /b