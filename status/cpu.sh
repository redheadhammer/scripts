#!/bin/sh

cpu () {
	CPU=$(top -bn1 | grep Cpu | awk '{print $2}')
	printf " $CPU|"
}

memory () {
	MEM=$(free -h | grep Mem)
	MEMUSED=$(echo $MEM | awk '{print $3}')
	MEMTOT=$(echo $MEM |awk '{print $2}')
	printf " $MEMUSED/$MEMTOT"
}

cpu
memory
