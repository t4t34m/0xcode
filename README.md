# 0xc0d3 - JunkYard - 0cmd h4ck1ng

:: NOTE ::

##### 🔸 [ Download Synergy Pro 1.8.8 ](https://sourceforge.net/projects/synergy-stable-builds/)

    Replacing cz.archive.ubuntu.com/ubuntu with the mirror in question. 
    https://packages.ubuntu.com/bionic/amd64/synergy/download

##### 
    
##### 🔸 OPEN AND EDIT  1: 
`sudo geany /etc/apt/sources.list`
##### 🔸 ADD THIS IN THE END OF FILE 2: 
`deb http://cz.archive.ubuntu.com/ubuntu bionic main universe`
##### 🔸 INSTALL NOW  : 
`sudo apt install libqt4-network libqtcore4 libqtcore4 libcurl3 libqtgui4 libavahi-compat-libdnssd1`


## 🔸 [/dbJson](https://github.com/t4t34m/0xc0d3/tree/main/dbJson)
* read from file (json format)
* print email:password
* save output to >> emailPassword.txt

---
## 🔸 match and remove strings inside json 
```python
import re

string = open('data.json').read()
new_str = re.sub('{"StatusCode":200,"StatusMessage":"OK","Data":', ' ', string)
open('newData.txt', 'w').write(new_str)
```
🔸 in the end must be }, not }}.. match and replace
```python
import re

string = open('newData.txt').read()
new_str = re.sub('}}', '},', string)
open('cleanData.json', 'w').write(new_str)
```
🔸 search using email
```python
import json
keyVal = input("[+] Search using Email\n[+] Type email now : ")
with open('cleanData.txt') as json_file:
    data = json.load(json_file)
    for p in data:
        if keyVal in p['email']:
            print(p['email'] + ':'+p['password']+' - '+p['UserName'] + ' - ' + p['MobileNo'])
```
