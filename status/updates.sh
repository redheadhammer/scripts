#!/bin/bash

UPDATES=$(sudo pacman -Syup | grep -c http)
printf " $UPDATES"

