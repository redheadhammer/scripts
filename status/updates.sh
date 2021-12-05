#!/bin/bash

UPDATES=$(pacman -Sup | grep -c http)
#UPDATES=$(pacman -Qu)
printf " $UPDATES"

