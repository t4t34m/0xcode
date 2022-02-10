import random
import hashlib
print(hashlib.md5(str(random.getrandbits(256)).encode('utf-8')).hexdigest())
print(hashlib.sha256(str(random.getrandbits(256)).encode('utf-8')).hexdigest())
