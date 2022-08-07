#!/bin/bash
sc=$(proxychains curl --write-out %{http_code} --silent --output /dev/null www.XXXXXX.com)
if [[ "$sc" -ne 200 ]] ; then
    echo "[-] Site status: $sc"
else
    echo "[+] Site status: $sc"
fi
