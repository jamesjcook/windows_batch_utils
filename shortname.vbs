'https://www.codeproject.com/Tips/44521/Get-DOS-8-3-short-name-with-VbScript
set fso = CreateObject("Scripting.FileSystemObject")

strLongName = Wscript.Arguments(0)
strShortName = "Invalid File/Folder - (" & strLongName & ")"
Set fsoFile = Nothing

On Error Resume Next

Set fsoFile = fso.GetFile(strLongName)

if Err.number <> 0 then
	Set fsoFile = fso.GetFolder(strLongName)
end if

if fsoFile is not nothing then
	strShortName = fsoFile.ShortPath
end if
Wscript.Echo strShortName
