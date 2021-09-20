#!/bin/bash

i=12

while [[ i -lt 20 ]]; 
do
    notify-send -t 1000 "Break Time"
    sleep 1.2
    i=$i+1
done
