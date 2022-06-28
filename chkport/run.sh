#!/bin/bash
# u have to create in ur /home/USER/lab4box/
#
pathlog="/home/$USER/lab4box/checkportlog"
if [ -d "$pathlog" ]; then
    :
else
    pathlog1="/home/$USER/lab4box"
    mkdir -p $pathlog1
    mkdir -p $pathlog
fi
notify-send -u low -t 8000 "Port Checker Has Been Started"
myip() {
  myPublicIp=$( (curl -s -4 icanhazip.com | grep -E -o "^[0-9]+.[0-9]+.[0-9]+.[0-9]{1,3}" 2>/dev/null))
  myPrivateIp=$( (ip route get 1.2.3.4 | awk '{print $7}'))
  myInterFace=$(ip route get 8.8.8.8 | awk '/dev/ {f=NR} f&&NR-1==f' RS=" ")
  notify-send -u low -t 8000 "Your ip : $myPublicIp" ""
  notify-send -u low -t 8000 "Your LocalHost ip : $myPrivateIp" "interface is : $myInterFace"
}
clear
myip
timen1w=$(date '+%Y_%m_%d')
datex=$(date '+%x %A %r')
pathlogDa="$pathlog/$timen1w"
if [ -d "$pathlogDa" ]; then
    printf "\e[1;37m[ SAME DAY DIFFERENT SHIT ] $pathlogDa \e[0m\n"
else
    mkdir -p $pathlogDa
fi
printf "\n\n\n#------------------------------------#\n# Data: $datex - NmapScan \n" >> $pathlogDa/nmap.lst
nmap -n -PN -sT -p- localhost >> $pathlogDa/nmap.lst
printf "\n\n\n#------------------------------------#\n# Data: $datex - Lsof PORT \n" >> $pathlogDa/lsof.lst 
lsof -i -P -n | grep LISTEN >> $pathlogDa/lsof.lst 
printf "\n\n\n#------------------------------------#\n# Data: $datex - Netstat PORT \n" >> $pathlogDa/netstat.lst
netstat -anpt >> $pathlogDa/netstat.lst
printf "\n\n\n#------------------------------------#\n# Data: $datex - SS PORT \n" >> $pathlogDa/ss.lst
ss -stplu >> $pathlogDa/ss.lst
notify-send -u low -t 4000 "Done - Port Checker"
cd $pathlogDa/
cat *.lst | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' >> ipsLoop.loop
sed -i -e '/127.0.0.1/d' ipsLoop.loop
sed -i -e '/127.0.0.53/d' ipsLoop.loop
sed -i -e '/0.0.0.0/d' ipsLoop.loop
sed -i -e '/192.168.100.4/d' ipsLoop.loop
sort ipsLoop.loop | uniq -d >> ips.txt
exo-open --launch FileManager $pathlogDa/
