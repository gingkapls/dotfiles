#!/bin/sh

light -T $1 
brightness=$(light -G | awk -F \. '{print $1}')
bar=$(seq -s "─" $(echo $brightness / 5 | bc) | sed 's/[0-9]//g')
notify-send -i none -t 1000 " $bar"
