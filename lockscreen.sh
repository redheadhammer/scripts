#!/bin/bash

DIR="$HOME/.lockscreen"
IMG=$(find $DIR -name *.png | shuf -n1)
convert $IMG -blur 0,0 /tmp/lockscreen.png
# i3lock -f -e -i /tmp/lockscreen.png

# betterlockscreen -u /tmp/lockscreen.png -d
betterlockscreen -l dimblur
