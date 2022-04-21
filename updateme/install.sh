#!/usr/bin/bash
clear
PATH_updateme="/home/$USER/lab4box/updateme"
if [ -d "$PATH_updateme" ]; then
read -p $'[+] already installed updateme, \n[+] Do you want to Delete all updateme ??\n[Type NUMBER]\n  1 - to delete or [Hit Enter To Exit]\n[+] Enter number : ' refresh
if [[ "$refresh" == "1" ]]; then 
rm -r ~/lab4box/updateme 2>/dev/null
rm -r ~/Desktop/updateme.desktop 2>/dev/null
printf "\n\e[1;37m[+] Deleted : $PATH_updateme \e[0m\n"
printf "\e[1;37m[+] DONE \e[0m\n"
else
exit
fi
else
mkdir -p $PATH_updateme
sleep 0.1
cp -R icons/ $PATH_updateme
read -p $'Enter your root password : ' r00tp3ss
sed -i "$ a\myrootpass=\"$r00tp3ss\"" ~/.bashrc
export myrootpass="$r00tp3ss"
source ~/.bashrc
sleep 0.1
echo "#!/usr/bin/env xdg-open" >> $PATH_updateme/desk.desktop.txt
echo "[Desktop Entry]" >> $PATH_updateme/desk.desktop.txt
echo "Version=1.0" >> $PATH_updateme/desk.desktop.txt
echo "Type=Application" >> $PATH_updateme/desk.desktop.txt
echo "Terminal=false" >> $PATH_updateme/desk.desktop.txt
echo "Icon[en_US]=$PATH_updateme/icons/icon.png" >> $PATH_updateme/desk.desktop.txt
echo "Name[en_US]=updateme" >> $PATH_updateme/desk.desktop.txt
echo "Exec=sh -c \"cd $PATH_updateme;bash updateme.sh; echo; ${SHELL:-bash}\"" >> $PATH_updateme/desk.desktop.txt
echo "Comment[en_US]=updateme" >> $PATH_updateme/desk.desktop.txt
echo "Name=updateme" >> $PATH_updateme/desk.desktop.txt
echo "Comment=updateme" >> $PATH_updateme/desk.desktop.txt
echo "Icon=$PATH_updateme/icons/icon.png" >> $PATH_updateme/desk.desktop.txt
echo "StartupNotify=false" >> $PATH_updateme/desk.desktop.txt
echo "Path=" >> $PATH_updateme/desk.desktop.txt
cp -R $PATH_updateme/desk.desktop.txt ~/Desktop/updateme.desktop
cp -R updateme.sh $PATH_updateme/
echo "$myrootpass" | sudo -S -k chown $USER:$USER ~/Desktop/updateme.desktop
echo "$myrootpass" | sudo -S -k chmod 755 ~/Desktop/updateme.desktop
clear
printf "\n\n\e[1;37m[+] DONE \e[0m\n"
printf "\e[1;37m[+] Close Terminal & Open updateme Desktop \e[0m\n"
fi 
