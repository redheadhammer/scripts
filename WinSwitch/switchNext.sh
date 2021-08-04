#!/bin/bash

win=$(cat ./number)
next=$((win+1))

if [[ $next -gt 9 ]]
then
    next=9
fi

echo $next > ./number

xdotool key Super_L+$next

