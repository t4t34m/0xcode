Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "D:\burp\run.bat" & Chr(34), 0
Set WshShell = Nothing
