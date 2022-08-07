#!/usr/bin/bash
readansw(){
    read -p $'\n\e[1;37m#: \e[0m' readans
}
printf """\e[1;37m 1) close \n 2) open  \e[0m\n"""  
readansw
if [[ "$readans" == "1" ]]; 
then
printf """\e[1;38;5;197m Close 443 \e[0m"""  
sudo service tor stop
sudo service apache2 stop
sudo service ssh stop
sudo service mysql stop
sudo service iptables stop
sudo iptables -Z
sudo iptables -F
sudo iptables --flush
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X
sudo iptables -F
sudo iptables -X
sudo iptables-save
sudo service iptables start
sudo iptables-save
fi 
if [[ "$readans" == "2" ]]; 
then
printf """\e[1;38;5;112m OPEN 443 \e[0m\n"""  
sudo service apache2 stop
sudo service tor stop
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv4.conf.all.route_localnet=1
sudo iptables -Z
sudo iptables -F
sudo iptables --flush
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X
sudo iptables -F
sudo iptables -X
sudo iptables-save
sudo ufw allow 8080
sudo ufw allow 443
sudo iptables -A PREROUTING -t nat -i wlx20e5170be60d -p tcp --dport 443 -j REDIRECT --to-port 8080
sudo iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 4433 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
sudo iptables -A PREROUTING -t nat -i wlx20e5170be60d -p tcp --dport 80 -j REDIRECT --to-port 8080
sudo iptables -A PREROUTING -t nat -i wlx20e5170be60d -p tcp --dport 443 -j REDIRECT --to-port 8080
sudo iptables -L -t nat
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8080
sudo iptables -t nat -A PREROUTING -p tcp --dport 8081 -j REDIRECT --to-port 8080
sudo iptables -A PREROUTING -t nat -i any -p tcp --dport 80 -j DNAT --to 192.168.100.4:8080
sudo iptables -A PREROUTING -t nat -i any -p tcp --dport 443 -j DNAT --to 192.168.100.4:8080
sudo iptables-save 
sudo apachectl configtest
sudo service apache2 restart
fi 

