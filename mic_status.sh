#!/bin/bash


STATUS=$(pacmd list-sources | grep muted | sed -n 2p | awk '{print $2}')

if [[ $STATUS == "yes" ]]
then
    printf "_"
else
    printf "."
fi
