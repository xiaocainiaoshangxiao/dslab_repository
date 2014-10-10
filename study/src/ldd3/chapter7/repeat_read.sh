#!/bin/bash
# This file is used to repeatedly 4 times read from a file under /proc

if [ $# -lt 1 ]
then 
	echo "Usage:./repeat_read.sh filename"
	exit -1
fi

for i in `seq 1 4`
do
	cat $1
done
