#!/bin/bash

first=$(echo "$RANDOM%255" | bc)
second=$(echo "$RANDOM%255" | bc)
third=$(echo "$RANDOM%255" | bc)
forth=$(echo "$RANDOM%255" | bc)

ip="$first.$second.$third.$forth"

echo $ip
