#!/bin/bash

check=$(iwgetid -r)
if [[ $check ]]; then
    ip=$(curl -s --max-time 9 ifconfig.co)
    if ! [[ $(tail -n 1 $HOME/.ip_state | grep $ip) ]]; then
        echo $ip : $(date) >> $HOME/.ip_state 
    fi
fi

# other websites to check ip address
# ifconfig.me
# checkip.amazonaws.com
# ipecho.net/plain
# icanhazip.com
