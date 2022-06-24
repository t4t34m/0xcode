#!/usr/bin/bash
# How to run Best with no root just ./afterFormat.sh
# 2022-06-24
clear
coption(){
    read -p $'\n\e[1;37m#: \e[0m' answer
    }
printf """\n\e[0m#1\e[1;37m INSTALL -  updating & upgrading  \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m\n"""  
coption
if [[ "$answer" == "1" ]]; 
then
printf """add-repos ubuntu? 1) yes , 2) Skip ... (ONLY 1 TIME AFTER FORMAT)\n""" 
coption
if [[ "$answer" == "1" ]]; 
then
sudo add-apt-repository "deb http://mirrors.kernel.org/ubuntu bionic main universe"
sudo add-apt-repository ppa:linuxuprising/libpng12
fi
sudo rm -r /var/cache/apt/archives/lock
sudo rm -r /var/lib/dpkg/lock-frontend
sudo rm -r /var/lib/dpkg/lock
sudo apt autoremove -y
sudo apt remove -y
sudo apt clean -y
sudo apt autoclean -y
sudo apt update
sudo apt --fix-broken install -y
sudo apt install -f -y
sudo apt update --fix-missing -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt dist-upgrade -y
sudo apt -o Dpkg::Options::="--force-overwrite" upgrade -y
sudo dpkg --configure -a
sudo apt autoremove -y
sudo apt remove -y
sudo apt clean -y
sudo apt autoclean -y
fi
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;37m INSTALL - Python (libs/dev/dos/pip/..etc)  \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m\n"""
coption
if [[ "$answer" == "1" ]]; 
then
sudo apt-get install synaptic tor libpython2-stdlib python2-minimal python-olefile python-is-python2 python-pkg-resources python2-dev python2 libssl1.0.0 python-pip-whl perl-doc python-mysqldb libpcap0.8-dev figlet git g++ python3 python-dev-is-python2 python3-dev libssl1.1 libssl-dev libwww-mechanize-shell-perl libio-socket-socks-perl libmoose-perl cpanminus python3-pip python3-mysqldb python3-gevent python3-gevent-websocket openssl build-essential libreadline-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev gawk bison libffi7 libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr gtk3-nocsd bleachbit stacer basez gnome-terminal 2to3 websploit dirsearch dmitry gobuster checkinstall ruby ruby-dev  libcurl4-openssl-dev unrar bacula-sd xclip onesixtyone libgtk3-nocsd0 libxml2 pkg-config python-opengl python-pil python-pyrex python3-pyside2.qtopengl lynx libpython2-dev libpython-all-dev python-all python-all-dev python-tk python-numpy libgle3 xsltproc libgmp-dev inotify-tools torsocks proxychains4 tor
sudo apt install software-properties-common -y
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin ca-certificates containerd.io docker-compose-plugin -y
sudo apt install npm nodejs gcc make yarn gmtp nodejs-legacy gcc-mingw-w64-i686 mingw-w64 -y
sudo apt install glogg zstd enscript gnuplot grads hp2xx html2ps libwmf-bin mplayer povray transfig ufraw-batch inkscape libjxr-tools -y
sudo apt install exiv2 imagemagick libimage-exiftool-perl jq imagemagick-doc elinks goldeneye perl-tk spikeproxy network-manager-openvpn-gnome -y
sudo apt install libjs-dojo-core libxml2-dev libboost-dev qt5-default qtbase5-dev-tools qtdeclarative5-dev libqt5svg5-dev libqt5websockets5-dev cmake libportmidi0 libasound2 -y
sudo apt install libusbmuxd-dev ifuse xvfb ideviceinstaller python-imobiledevice libimobiledevice-utils libimobiledevice6 -y
sudo apt install libev-dev libnl-3-dev libnl-genl-3-dev libnl-route-3-dev -y
sudo apt install ruby-full finger xsel v4l2loopback-dkms v4l-utils ffmpeg -y
fi 
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;37m INSTALL - phpstorm testssl docker go snaps  \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m"""
coption
if [[ "$answer" == "1" ]]; 
then
sudo snap install phpstorm --classic
sudo snap install docker
sudo snap install testssl
sudo snap install go --classic
sudo snap install pictool
sudo snap install core
sudo snap install multipass
sudo snap install pynsource
sudo snap install cmake --classic
fi
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;31m Done - phpstorm testssl docker go snaps  \e[0m"""
printf """\n#4\e[1;37m INSTALL - Perl / Cpan / EksblowFish / SSH::NET  \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m"""
coption
if [[ "$answer" == "1" ]]; 
then
sudo CPAN
sudo cpan -i Net::Whois::IP
sudo cpanm Net::SSH::Perl
sudo cpan -i Crypt::Eksblowfish::Bcrypt
sudo cpan -i Crypt::EksBlowfish
fi 
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;31m Done - phpstorm testssl docker go snaps  \e[0m"""
printf """\n#4\e[1;31m Done - Perl / Cpan / EksblowFish / SSH::NET  \e[0m"""
printf """\n#5\e[1;37m INSTALL - pip3/mods requests,multiprocessing,..etc reqs  \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m"""

coption
if [[ "$answer" == "1" ]]; 
then
pip install --upgrade pip --user --no-warn-script && pip install --upgrade pip --user --no-warn-script
pip3 install --upgrade pip --user --no-warn-script && pip3 install --upgrade pip --user --no-warn-script
pip install lxml==4.6.3 rich virtualenv setdefaultencoding bandit PySocks ujson cryptography typing python-telegram-bot fierce scrapy python-dateutil==2.1 requests-html unidecode stem requests_toolbelt python-bidi arabic-reshaper Counter pexpect aiohttp aiofiles pyOpenSSL asyncio requests --user --no-warn-script
pip install rich virtualenv setdefaultencoding bandit PySocks ujson cryptography typing python-telegram-bot fierce scrapy python-dateutil==2.1 requests-html anyascii unidecode stem requests_toolbelt python-bidi arabic-reshaper Counter pexpect aiohttp aiofiles pyOpenSSL asyncio requests --user
pip3 install requests[socks] --user
pip3 install pip lxml==4.6.3 --user
pip3 install PyTelegramBotAPI==2.2.3 --user
pip3 install setuptools --user
pip3 install pandas --trusted-host pypi.org --trusted-host files.pythonhosted.org --user
pip3 install mysqlclient --user
pip install Scrapy 
pip3 install selenium --user
sudo pip3 install -U selenium
pip install --no-binary :all: faradaysec --user
sudo python3 -m pip install --upgrade requests
#opendrop send -r 0 -f https://owlink.org --url
pip install aiodns dnspython==1.16.0 opendrop html2text isort mysql.connector mysql colorlog flask-cors faradaysec ip2loc ifaddr pwn poster==0.4 autopep8 dnspython3 fierce python-dateutil==2.8.1 typing ujson bandit multiprocess --user
sudo pip install aiodns dnspython==1.16.0 opendrop html2text isort mysql.connector mysql colorlog flask-cors faradaysec ip2loc ifaddr pwn poster==0.4 autopep8 dnspython3 fierce python-dateutil==2.8.1 typing ujson bandit multiprocess --user
pip3 install aiodns dnspython==1.16.0 opendrop html2text isort mysql.connector mysql colorlog flask-cors faradaysec ip2loc ifaddr pwn poster==0.4 autopep8 dnspython3 fierce python-dateutil==2.8.1 typing ujson bandit multiprocess --user
sudo pip3 install aiodns dnspython==1.16.0 opendrop html2text isort mysql.connector mysql colorlog flask-cors faradaysec ip2loc ifaddr pwn poster==0.4 autopep8 dnspython3 fierce python-dateutil==2.8.1 typing ujson bandit multiprocess --user
pip install imageio webdriver_manager chromedriver_autoinstaller chromedriver_binary undetected-chromedriver selenium-stealth tiktokpy pystyle playwright-stealth TikTokApi --user
sudo pip install imageio webdriver_manager chromedriver_autoinstaller chromedriver_binary undetected-chromedriver selenium-stealth tiktokpy pystyle playwright-stealth TikTokApi --user
pip3 install imageio webdriver_manager chromedriver_autoinstaller chromedriver_binary undetected-chromedriver selenium-stealth tiktokpy pystyle playwright-stealth TikTokApi --user
sudo pip3 install imageio webdriver_manager chromedriver_autoinstaller chromedriver_binary undetected-chromedriver selenium-stealth tiktokpy pystyle playwright-stealth TikTokApi --user

fi
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;31m Done - phpstorm testssl docker go snaps  \e[0m"""
printf """\n#4\e[1;31m Done - Perl / Cpan / EksblowFish / SSH::NET  \e[0m"""
printf """\n#5\e[1;31m Done - pip3/mods requests,multiprocessing,..etc reqs  \e[0m"""
printf """\n#6\e[1;37m INSTALL - gem gobuster wpscan nokogiri  \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m"""

coption
if [[ "$answer" == "1" ]]; 
then
sudo gem install wpscan nokogiri
sudo gem install bundler && bundle config set --local without 'test' 
cd ~/
go install github.com/OJ/gobuster/v3@latest
go get && go build
source ~/.profile 
source ~/.bashrc
fi 
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;31m Done - phpstorm testssl docker go snaps  \e[0m"""
printf """\n#4\e[1;31m Done - Perl / Cpan / EksblowFish / SSH::NET  \e[0m"""
printf """\n#5\e[1;31m Done - pip3/mods requests,multiprocessing,..etc reqs  \e[0m"""
printf """\n#6\e[1;31m Done - gem gobuster wpscan nokogiri  \e[0m"""
printf """\n#7\e[1;37m INSTALL - APACHE/PHPMYADMIN/MYSQL/PHP \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m"""
 
coption
if [[ "$answer" == "1" ]]; 
then
sudo apt install php-gettext apache2 mariadb-server mariadb-client phpmyadmin apache2-utils libapache2-mod-evasive libapache2-mod-security2 libapache2-mod-php7.4 php7.4 php7.4-dba php7.4-interbase php7.4-opcache php7.4-sqlite3 php7.4-bcmath php7.4-dev php7.4-intl php7.4-pgsql php7.4-sybase php7.4-bz2 php7.4-enchant php7.4-json php7.4-phpdbg php7.4-tidy php7.4-cgi php7.4-fpm php7.4-ldap php7.4-pspell php7.4-xml php7.4-cli php7.4-gd php7.4-mbstring php7.4-readline php7.4-xmlrpc php7.4-common php7.4-gmp php7.4-mysql php7.4-snmp php7.4-xsl php7.4-curl php7.4-imap php7.4-odbc php7.4-soap php7.4-zip libapache2-mod-php php-pear php-curl php php-common php-mysql php-gd php-cli php-tokenizer php-mbstring php-cli php-bcmath php-json php-xml php-zip -y
sudo mysql_secure_installation
sudo a2enmod rewrite
sudo phpdismod curl
sudo phpenmod curl
sudo a2dissite default
sudo phpenmod mbstring
sudo a2enconf phpmyadmin.conf
sudo systemctl restart apache2
sudo systemctl enable mysql
sudo chown -R $USER:$USER /var/www/html
fi 
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;31m Done - phpstorm testssl docker go snaps  \e[0m"""
printf """\n#4\e[1;31m Done - Perl / Cpan / EksblowFish / SSH::NET  \e[0m"""
printf """\n#5\e[1;31m Done - pip3/mods requests,multiprocessing,..etc reqs  \e[0m"""
printf """\n#6\e[1;31m Done - gem gobuster wpscan nokogiri  \e[0m"""
printf """\n#7\e[1;31m Done - APACHE/PHPMYADMIN/MYSQL/PHP  \e[0m"""
printf """\n#8\e[1;37m INSTALL - Create /opt/backbox \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m"""
coption
if [[ "$answer" == "1" ]]; 
then
if [ -d "/opt/backbox" ] 
then
    printf """\n[\e[1;38;5;120m + \e[0m] \e[1;37m Found /opt/backbox \e[0m\n"""
else
    cd /opt
    printf "enter password to create /opt/backbox"
    sudo mkdir backbox
    printf "enter password to chown $USER"
    sudo chown -R $USER:$USER /opt/backbox
    chmod +x -R /opt/backbox
fi
if [ -d "/opt/backbox/0xcode" ] 
then
    printf """\nFound 0xcode \n"""
else
    sudo chown -R $USER:$USER /opt/backbox
    cd /opt/backbox/
    git clone https://github.com/jm511hacker/jm511hacker.git
    git clone https://github.com/t4t34m/0xcode.git
    curl -sLO http://archive.ubuntu.com/ubuntu/pool/universe/s/sslscan/sslscan_2.0.7-1_amd64.deb && sudo apt update && sudo dpkg -i sslscan_2.0.7-1_amd64.deb && sudo apt install -f -y
    wget https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb && sudo apt update -y && sudo dpkg -i code_1.63.2-1639562499_amd64.deb
fi
rm /opt/backbox/sslscan_2.0.7-1_amd64.deb
rm /opt/backbox/code_1.63.2-1639562499_amd64.deb
clear

fi 
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;31m Done - phpstorm testssl docker go snaps  \e[0m"""
printf """\n#4\e[1;31m Done - Perl / Cpan / EksblowFish / SSH::NET  \e[0m"""
printf """\n#5\e[1;31m Done - pip3/mods requests,multiprocessing,..etc reqs  \e[0m"""
printf """\n#6\e[1;31m Done - gem gobuster wpscan nokogiri  \e[0m"""
printf """\n#7\e[1;31m Done - APACHE/PHPMYADMIN/MYSQL/PHP  \e[0m"""
printf """\n#8\e[1;31m Done - Create /opt/backbox  \e[0m"""
printf """\n#9\e[1;37m INSTALL - Tools : sqlitebrowser,whatweb,dmitry...etc \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m"""

coption
if [[ "$answer" == "1" ]];
then
sudo apt install libpng12-0 -y
sudo apt install dnstracer ncrack sqlitebrowser synapse kazam guake dos2unix glances torbrowser-launcher zipalign rdfind dmitry asciinema -y
sudo apt-get install python-gevent python-gevent-websocket deepin-terminal onesixtyone -y
sudo apt install jboss-autopwn whatweb gnome-terminal alacarte pnscan -y
sudo apt install libqt4-network libqtcore4 libqtocore4 libqtgui4 -y
fi
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;31m Done - phpstorm testssl docker go snaps  \e[0m"""
printf """\n#4\e[1;31m Done - Perl / Cpan / EksblowFish / SSH::NET  \e[0m"""
printf """\n#5\e[1;31m Done - pip3/mods requests,multiprocessing,..etc reqs  \e[0m"""
printf """\n#6\e[1;31m Done - gem gobuster wpscan nokogiri  \e[0m"""
printf """\n#7\e[1;31m Done - APACHE/PHPMYADMIN/MYSQL/PHP  \e[0m"""
printf """\n#8\e[1;31m Done - Create /opt/backbox  \e[0m"""
printf """\n#9\e[1;31m Done - Tools : sqlitebrowser,whatweb,dmitry...etc  \e[0m"""
printf """\n#10\e[1;37m INSTALL - Java 17 install  \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m"""

coption
if [[ "$answer" == "1" ]]; 
then
sudo apt install openjdk-11-jdk -y
sudo add-apt-repository ppa:linuxuprising/java -y
sudo apt -y install oracle-java17-set-default -y
source /etc/profile.d/jdk.sh
fi
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;31m Done - phpstorm testssl docker go snaps  \e[0m"""
printf """\n#4\e[1;31m Done - Perl / Cpan / EksblowFish / SSH::NET  \e[0m"""
printf """\n#5\e[1;31m Done - pip3/mods requests,multiprocessing,..etc reqs  \e[0m"""
printf """\n#6\e[1;31m Done - gem gobuster wpscan nokogiri  \e[0m"""
printf """\n#7\e[1;31m Done - APACHE/PHPMYADMIN/MYSQL/PHP  \e[0m"""
printf """\n#8\e[1;31m Done - Create /opt/backbox  \e[0m"""
printf """\n#9\e[1;31m Done - Tools : sqlitebrowser,whatweb,dmitry...etc  \e[0m"""
printf """\n#10\e[1;31m Done - Java 17 install  \e[0m"""
printf """\n#11\e[1;37m INSTALL -  proxychains4 update && upgrade \e[0m\n\n1) \e[1;38;5;112m to Install\e[0m\n2) \e[1;38;5;112m to Skip\e[0m"""
coption
if [[ "$answer" == "1" ]]; 
then
sudo service tor start
proxychains4 sudo apt update && proxychains4 sudo apt upgrade -y
proxychains4 sudo apt update --fix-missing -y && sudo apt autoremove -y && proxychains4 sudo apt install -f -y
proxychains4 sudo apt-get dist-upgrade -y
proxychains4 sudo apt-get -o Dpkg::Options::="--force-overwrite" upgrade -y
proxychains4 sudo dpkg --configure -a
fi
clear
printf """\n#1\e[1;31m Done - updating & upgrading  \e[0m"""  
printf """\n#2\e[1;31m Done - Python (libs/dev/dos/pip/..etc)  \e[0m"""
printf """\n#3\e[1;31m Done - phpstorm testssl docker go snaps  \e[0m"""
printf """\n#4\e[1;31m Done - Perl / Cpan / EksblowFish / SSH::NET  \e[0m"""
printf """\n#5\e[1;31m Done - pip3/mods requests,multiprocessing,..etc reqs  \e[0m"""
printf """\n#6\e[1;31m Done - gem gobuster wpscan nokogiri  \e[0m"""
printf """\n#7\e[1;31m Done - APACHE/PHPMYADMIN/MYSQL/PHP  \e[0m"""
printf """\n#8\e[1;31m Done - Create /opt/backbox  \e[0m"""
printf """\n#9\e[1;31m Done - Tools : sqlitebrowser,whatweb,dmitry...etc  \e[0m"""
printf """\n#10\e[1;31m Done - Java 17 install  \e[0m"""
printf """\n#11\e[1;31m Done - proxychains4 update && upgrade  \e[0m"""
printf """\n\e[1;38;5;112m DONE INSTALL  \e[0m"""

printf """
[ CMD ]
#---------------------
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0 && source ~/.bashrc 
sudo grep -r LD_PRELOAD /etc $HOME
(echo 'deb [arch=amd64, trusted=yes] https://nuts.vysor.io/apt ./' | sudo tee /etc/apt/sources.list.d/vysor.list) && sudo apt update && sudo apt install vysor 
sudo tor --service install -options ControlPort 9051
#---------------------
"""
