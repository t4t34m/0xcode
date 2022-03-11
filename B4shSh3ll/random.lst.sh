#!/usr/bin/env bash
i=1
while [ $i -le $1 ]
do
    tr -dc "a-zA-Z0-9_-" </dev/urandom | head -c 15 ; echo ''
    i=$(($i+1))
done
