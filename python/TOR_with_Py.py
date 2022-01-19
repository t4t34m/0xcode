#
# [ 1 ] Install : 
#  pip install requests[socks]
#  pip install stem
#  
#[ 2 ] Create password with TOR :
#  tor --hash-password "YOUR_PASS_HERE_ANY_PASS"
#
#[ 3 ] Edit torrc and remove #: 
#  sudo geany /etc/tor/torrc
#  
# Search and remove only # from and replace with [ 2 ] password  : 
#    > ControlPort 9051
#    > HashedControlPassword 16:A123EABEA87EB931234252141234D261234ADAAE1234B51234
#
#[ 4 ] Restart Tor : 
#  sudo service tor restart
#  
#-------------------------------------------PYTHON SECTION---------------  
## IN YOUR Python script add : 
from stem import Signal
from stem.control import Controller

def get_tor_session():
    RefreshTor()
    s = requests.session()
    s.proxies = {'http':  'socks5://127.0.0.1:9050','https': 'socks5://127.0.0.1:9050'}
    return s
def RefreshTor():
    with Controller.from_port(port = 9051) as controller:
        controller.authenticate(password='YOUR_PASS_HERE_ANY_PASS')
        controller.signal(Signal.NEWNYM)
        
 # add : RefreshTor()
RefreshTor()
