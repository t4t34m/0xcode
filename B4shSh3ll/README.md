#NOTE 


### Nmap CMD
```bash
nmap --script=dns-brute.nse 127.0.0.1-255
nmap --script=auth 127.0.0.1-255
nmap --script=default 127.0.0.1-255
nmap -Pn --script=vuln 127.0.0.1-255
nmap -n -p445 --script=broadcast 127.0.0.1-255
nmap --script external 127.0.0.1-255
nmap -p 53 --script dns-zone-transfer.nse -v 127.0.0.1-255
nmap -Pn -sV --script=vulners 127.0.0.1-255
nmap --script http-methods --script-args http-methods.url-path='/' 127.0.0.1-255
nmap -p 80 --script dns-brute.nse 127.0.0.1-255
nmap -sV --script=vulscan/vulscan.nse 127.0.0.1-255
nmap -O --script external -oX out.xml 127.0.0.1-255
nmap -d --script ssl-heartbleed --script-args vulns.showall -sV 127.0.0.1-255 -oX s.xml
sudo nmap -PN -F -O -A --script=default,external,ssl-heartbleed -sV -oX targetoutput.xml -d 127.0.0.1-255
nmap -sV --script ./sourcfile.nse 127.0.0.1-255
nmap -sV --script http-sec-headers.nse 127.0.0.1-255
nmap -F --script icap-info 127.0.0.1-255
nmap --script=http-enum -p80 -n 127.0.0.1-255
nmap -p 1344 --script icap-info 127.0.0.1-255
nmap -sn -Pn --script hostmap-crtsh 127.0.0.1-255
```
