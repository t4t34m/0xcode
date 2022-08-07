#FOR WIN

### FOr Pr0xy
##### :::::ON:::::
    Set-ItemProperty -Path HKLM:\system\CurrentControlSet\services\Tcpip\Parameters -Name IpEnableRouter -Value 1
    netsh interface portproxy add v4tov4 listenport=80 listenaddress=192.168.100.81 connectport=8080 connectaddress=192.168.100.31
    netsh interface portproxy add v4tov4 listenport=443 listenaddress=192.168.100.81 connectport=8080 connectaddress=192.168.100.31
##### :::::OFF:::::
    Set-ItemProperty -Path HKLM:\system\CurrentControlSet\services\Tcpip\Parameters -Name IpEnableRouter -Value 0
    netsh interface portproxy delete v4tov4 listenport=80 listenaddress=192.168.100.81
    netsh interface portproxy delete v4tov4 listenport=443 listenaddress=192.168.100.81
