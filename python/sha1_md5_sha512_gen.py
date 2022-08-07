#!/usr/bin/python3
# Usage : python sha1_md5_sha512_gen.py MyPassWord123
import sys, hashlib
if len(sys.argv) != 2:
    print("Usage: ./sha1_md5_sha512_gen.py <password>")
    sys.exit(1)
pw = sys.argv[1]
print('MD5: ', hashlib.md5(str(pw).encode('utf-8')).hexdigest())
print('Sha1: ', hashlib.sha1(str(pw).encode('utf-8')).hexdigest())
print('SHA256: ', hashlib.sha256(str(pw).encode('utf-8')).hexdigest())
print('SHA512: ', hashlib.sha512(str(pw).encode('utf-8')).hexdigest())
