
@REM start some command line and save pid to PID
@REM this is RARELY necessary, Only when we have a program especially anxious to break out of our cmd env
@REM https://stackoverflow.com/a/55729884 was the source of this.
set AppCmdLine="%*"
set ProcessCmd=wmic process call create %AppCmdLine%
for /f "tokens=3 delims=; " %%a in ('%ProcessCmd% ^| find "ProcessId"') do set PID=%%a
exit /b
