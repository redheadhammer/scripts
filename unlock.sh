#!/bin/bash
# I created this script because when i used to test my android apps on my device, i was too lazy to unlock my devices by reaching out to it


adb shell input keyevent 26 # power-button

sleep 1

adb shell input swipe 500 2300 500 100 800  # swipe

sleep 2
adb shell input text "1737"

adb shell input keyevent 66 # enter
