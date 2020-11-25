#!/bin/sh

light -T $1 
brightness=$(light -G | awk -F \. '{print $1}')
# bar=$(seq -s "─" $(echo $brightness / 5 | bc) | sed 's/[0-9]//g')
notify-send "						           $brightness%" -i none -h int:value:$brightness -h string:synchronous:brightness -t 1000 --app-name="brightnessbar"
