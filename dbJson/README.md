# print EMAIL:PASS only

## 🔸 [/dbJson](https://github.com/t4t34m/0xc0d3/tree/main/dbJson)

- read from file (json format)
- print email:password
- save output to >> emailPassword.txt
- 
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
---

## if ur data.json has more value : 

```bash
[
{"id":"1","name":"aaaa","email":"3admin3@gmail.com","password":"3pass@word","phone":"305555555555"},
{"id":"2","name":"bbbb","email":"3admin3@gmail.com","password":"3pass@word","phone":"305555555555"},
{"id":"3","name":"cccc","email":"3admin3@gmail.com","password":"3pass@word","phone":"305555555555"}
]
```
## Example 

```python
mu=p['email'] #0x--> change to ur json value 
mp=p['password']#0x--> change to ur json value 
mb=p['phone']#0x--> change to ur json value 
#------ add them here -------
mid=p['id']
mid=p['name']
```


ur result will be : 

    admin@gmail.com:1122311223@Pass
    1admin1@gmail.com:1313@Pass
    2admin2@gmail.com:2pass@word
    3admin3@gmail.com:3pass@word

  U g0t it ?
