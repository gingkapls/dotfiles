#!/bin/sh

pactl set-sink-volume @DEFAULT_SINK@ $1%;
vol=$(pacmd list-sinks | awk 'c&&!--c;/* index*/{c=7};' | awk '{gsub(/%/,"",$5); print $5}')

case $vol in
		"0")
			notify-send "						       Muted" -i none -t 1000 --app-name="volumebar"
		;;
		*)
			notify-send "						           $vol%" -i none -h int:value:$vol -h string:synchronous:volume -t 1000 --app-name="volumebar"
		;;
esac

# bar=$(seq -s "─" $(($vol / 5)) | sed 's/[0-9]//g')
# fullbar=$(seq -s "─" $(echo 100/5 | bc) | sed 's/[0-9]//g')
# doublebar=$(seq -s "═" $(($vol / 10)) | sed 's/[0-9]//g')
# echo $vol
# echo $fullbar
 
# if [ "$vol" -eq "0" ]
# 	then
# 	notify-send -i none t 1000 "  Muted"
# #	else if [ "$vol" -gt "100" ]
# #	then
# 		notify-send -i none -t 1000 "  $doublebar"
# 	else
# 	notify-send -i none -h int:value:$vol -h string:synchronous:volume -t 1000 ""
# #	fi
# fi

