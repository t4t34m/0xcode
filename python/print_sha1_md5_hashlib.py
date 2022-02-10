import random
import hashlib

#SHA512
#SHA384
#md5
#SHA1
#SHA224
#SHA256

print(hashlib.md5(str(random.getrandbits(256)).encode('utf-8')).hexdigest())
print(hashlib.sha256(str(random.getrandbits(256)).encode('utf-8')).hexdigest())
