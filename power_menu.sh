#!/bin/bash

DIALOG_RESULT=$(echo -e 'hibernate\nreboot\npoweroff\nexit qtiles' | rofi -dmenu -i -p "[ Computer ] : " -hide-scrollbar -tokenize -lines 4 -eh 1 -width 40 -location 8 -xoffset 170 -yoffset 70 -padding 30 -disable-history -font "SourceCodePro 18")

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "exit qtiles" ];
    then
        kill -9 $(pgrep qtile)
    #   kill -9 $(pidof -x qtile)
    #   killall qtile
elif [ "$DIALOG_RESULT" = "hibernate" ];
    then
        exec systemctl hibernate
elif [ "$DIALOG_RESULT" = "reboot" ];
    then
        exec systemctl reboot
elif [ "$DIALOG_RESULT" = "poweroff" ];
    then
        exec systemctl poweroff
fi
