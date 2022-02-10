#!/usr/bin/python3
import ipaddress
import socket
def isOpen(ip,port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        s.connect((ip, int(port)))
        s.shutdown(2)
        return True
    except:
        return False
IPS = ipaddress.ip_network('132.4.216.0/24')
for ip in IPS:
    if isOpen(str(ip),3306) == True:
        print("[+] "+str(ip)+":3306")
    else:
        print("[-] "+str(ip)+":3306")
