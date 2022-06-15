#!/bin/bash

CAM=$(fuser /dev/video0)
MIC=$(fuser /dev/snd/pcmC0D0c)


if [[ $CAM != "" ]]
then
    printf "C"
else
    printf "N"
fi


if [[ $MIC != "" ]]
then
    printf "M"
else
    printf "N"
fi
