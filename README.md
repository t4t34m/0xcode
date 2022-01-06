# 0xc0d3 - JunkYard - 0cmd h4ck1ng

:: NOTE ::

## 🔸 [/dbJson](https://github.com/t4t34m/0xc0d3/tree/main/dbJson)
* read from file (json format)
* print email:password
* save output to >> emailPassword.txt

---
## 🔸 remove strings inside json 
```python
import re

string = open('data.json').read()
new_str = re.sub('{"StatusCode":200,"StatusMessage":"OK","Data":', ' ', string)
open('newData.txt', 'w').write(new_str)
```
