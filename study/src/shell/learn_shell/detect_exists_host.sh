#!/bin/sh
# detect the host in your network

for i in `seq 1 254`
do
	echo "detect 192.168.2.$i"
	ping -q -c1 "192.168.2.$i" > /dev/null
	if [ $? -eq 0 ]
	then 
		echo "192.168.2.$i\n"
	fi
done
