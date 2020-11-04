#!/bin/sh

while [ $(wc -l /tmp/vid_qual | cut -b-2) -lt 5 ]
	do sleep 0
done
quality=$(printf "%dp %dfps" $(awk -F ')' '/fps/ { gsub(/[^x]*[x]|\(|\....|fps/,"",$3); print $3 }' /tmp/vid_qual))
echo $quality
