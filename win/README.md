#FOR WIN

# FOr Pr0xy
##### :::::ON:::::
    Set-ItemProperty -Path HKLM:\system\CurrentControlSet\services\Tcpip\Parameters -Name IpEnableRouter -Value 1
    netsh interface portproxy add v4tov4 listenport=80 listenaddress=192.168.100.81 connectport=8080 connectaddress=192.168.100.31
    netsh interface portproxy add v4tov4 listenport=443 listenaddress=192.168.100.81 connectport=8080 connectaddress=192.168.100.31
##### :::::OFF:::::
    Set-ItemProperty -Path HKLM:\system\CurrentControlSet\services\Tcpip\Parameters -Name IpEnableRouter -Value 0
    netsh interface portproxy delete v4tov4 listenport=80 listenaddress=192.168.100.81
    netsh interface portproxy delete v4tov4 listenport=443 listenaddress=192.168.100.81

# Backup cmd : 
##### ::::: To save to C:\savebackup\ : 
    Export-WindowsDriver -Online -Destination "C:\savebackup\"
##### ::::: To restore after format from C:\savebackup to C:\restorebackup: 
    Export-WindowsDriver -Path "C:\savebackup\" -Destination "C:\restorebackup"

# SHSH save as shsh.bat + change:979A1AE29802E + 14.3
```batch
@ECHO OFF
FOR /F %%A IN (no.txt) DO mkdir C:\SHSH\ %%A | tsschecker.exe tsschecker -d iPhone11 --nocache --boardconfig N104AP -e 979A1AE29802E -i 14.3 -s --apnonce %%A --save-path C:\SHSH\ %%A -s
pause
```
