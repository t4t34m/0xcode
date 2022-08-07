#!/usr/bin/bash
clear
date=$(date +"%s%3N")
printf """\n#Find the encoded value in the request ...\n"""
read -p '[ + ] Enter String To Encoded All : ' value
base64_defalut=$(echo $value | base64) #
echo_n=$(echo -n $value | base64) #
echo_en=$(echo -e -n $value | base64) #
openssl_defalut=$(echo $value | openssl base64 -A) ##
openssl_n=$(echo -n $value | openssl base64 -A) ##
openssl_en=$(echo -e -n $value | openssl base64 -A) ##
openssl_sha256=$(echo -n $value | openssl dgst -sha256) ###
openssl_sha256_to_base64=$(echo -n $value | openssl dgst -binary -sha256 | openssl base64) ##

declare -a arr=("blake2b512" "blake2s256" "md4" "md5" "md5-sha1"
"ripemd" "rmd160" "ripemd160" "sha1" "sha256" "sha224" "sha3-256"
"sha384" "shake128" "shake256" "sha512-224" "sha3-224" "sha3-512" "sha3-384"
"sha512" "sha512-256" "ssl3-md5" "ssl3-sha1" "sm3" "whirlpool")
## now loop through the above array
date2=$(date +"%s%3N")
for i in "${arr[@]}"
do
   sox=$(echo -n $value | openssl dgst -$i | sed 's/^.* //')
   #echo "$i = $sox" >> output-$date-.txt
   echo "$i = $sox"
   
   sox2=$(echo -n $date2 | openssl dgst -$i | sed 's/^.* //')
   #echo "$date2 ($i) = $sox2" >> output2-$date-.txt
   echo "[ $date2 ] ( $i ) = $sox2"
   echo ""
done

 
 
