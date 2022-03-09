#!/usr/bin/bash
#-------------------------#
#  v3
#-------------------------#
c(){
    command -v "$1" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        sudo apt install $1 -y
        exit 1
    fi
}
for COMMAND in "figlet" "cpan" "gem" "synaptic" "tor"; do
    c "${COMMAND}"
done
coption(){
    printf '\e[1;37m\n#Hit Enter to Skip, or Type 1 to install..\n\e[0m'
read -p $'\e[1;32m#Enter Now : \e[0m' answer
}
sudo service tor start
echo "Start Update/Upgrade" | figlet
coption
if [[ "$answer" == "1" ]]; 
then
echo "add deb ubuntu" | figlet
coption
if [[ "$answer" == "1" ]]; 
then
sudo add-apt-repository "deb http://mirrors.kernel.org/ubuntu bionic main universe"
fi
sudo apt update 
sudo apt --fix-broken install -y
sudo apt install -f -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt update --fix-missing -y
sudo apt-get dist-upgrade -y
sudo apt-get -o Dpkg::Options::="--force-overwrite" upgrade -y
sudo dpkg --configure -a
sudo apt autoremove -y
sudo apt remove -y
sudo apt clean -y
sudo apt autoclean -y
fi
#-------------------------#
echo "[ 1 ] INSTALL libs/dev/python3  " | figlet
coption
if [[ "$answer" == "1" ]]; 
then
sudo apt-get install libpython2-stdlib python2-minimal python-olefile python-is-python2 python-pkg-resources python2-dev python2 libssl1.0.0 python-pip-whl perl-doc python-mysqldb libpcap0.8-dev figlet git g++ python3 python-dev-is-python2 python3-dev libssl1.1 libssl-dev libwww-mechanize-shell-perl libio-socket-socks-perl libmoose-perl cpanminus python3-pip python3-mysqldb python3-gevent python3-gevent-websocket openssl build-essential libreadline-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev gawk bison libffi7 libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr gtk3-nocsd bleachbit stacer basez gnome-terminal 2to3 websploit dirsearch dmitry gobuster checkinstall ruby ruby-dev  libcurl4-openssl-dev unrar bacula-sd xclip onesixtyone libgtk3-nocsd0 libxml2 pkg-config python-opengl python-pil python-pyrex python3-pyside2.qtopengl lynx libpython2-dev libpython-all-dev python-all python-all-dev python-tk python-numpy libgle3 xsltproc libgmp-dev inotify-tools torsocks proxychains4 tor
fi 
echo "[ 2 ] INSTALL phpstorm testssl docker go " | figlet
coption
if [[ "$answer" == "1" ]]; 
then
sudo snap install phpstorm --classic
sudo snap install docker
sudo snap install testssl
sudo snap install go --classic
fi 
echo "[ 3 ] INSTALL PERL: cpan Eksblowfish SSH Net " | figlet
coption
if [[ "$answer" == "1" ]]; 
then
install CPAN
reload cpan
sudo cpan -i Net::Whois::IP
sudo cpanm Net::SSH::Perl
sudo cpan -i Crypt::Eksblowfish::Bcrypt
cpan -i Crypt::EksBlowfish
fi 
echo "[ 4 ] INSTALL pip3/pip reqs " | figlet
coption
if [[ "$answer" == "1" ]]; 
then
pip install --upgrade pip --user --no-warn-script && pip install --upgrade pip --user --no-warn-script
pip3 install --upgrade pip --user --no-warn-script && pip3 install --upgrade pip --user --no-warn-script
pip3 install lxml==4.6.3 rich multiprocessing virtualenv setdefaultencoding bandit PySocks ujson cryptography typing python-telegram-bot fierce scrapy python-dateutil==2.1 requests-html unidecode stem requests_toolbelt python-bidi arabic-reshaper Counter pexpect aiohttp aiofiles pyOpenSSL asyncio requests --user --no-warn-script
pip3 install --upgrade rich multiprocessing virtualenv setdefaultencoding bandit PySocks ujson cryptography typing python-telegram-bot fierce scrapy python-dateutil==2.1 requests-html anyascii unidecode stem requests_toolbelt python-bidi arabic-reshaper Counter pexpect aiohttp aiofiles pyOpenSSL asyncio requests --user --no-warn-script
pip3 install --upgrade requests[socks] --user
pip3 install --upgrade pip lxml==4.6.3 --user
pip3 install --upgrade PyTelegramBotAPI==2.2.3 --user
pip3 install --upgrade setuptools --user
pip3 install pandas --trusted-host pypi.org --trusted-host files.pythonhosted.org
pip3 install mysqlclient --user
fi 
echo "[ 5 ] INSTALL gem gobuster wpscan nokogiri " | figlet
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
echo "[ 6 ] APACHE/PHPMYADMIN/MYSQL/PHP" | figlet
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
sudo chown $USER:$USER -R /var/www/html
fi 
echo "[ 7 ] Create /opt/backbox " | figlet
coption
if [[ "$answer" == "1" ]]; 
then
if [ -d "/opt/backbox" ] 
then
    echo "# cd /opt"
else
    sudo mkdir backbox
    sudo chown -R $USER:$USER backbox
