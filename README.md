# 0xc0d3 - JunkYard - 0cmd h4ck1ng

#### 🔸 1 - Synergy / Barrier- Keyboard & mouse sharing 
    sudo sed -i '$ a\\ndeb http://cz.archive.ubuntu.com/ubuntu bionic main universe' /etc/apt/sources.list    
    sudo apt update
    sudo apt install libqt4-network libqtcore4 libqtcore4 libcurl3 libqtgui4 libavahi-compat-libdnssd1
    sudo dpkg -i synergy-v1.8.8-stable-Linux-i686.deb
    ##--------------------Barrier-----------------------------##
    for windows: https://sourceforge.net/projects/barrier.mirror/
    for linux: sudo snap install barrier

#### ONE Time Setup before Changing TOR IP : 
    sudo service tor stop
    tor --hash-password "xxTOrpASSWORDxx"
                            ^ copy the output to XXX-OUT-PUT-XXX
    sudo geany /etc/tor/torrc
        ## Remove # from ->
    ControlPort 9051
    HashedControlPassword XXX-OUT-PUT-XXX
        ## DONE -- CLOSE torrc
    sudo service tor restart


#### Change tor ip in 4 seconds : 
    curl --socks5 127.0.0.1:9050 checkip.amazonaws.com && (echo authenticate "\"xxTOrpASSWORDxx"\"; echo signal newnym; echo quit;sleep 2) | nc localhost 9051;sleep 2 && curl --socks5 127.0.0.1:9050 checkip.amazonaws.com
#### Update kernal    
    sudo update-initramfs -u -k all
    sudo do-release-upgrade
    
#### Flush DNS :
    sudo systemd-resolve --flush-caches && sudo resolvectl flush-caches
#### Check DNS server:
```
systemd-resolve --status | grep Current
systemd-resolve --status
```
#### ADD DNS PERMANENTLY:
```
sudo apt update && sudo apt install resolvconf
sudo systemctl start resolvconf.service
sudo systemctl enable resolvconf.service
sudo systemctl status resolvconf.service
sudo geany /etc/resolvconf/resolv.conf.d/head <--AND ADD : 
nameserver 8.8.8.8
nameserver 8.8.4.4
->>EXIT AND RUN:
sudo systemctl start resolvconf.service
```
#### INSTALL KVM (virt) : 
    sudo apt install qemu libvirt-daemon-system qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager libosinfo-bin    
    sudo virt-install --name=BackBox0x1 --os-type=Linux --os-variant=ubuntu20.04 --vcpu=2 --ram=2048 --disk path=/media/t4t34m/backbox0x1/backbox7.img,size=90 --graphics spice --network bridge:wla0n --cdrom /opt/t4t34m/kvm/backbox7.iso
    
#### Free up Space: 
    bleachbit --clean system.tmp
    bleachbit --clean bash.history
    rm -rf ~/.cache/thumbnails/*
    sudo sysctl -w vm.drop_caches=3
    sync && echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo swapoff -a && sudo swapon -a
    sudo find /var/log -type f -delete && truncate -s 0 logfile
#### Refresh Desktop Terminal: 
    unity
    nautilus -q   
#### Clean RAM and TMP + ALL in One (if you don't care about losing login/cookies/):)Blackhat?otherwise dont use it:
```
sudo swapoff -a
sudo find /tmp -ctime +10 -exec rm -rf {} +
sudo find /tmp -type f,s -atime +10 -delete
sudo find /usr/share/doc -depth -type f | xargs sudo rm || true
sudo rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /usr/share/lintian/* /usr/share/linda/* /var/cache/man/*
sudo rm -r ~/.local/share/Trash/info/ && sudo rm -r ~/.local/share/Trash/files/ && sudo find /tmp -type f -mtime +2 -delete && sudo rm -rf ~/.cache/thumbnails/*
sudo find /var/log -type f -delete
bleachbit --clean system.tmp
sudo bleachbit --clean system.tmp
journalctl --vacuum-size 10M
sudo journalctl --vacuum-size 10M
systemd-tmpfiles --clean
sudo systemd-tmpfiles --clean
sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo service rsyslog restart
sudo rm -r /var/cache/apt/archives/lock
sudo rm -r /var/lib/dpkg/lock-frontend
sudo rm -r /var/lib/dpkg/lock
sudo apt autoremove -y
sudo apt remove -y
sudo apt clean -y
sudo apt autoclean -y
sleep 2
sudo swapon -a
```
#### Grap / Find Terminal : 
```
# Find AND Grap CMD: 
find /home -type f -exec du -h {} + | sort -hr | head -20
find /usr/share/doc -depth -type f | xargs rm || true
find . -type f -mtime +3
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# find files created and modified in the past 5 days :
find / -mtime -o -ctime -5
find . -name "*.txt" -exec echo {} \; -exec grep banana {} \;
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Find .php in 0xcode folder:
find . -type d -name 0xcode -or -name php
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Print all (LOG) files path:
sudo find /var/log -type f -regex ".+."
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Find (tar.gz files) for (LOG):
find /var/log -type f -regex ".*\.tar.gz$"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Print all (ZIP) in / :
sudo find / -type f -regex ".*\.zip$"
find / -type f -regex ".*\.sql$"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# print only Duplicate linke
uniq -D file.txt
awk '!a[$0]++' file.txt
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Find tmp last(2days) and Delete:
find /tmp -type f -mtime +2 -delete;
find /tmp -type f -mtime +2 -exec rm -f {} \;
find /tmp -type f -mtime +2 | xargs rm -f
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#search for all symbolic links
find . -type l -ls
```
#### my pc info cmd : 
    inxi -Fx
    inxi -Frxxxz
    lscpu
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # my BIOS Informatio
    sudo dmidecode -t bios
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # my Hard-Disk SSD size : 
    sudo fdisk -l | grep '^Disk /dev/' | grep -v loop
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # my Memory Device
    sudo dmidecode -t memory
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    # INSTALL DRIVER :
    sudo ubuntu-drivers list
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    #[FIX](Desktop not working-Black):
    sudo systemctl restart lightdm
---

#### 🔸 2 - Command Pompt - [Download and run reg - windows](https://github.com/t4t34m/0xcode/blob/main/Add_CMD_open_here_windows.reg)
![alt text](https://imgur.com/qGuOBfr.png)

---
#### 🔸 3 - AutoUpdate - [Desktop application](https://github.com/t4t34m/0xcode/tree/main/updateme)
###### worked: [BackBox](https://www.backbox.org/) Ubuntu 5.generic x86_64 x86_64 x86_64 GNU/Linux 

![alt text](https://imgur.com/7jPJcha.png)

![alt text](https://imgur.com/aHpfhCc.png)
   
 ---
#### 🔸 4 - BYPASS CORS with JS & Python - [javascript](/javascript/)

![alt text](https://imgur.com/VMiKAb4.png)

![alt text](https://imgur.com/2OKNcGT.png)
   
 ---

 
