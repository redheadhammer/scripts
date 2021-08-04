#!/bin/bash

win=$(cat ./number)
prev=$((win-1))

if [[ $prev -lt 1 ]]
then
    prev=1
fi

echo $prev>./number

xdotool key Super_L+$prev
