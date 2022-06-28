Option Explicit
Dim winsock, SendData, RecieveData, secs
Const RemoteHost           = "ip"
Const RemotePort           = port
Const sckClosed            = 0 
Const sckOpen              = 1 
Const sckListening         = 2 
Const sckConnectionPending = 3 
Const sckResolvingHost     = 4 
Const sckHostResolved      = 5 
Const sckConnecting        = 6 
Const sckConnected         = 7 
Const sckClosing           = 8 
Const sckError             = 9 
MsgBox "connected."
WriteData Now & " - Rev "
On Error Resume Next
Set winsock = Wscript.CreateObject("MSWINSOCK.Winsock", "winsock_")
If Err.Number <> 0 Then
    WriteData Now & " - Internet Error-closed"
    WScript.Quit
End If
On Error Goto 0
winsock.RemoteHost = RemoteHost
winsock.RemotePort = RemotePort 
winsock.Connect
while winsock.State <> sckError And winsock.state <> sckConnected And winsock.state <> sckClosing And secs <> 25
    WScript.Sleep 1000  
    secs = secs + 1     
Wend
If secs > 24 Then
    WriteData Now & " - Timed Out"
    ClientClose()
End If
winsock.SendData "dir" 
Wscript.Sleep 25000
WriteData Now & " - No Res - internet state: " & winsock.state
ClientClose()
Sub winsock_dataArrival(bytesTotal)
    Dim strData
    winsock.GetData strData, vbString
    RecieveData = strData 
    WriteData Now & " - Recieved: " & RecieveData
    winsock.SendData "dir"  
    WScript.Sleep 1000
    WriteData Now & " - Sent Data"
    ClientClose()
End Sub
Sub winsock_Error(Number, Description, SCode, Source, HelpFile, HelpContext, CancelDisplay)
    MsgBox "Error: " & Number & vbCrLf & Description
    WriteData Now & " - Error: " & Number & ". " & Description
    ClientClose()
End Sub
Sub ClientClose()
    If winsock.state <> sckClosed Then winsock.Close
    Set winsock = Nothing
    WriteData Now & " - Closed."
    Wscript.Quit
End SUb
Function WriteData(Data)
    Dim fso, file
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set file = fso.OpenTextFile("xppLog.log", 8, True)
    file.write Data & vbCrLf
    file.Close
    Set file = Nothing
    Set fso = Nothing
End Function
