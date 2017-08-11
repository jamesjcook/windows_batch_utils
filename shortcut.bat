@echo off
@REM shortcut [filename] [folder] [shortcut title] {arguments} {icon file} {icon resource number} {ShowCmd} {Start In Folder} {Hot Key}

@REM Creates a shortcut to a file. 
@REM The parameters:
@REM [filename]: Create a shortcut to this filename.
@REM [folder]: Specify the destination folder that inside it the shortcut will be created. You can specify any valid folder, including the special variables that represent system folders, like ~$folder.desktop$ (Desktop folder), ~$folder.programs$ (Start-Menu-Programs folder), and so on...
@REM [shortcut title]: The text displayed in the shortcut.
@REM {arguments}: Optional parameter - Additional arguments to execute the filename.
@REM {icon file}: Optional parameter - Use this parameter if your want that the shortcut will be displayed with icon other than the default one.
@REM {icon resource number}: Optional parameter - The resource number inside the icon file.
@REM {ShowCmd}: Optional parameter - Use this parameter if you want to maximize or minimize the window of the program. Specify "max" to maximize the window or "min" to minimize it.
@REM {Start In Folder}: Optional parameter - Specifies the "Start In" folder. If you don't specify this parameter, the "Start In" folder is automatically filled with the folder of the program you specify in [filename] parameter.
@REM {Hot Key}: Optional parameter - Specifies an hot-key that will activate the shortcut. For example: Alt+Ctrl+A, Alt+Shift+F8, Alt+Ctrl+Shift+Y

@REM Per info from superuser.com https://superuser.com/a/392082
SETLOCAL ENABLEDELAYEDEXPANSION
set "filename=%1"
set "folder=%2"
set "title=%3"
set "arguments=%4"
set "icon=%5"
set "i_res_n=%6"
set "ShowCmd=%7"
set "start=%8"
set "hkey=%9"

:: Remove quotes
SET arguments=###%arguments%###
SET arguments=%arguments:"###=%
SET arguments=%arguments:###"=%
SET arguments=%arguments:###=%

call %~dp0\fileparts %filename%

SET LinkName=%F_NAME%
@REM SET Esc_LinkDest=%%HOMEDRIVE%%%%HOMEPATH%%\Desktop\!LinkName!.lnk
SET Esc_LinkDest=%%folder%%\!LinkName!.lnk
@REM SET Esc_LinkTarget=%%SYSTEMROOT%%\notepad.exe
SET Esc_LinkTarget=%%filename%%


echo Will create shortuct !LinkName! in %folder%
echo with args "%arguments%"
SET cSctVBS=CreateShortcut.vbs
SET LOG=".\%~N0_runtime.log"
((
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.Arguments = oWS.ExpandEnvironmentStrings^("!arguments!"^)
  echo '  oLink.Description = "MyProgram"   
  echo '  oLink.HotKey = "ALT+CTRL+F"
  echo '  oLink.IconLocation = "C:\Program Files\MyApp\MyProgram.EXE, 2"
  echo '  oLink.WindowStyle = "1"   
  echo '  oLink.WorkingDirectory = "C:\Program Files\MyApp"
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!
DEL !cSctVBS! /f /q
)1>>!LOG! 2>>&1
set "size=-1"
for /f %%i in ("!LOG!") do set size=%%~zi
if %size% equ 0 (
  del !LOG! 
) else( 
  notepad !LOG! 
)
REM timeout 30