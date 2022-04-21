#!/usr/bin/bash
#------------------------#
t4t_pwd=$( (pwd) )
t4t_icon="$t4t_pwd"
Ilogin="$t4t_icon/icons/login.png"
Ifinger="$t4t_icon/icons/finger.png"
Iport="$t4t_icon/icons/port.png"
Iwifi="$t4t_icon/icons/wifi.png"
Iip="$t4t_icon/icons/ip.ico"
Ierror="$t4t_icon/icons/error.ico"
Iaddico="$t4t_icon/icons/add.ico"
Ibypassed="$t4t_icon/icons/bypassed.png"
#------------------------------#
CM=$(cat ~/.bashrc | grep -E -o 'myrootpass.+".+"' | awk -F '"' '{ print $2 }')
if [[ "$CM" == "" ]]; then 
    printf "run ./install.sh first\n"
    exit 1
else
export myrootpass="$CM"
source ~/.bashrc
fi
#------------------------------#
notify-send -u normal -t 6000 "GOOD" "$myrootpass starting ..." -i $Iaddico
logx=$( (lastlog -b 0 -t 30) )
notify-send -u normal -t 10000 " [ + ] Lastlog " "$logx" -i $Ilogin
EES2=$( (finger) )
notify-send -u normal -t 10000 " [ + ] Login " "$EES2" -i $Ifinger
SEopen=$( (netstat -tulpn | grep LISTEN) )
notify-send -u normal -t 10000 " [ + ] port open" "$SEopen" -i $Iport
SElsof=$( (lsof -i -P -n) )
notify-send -u normal -t 10000 " [ + ] LISTEN TCP " "$SElsof" -i $Iip
SElsof2=$( (lsof -i -P -n | grep ESTABLISHED) )
notify-send -u normal -t 10000 " [ + ] ESTABLISHED " "$SElsof2" -i $Iip
myInterFace=$(ip route | awk '/dev/ {f=NR} f&&NR-1==f' RS=" " | sort | uniq -d)
for value in $myInterFace
    do
        CheckIPS=$( (echo "$myrootpass" | sudo -S -k arp-scan -l --interface=$value | grep -E "^[0-9]{1,3}+.+[0-9]{1,3}+.+[0-9]{1,3}+.+[0-9]{1,3}.+") )
        notify-send -u normal -t 10000 " [ + ] IP CONNECTED IN $value " "$CheckIPS" -i $Iwifi
    done
      
 
notify-send -u normal -t 5200 "Restarting Tor" "Tor check" -i $Ibypassed
echo "$myrootpass" | sudo -S -k service tor restart
notify-send -u normal -t 5200 "Cleaning lock files if found" "Clean lock files" -i $Ibypassed
echo "$myrootpass" | sudo -S -k rm -r /var/cache/apt/archives/lock
echo "$myrootpass" | sudo -S -k -r /var/lib/dpkg/lock-frontend
echo "$myrootpass" | sudo -S -k rm -r /var/lib/dpkg/lock
notify-send -u normal -t 5200 "Start update" "Updating ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt update
notify-send -u normal -t 5200 "Cleaning apt" "Clean apt ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt autoremove -y
notify-send -u normal -t 5200 "DONE" "AutoRemove ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt remove -y
notify-send -u normal -t 5200 "DONE" "Remove ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt clean -y
notify-send -u normal -t 5200 "DONE" "clean ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt autoclean -y
notify-send -u normal -t 5200 "Fix broken install" "Starting ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt update --fix-missing -y
notify-send -u normal -t 5200 "checking" "check install missing ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt install -f -y
notify-send -u normal -t 5200 "DONE" "install ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt upgrade -y
notify-send -u normal -t 5200 "Checking Full & dpkg" "Full Upgrade ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k dpkg --configure -a
echo "$myrootpass" | sudo -S -k apt full-upgrade -y
notify-send -u normal -t 5200 "DONE" "full-upgrade ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt dist-upgrade -y
notify-send -u normal -t 5200 "DONE" "dist-upgrade ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt -o Dpkg::Options::="--force-overwrite" upgrade -y
notify-send -u normal -t 4200 "DONE" "force-overwrite ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt autoremove -y
notify-send -u normal -t 4200 "DONE" "AutoRemove ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt remove -y
notify-send -u normal -t 4200 "DONE" "Remove ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt clean -y
notify-send -u normal -t 4200 "DONE" "Clean ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k apt autoclean -y
#------------------------#
echo ""
#------------------------#
notify-send -u normal -t 4200 "Done Update Upgrade have been done" "exiting background" -i $Ibypassed
notify-send -u normal -t 4200 "PIP3 UPDATE" "done ..." -i $Ibypassed
pip3 install --upgrade pip --user
notify-send -u normal -t 4200 "PIP3 UPDATE" "done ..." -i $Ibypassed
pip install --upgrade pip --user
notify-send -u normal -t 4200 "root PIP3 UPDATE" "done ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k pip3 install --upgrade pip --user --no-warn-script-location
notify-send -u normal -t 4200 "root pip UPDATE" "done ..." -i $Ibypassed
echo "$myrootpass" | sudo -S -k pip install --upgrade pip --user --no-warn-script-location
notify-send -u normal -t 19200 "Done" "everything" -i $Ibypassed
exit
