#!/bin/bash
#Script to Scan All Domains Found With NMAP
sites=$(nmap "$1" --open 443 --open -oG - | awk 'NR!=1 && /open/{print $2}')
for site in $sites
do
curl -vgw "\\n" 'http://127.0.0.1:1337/v0.1/scan' -d '{"urls":["'"$site"'"]}'  > /dev/null 2>&1
printf "Scanning %s with burp.\\n" "$site"
done
