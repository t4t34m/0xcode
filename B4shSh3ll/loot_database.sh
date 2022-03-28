#!/bin/bash
#t4t34m mysql dump over shell (localhost) / server
read -p "[+] hostname : " host
read -p "[+] username : " user
read -p "[+] password : " pass 
mysqldump --all-databases --single-transaction --quick --lock-tables=false > full-backup-$(date +%F)-$2.sql -h $host -u $user -p$pass
echo "full-backup-$(date +%F)-$user.sql"
