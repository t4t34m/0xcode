# 0xc0d3 - JunkYard - 0cmd h4ck1ng

## 🔸 [ Download](https://sourceforge.net/projects/synergy-stable-builds/) Synergy Pro 1.8.8 - Keyboard & mouse sharing
##### then:
    sudo sed -i '$ a\\ndeb http://cz.archive.ubuntu.com/ubuntu bionic main universe' /etc/apt/sources.list    
    sudo apt update
    sudo apt install libqt4-network libqtcore4 libqtcore4 libcurl3 libqtgui4 libavahi-compat-libdnssd1
    sudo dpkg -i synergy-v1.8.8-stable-Linux-i686.deb

## 🔸 Add Command Pompt - [Download and run reg - windows](https://github.com/t4t34m/0xcode/blob/main/Add_CMD_open_here_windows.reg)
![alt text](https://imgur.com/qGuOBfr.png)

---
## 🔸 [/dbJson](https://github.com/t4t34m/0xc0d3/tree/main/dbJson)

- read from file (json format)
- print email:password
- save output to >> emailPassword.txt


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
