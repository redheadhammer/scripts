#!/bin/bash

#VID=$(fuser /dev/video0)
AUD=$(fuser /dev/snd/pcmC0D0c)

function test {
    function vid {
        if [[ $VID ]] ; then
            printf "📸 "
        fi
    }
    
    function aud {
        if [[ $AUD ]] ; then 
            printf "📢"
        fi
    }
    
#    vid
    aud

}

test
