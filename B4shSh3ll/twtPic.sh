#!/usr/bin/env bash
#random.lst --> random.lst.sh
clear
time=$(date +"%A %H:%m:%S")
echo "started on : $time"
i=1
for URL in `cat random.lst`; do 
time=$(date +"%A %H:%m:%S")
i=$(($i+1))
URL2="pbs.twimg.com/media/$URL?format=jpg&name=small"
URL3="pbs.twimg.com/media/$URL?format=png&name=small"
CMD2=$(curl --silent --socks5-hostname 127.0.0.1:9050 -sL -w "%{http_code}\n" "$URL2" -o /dev/null)
CMD3=$(curl --silent --socks5-hostname 127.0.0.1:9050 -sL -w "%{http_code}\n" "$URL3" -o /dev/null)
if [[ "$CMD2" == "200" ]];then
echo "[ + ] found pic : $URL2" 
echo "$URL2" >> FOUND.txt
fi
if [[ "$CMD3" == "200" ]];then
echo "[ + ] found pic : $URL3" 
echo "$URL3" >> FOUND.txt
fi
echo "$i -  $time"
done
echo "ended on : $time"
