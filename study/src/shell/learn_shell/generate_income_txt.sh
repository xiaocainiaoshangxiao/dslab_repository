#!/bin/bash
for i in $(seq 1 10)
do
	echo $i $(($RANDOM/8192+3)) $(($RANDOM/10+3000))
done
