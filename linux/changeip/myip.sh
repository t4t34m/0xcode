myPublicIp=$( (curl -s -4 icanhazip.com | grep -E -o "^[0-9]+.[0-9]+.[0-9]+.[0-9]{1,3}" 2>/dev/null))
myPrivateIp=$( (ip route get 1.2.3.4 | awk '{print $7}'))
myInterFace=$(ip route get 8.8.8.8 | awk '/dev/ {f=NR} f&&NR-1==f' RS=" ")
notify-send -u low -t 8000 "Public ip" "$myPublicIp"
notify-send -u low -t 8000 "Local ip" "$myPrivateIp : $myInterFace"
