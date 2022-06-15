#!/bin/bash

UPDATES=$(checkupdates | wc -l)
#UPDATES=$(pacman -Sup | grep -c http)
#UPDATES=$(pacman -Qu)
#printf " $UPDATES"
printf "  $UPDATES"
