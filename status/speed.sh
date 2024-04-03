#!/bin/bash
INTR=wlan0
function human_readable {
    VALUE=${SPEED}
    BIGGIFIERS=( B K M G )
    CURRENT_BIGGIFIER=0
    while [ $VALUE -gt 1500 ] ;do
        VALUE=$(($VALUE/1024))
        CURRENT_BIGGIFIER=$((CURRENT_BIGGIFIER+1))
    done
    #echo "value: $VALUE"
    #echo "biggifier: ${BIGGIFIERS[$CURRENT_BIGGIFIER]}"
    
    echo "$VALUE${BIGGIFIERS[$CURRENT_BIGGIFIER]}"
}

if  [[ $(iwgetid) ]]  ; then
	###CHECKS####

	DEVICE=${INTR}
	IS_GOOD=0
	
	for GOOD_DEVICE in `grep ":" /proc/net/dev | awk '{print $1}' | sed s/:.*//`; do
		if [ "$DEVICE" = "$GOOD_DEVICE" ]; then
	  	IS_GOOD=1
		        break
		fi
	done
	
	if [ $IS_GOOD -eq 0 ]; then
		echo "Device $DEVICE not found. Should be one of these:"
		grep ":" /proc/net/dev | awk '{print $1}' | sed s/:.*//
		exit 1
	fi

	###REAL STUFF
	LINE=`grep $INTR /proc/net/dev | sed s/.*://`;
	RECEIVED=`echo $LINE | awk '{print $1}'`
	TRANSMITTED=`echo $LINE | awk '{print $9}'`
	TOTAL=$(($RECEIVED+$TRANSMITTED))

	#echo "Transmitted: `human_readable $TRANSMITTED`"
	#echo "Received: `human_readable $RECEIVED`"
	#echo "Total: `human_readable $TOTAL`"

	SLP=1
	#echo "Sleeping $SLP to calculate speed..."
	sleep $SLP

	LINE=`grep $INTR /proc/net/dev | sed s/.*://`;
	RECEIVED=`echo $LINE | awk '{print $1}'`
	TRANSMITTED=`echo $LINE | awk '{print $9}'`
	SPEED=$((($RECEIVED+$TRANSMITTED-$TOTAL)/$SLP))

	echo "  `human_readable $SPEED`/s"
else 
	printf ""
fi
