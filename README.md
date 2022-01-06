# 0xc0d3 - JunkYard - 0cmd h4ck1ng

:: NOTE ::

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
