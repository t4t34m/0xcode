import base64
import random
# made for purpose 
FRx11 = ''.join((random.choice('0123456789') for i in range(11)))
FRx20 = ''.join((random.choice('abcdef0123456789') for i in range(20)))
appId_String = '{"appId":"1:9%s:ios:%sdb","exp":1648663740,"fid":"fa_XjNRlbEprvNI3qYTT-F","projectNumber":9%s}'%(FRx11,FRx20,FRx11)
appId_String_OutPut = base64.b64encode(bytes(appId_String, "utf-8")).replace(b'=', b'').decode()
print(f"""appId : {FRx11}\niosId : {FRx20}\nAppid : {appId_String}\nbase64 refresh_token : {appId_String_OutPut}\n""")
