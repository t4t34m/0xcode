#!/usr/bin/bash
t4t_pwd=$( (pwd) )
t4t_icon="$t4t_pwd"
datex=$(date '+%x %A %r')
timen0w=$(tr -dc a-z0-9 </dev/urandom | head -c 4 ; echo '')
timen1w=$(date '+%Y_%m_%d')
Iip="$t4t_icon/icons/ip.ico"
Ibypassed="$t4t_icon/icons/bypassed.png"
CM=$(cat ~/.bashrc | grep -E -o 'myrootpass.+".+"' | awk -F '"' '{ print $2 }')
if [[ "$CM" == "" ]]; then
    printf "run ./install.sh first\n"
    exit 1
else
    export myrootpass="$CM"
    source ~/.bashrc
fi
PATH_updateme_logData="/home/$USER/lab4box/updateme/log/$timen1w"
if [ -d "$PATH_updateme_logData" ]; then
    printf "\e[1;37m[ SAME DAY DIFFERENT SHIT ] $PATH_updateme_logData \e[0m\n"
else
    mkdir -p $PATH_updateme_logData
fi
notify-send -u normal -t 11555 "#1 Start Updating and Upgrading" -i $Ibypassed
echo "$myrootpass" | sudo -S -k rm -r /var/cache/apt/archives/lock |& tee -a $PATH_updateme_logData/SUDO_APT-$timen0w.log
echo "$myrootpass" | sudo -S -k -r /var/lib/dpkg/lock-frontend |& tee -a $PATH_updateme_logData/SUDO_APT-$timen0w.log
echo "$myrootpass" | sudo -S -k rm -r /var/lib/dpkg/lock |& tee -a $PATH_updateme_logData/SUDO_APT-$timen0w.log
echo "$myrootpass" | sudo -S -k apt update --fix-missing -y |& tee -a $PATH_updateme_logData/SUDO_APT-$timen0w.log
echo "$myrootpass" | sudo -S -k apt upgrade --fix-missing -y |& tee -a $PATH_updateme_logData/SUDO_APT-$timen0w.log
echo "$myrootpass" | sudo -S -k apt autoremove -y |& tee -a $PATH_updateme_logData/SUDO_APT-$timen0w.log
notify-send -u normal -t 14555 "#2 Done Updated and Upgraded" -i $Ibypassed
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "#---------------[ $datex ]---------------#" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "[ connected devices (wifi) ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
myInterFace=$(ip route get 8.8.8.8 | awk '/dev/ {f=NR} f&&NR-1==f' RS=" ")
cmd3=$( (echo "$myrootpass" | sudo -S -k arp-scan -l --interface=$myInterFace | grep -E "^[0-9]{1,3}+.+[0-9]{1,3}+.+[0-9]{1,3}+.+[0-9]{1,3}.+" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "[ publich ip address ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
myPublicIp=$( (curl -s -4 icanhazip.com | grep -E -o "^[0-9]+.[0-9]+.[0-9]+.[0-9]{1,3}" |& tee -a $PATH_updateme_logData/info-$timen0w.txt))
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "[ localhost ip address ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
myPrivateIp=$( (ip route get 1.2.3.4 | awk '{print $7}' |& tee -a $PATH_updateme_logData/info-$timen0w.txt))
notify-send -u normal -t 7888 "Private ip" "$myPublicIp" -i $Iip
notify-send -u normal -t 9999 "Local ip" "$myPrivateIp" -i $Iip
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "[ ports listen $datex ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
cmd4=$( (netstat -tulpn | grep LISTEN |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "[ arp ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && arp |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "[ ip forward status  ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
cmd0=$( (cat /proc/sys/net/ipv4/ip_forward) )
if [[ "$cmd0" == "0" ]];
then
    T1=$( (echo "[ ip forward is : OFF ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
else
    T1=$( (echo "[ ip forward is : ON ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
fi
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "[ ESTABLISHED TCP  ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
cmd2=$( (lsof -i -P -n |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "[ Speed Test ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && speedtest-cli |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
T1=$( (echo "" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && echo "[ IPS FROM NETSTAT ]" |& tee -a $PATH_updateme_logData/info-$timen0w.txt && netstat -antp | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' |& tee -a $PATH_updateme_logData/info-$timen0w.txt) )
exo-open --launch FileManager $PATH_updateme_logData/ && exo-open --launch FileManager $PATH_updateme_logData/info-$timen0w.txt
notify-send -u normal -t 5555 "#END OF LOG" "Happy Now?" -i $Ibypassed
oe=$( (echo $$) )
kill -9 $oe
exit
