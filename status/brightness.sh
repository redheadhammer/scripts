BRIGHT=$(brightnessctl | grep Current | awk '{print $4}' | sed "s/[(,)]//g")

echo "  $BRIGHT"

