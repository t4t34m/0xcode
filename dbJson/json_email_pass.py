# -*- coding: utf-8 -*-
#!/usr/bin/python3
import json
from math import e
import sys,re
jsondbx = open("date.json")
dd = json.loads(jsondbx.read())
for p in dd:
    mu=p['email'] #0x--> change to ur json value 
    mp=p['password']#0x--> change to ur json value 
    mb=p['phone']#0x--> change to ur json value 
    match = re.search(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)", mu)
    if match:
        print("%s:%s"%(mu,mp))
    else:
        pass
print("finished")

