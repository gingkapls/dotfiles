#!/bin/sh

num=0
printf "%s\n\n" "$(flavours info $(flavours current) 2>/dev/null | head -n1)"
flavours info $(flavours current) | tail -n16 | while read color; do
	printf "%02d %02X %s\n" "$num" "$num" "$color"
	num=$((num+1))
done
read 
exit
