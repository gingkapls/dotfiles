#!/bin/bash

appname=Fiverr
wm_id=$(wmctrl -lx | awk -v pattern="$appname" '$appname ~ pattern { print $1 }') 
bspc node -t floating
bspc node -z left 700 0
bspc node -z bottom 0 -600
bspc node -v 360 0
bspc node -v 0 -107

#printf "$appname $wm_id"
printf "\n Fiverr bot started"

for i in $(seq 1000)
	do
	sleep $(shuf -i 40-90 -n 1) && xdotool search --name "Fiverr" key F5
	sleep 8 && bspc node -f $wm_id
	printf "\n refreshed $i times ;-; "
	sleep 1 && bspc node -f last
done