fi
cd /opt/backbox
if [ -d "/opt/backbox/wpscan" ] 
then
    echo "# WPscan already ..."
else
    cd /opt/backbox
    git clone https://github.com/wpscanteam/wpscan.git
    cd wpscan/
    sudo gem install bundler && bundle config set --local without 'test'
fi
if [ -d "/opt/backbox/jm511hacker" ] 
then
    echo "# github already ..."
else
    cd /opt/backbox/
    curl -sLO http://archive.ubuntu.com/ubuntu/pool/universe/s/sslscan/sslscan_2.0.7-1_amd64.deb && sudo apt update -y && sudo dpkg -i sslscan_2.0.7-1_amd64.deb -y && sudo apt install -f -y
    rm sslscan_2.0.7-1_amd64.deb
    wget https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb && sudo apt update -y
    sudo dpkg -i code_1.63.2-1639562499_amd64.deb -y 
    rm code_1.63.2-1639562499_amd64.deb
fi
cd /opt/backbox
git clone https://github.com/jm511hacker/jm511hacker.git
git clone https://github.com/t4t34m/0xc0d3.git
sudo chown -R $USER:$USER /opt/backbox/
fi 
echo "[ 8 ] t00l install" | figlet
coption
if [[ "$answer" == "1" ]];
then
sudo apt install dnstracer ncrack sqlitebrowser synapse kazam guake dos2unix glances torbrowser-launcher zipalign rdfind dmitry asciinema
sudo apt-get install python-gevent python-gevent-websocket deepin-terminal onesixtyone
sudo apt install jboss-autopwn whatweb gnome-terminal alacarte pnscan 
fi
echo "[ 9 ] Java 17 install" | figlet
coption
if [[ "$answer" == "1" ]]; 
then
sudo apt install openjdk-11-jdk -y
sudo add-apt-repository ppa:linuxuprising/java -y
sudo apt -y install oracle-java17-set-default -y
source /etc/profile.d/jdk.sh
fi
echo "[ 10 ] proxychains4 update && upgrade " | figlet
coption
if [[ "$answer" == "1" ]]; 
then
proxychains4 sudo apt update && proxychains4 sudo apt upgrade -y
proxychains4 sudo apt update --fix-missing -y && sudo apt autoremove -y && proxychains4 sudo apt install -f
proxychains4 sudo apt-get dist-upgrade -y
proxychains4 sudo apt-get -o Dpkg::Options::="--force-overwrite" upgrade -y
proxychains4 sudo dpkg --configure -a
fi
echo ""
echo "# STOPPING TOR ..."
sudo service tor stop
echo "# STARTING TOR ..."
sudo service tor start
echo "# DISABLE UFW sudo ufw disable ..."
sudo ufw disable
echo "# Cleaning ..."
sudo journalctl --vacuum-time=200M
sudo du -sh ~/.cache/thumbnails
sudo rm -rf ~/.cache/thumbnails/*
sudo du -sh ~/.cache/thumbnails
clear
echo "# done ...."
printf """
[ CMD ]
fix the error with libgtk3 openssl 
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0
sudo grep -r LD_PRELOAD /etc $HOME
source ~/.bashrc 
sudo ./config --openssldir=/usr/local/ssl
#------------CMD-----------#
testssl --fast target.com
testssl --beast target.com
testssl --show-certificate target.com | grep \" show\"
testssl -p -s -f -U -S -P --jsonfile-pretty=mxtest.json https://target.com

sslscan --no-failed target.com
sslscan --http --bugs --verbose --show-certificate target.com

nmap \"target.com\" --open 443 --open --defeat-rst-ratelimit
hydra smtp.gmail.com smtp -l xx@gmail.com -P pwd.lst -s 465 -S -v -V
curl -v --silent http://target.com/ 2>&1 | grep -hrio \"\b[a-z0-9.-]\+@[a-z0-9.-]\+\.[a-z]\{2,4\}\+\b\"

getent hosts target.com | awk '{ print $0 }'
wget --execute robots=off --recursive --no-parent --continue target.com
sudo docker run -it --rm wpscanteam/wpscan --url https://target.com/ --no-banner --random-user-agent

htpasswd -bnBC 10 '' password | tr -d ':\\\\n' | sed 's/$2y/$2a/'
openssl base64 -e <<< '511'
openssl base64 -d <<< 'NTExCg=='

echo -e '\U0001f602'
echo \"xyzvb12345-Ab-C5678-dEf\" | sed '0,/-/s//\//'
echo \"Start Update/Upgrade\" | figlet
echo '{\"TEST\":\"TEST\"}\"}' | python3 -m simplejson.tool
echo -n \"TEST\" | md5sum - 
echo -n \"TEST\" | sha256sum -

find . -iname \"*.sql\" | while read -r x; do cat $x | grep \"@gmail.com\"; done
find /opt/backbox/ -iname '*gmail*' -print
find /opt/backbox/ -iname \"*.sql\" | while read -r x; do cat $x | grep -E -o \"gmail\"; done

---[TOR]---

tor --hash-password \"PASSWORD_HERE\"
sudo tor --service install -options ControlPort 9051
"""
