#!/bin/bash
# Rofi menu for power related options 

DIALOG_RESULT=$(echo -e 'lock session\nsuspend\nreboot\npoweroff\nexit window manager' | rofi -config $HOME/.config/rofi/launcher/style.rasi -dmenu -i -p "[ Computer ] : " -hide-scrollbar -tokenize -lines 4 -eh 1 -width 40 -location 8 -xoffset 500 -yoffset 70 -padding 30 -disable-history -font "SourceCodePro 18")

WM=$(wmctrl -m | grep "Name" | awk '{print $2}')

echo "This result is : $DIALOG_RESULT"

sleep 1;

if [ "$DIALOG_RESULT" = "exit window manager" ];
    then
        kill -9 $(pgrep $WM)
    #   kill -9 $(pidof -x qtile)
    #   killall qtile
elif [ "$DIALOG_RESULT" = "lock session" ];
    then
        exec loginctl lock-session
elif [ "$DIALOG_RESULT" = "suspend" ];
    then
        exec systemctl suspend
elif [ "$DIALOG_RESULT" = "reboot" ];
    then
        exec systemctl reboot
elif [ "$DIALOG_RESULT" = "poweroff" ];
    then
        exec systemctl poweroff
fi
