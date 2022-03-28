#!/usr/bin/bash
printf "\n\nbefore u start this cmd, make sure : sudo bash cleanme.sh\n it will clean all caches and rams \n\n danger!~\n"
read -p "type 1 to start" ok
if [[ "$ok" == "1" ]]; then
bleachbit -c --preset &> /dev/null
sudo swapoff -a &> /dev/null
sudo swapon -a &> /dev/null
sync; echo 1 > /proc/sys/vm/drop_caches &> /dev/null
sync; echo 2 > /proc/sys/vm/drop_caches &> /dev/null
sync; echo 3 > /proc/sys/vm/drop_caches &> /dev/null
sudo sync; echo 3 > /proc/sys/vm/drop_caches &> /dev/null
systemd-resolve --statistics &> /dev/null
systemd-resolve --flush-caches &> /dev/null
swapoff -a && swapon -a
shopt -s histappend &> /dev/null
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
rm -rf /root/.local/share/Trash/*/** &> /dev/null
find /var/log -type f -regex ".*\.gz$" | xargs rm -Rf &> /dev/null
find /var/log -type f -regex ".*\.[0-9]$" | xargs rm -Rf &> /dev/null
journalctl --vacuum-time=10d &> /dev/null
rm -rf ~/.cache/thumbnails/* &> /dev/null
bleachbit --wipe-free-space /dev/shm /tmp /home/t4t34m &> /dev/null
bleachbit --list | grep -E "[a-z0-9_\-]+\.[a-z0-9_\-]+" | grep -v system.free_disk_space | xargs bleachbit --clean &> /dev/null
bleachbit --list | grep -E "[a-z]+\.[a-z]+" | xargs bleachbit --preview &> /dev/null
fi
printf "after u fucked up\n"
