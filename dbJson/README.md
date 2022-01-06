# print EMAIL:PASS only
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
