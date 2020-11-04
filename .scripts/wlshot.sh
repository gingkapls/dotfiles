#!/bin/sh

## Screenshots

if [ "$1" == "-c" ]; then
		grim -g "$(slurp -p -c "#FFFFFF" )" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | awk 'FNR==2 {print $3}' | wl-copy ## Color Picker
		convert -size 120x50 xc:$(wl-paste) /tmp/color.png
		notify-send -i /tmp/color.png $(wl-paste)
		rm /tmp/color.png

elif [ "$1" == "-p" ]; then
		grim -g "$(slurp -c "#FFFFFF" )" "$HOME/Pictures/shots/""$(date +"%F_%T").png" && notify-send -i $(ls $HOME/Pictures/shots/* -drt | tail -n1) "Screenshot Captured" ## Partial screenshot 
		wl-copy < $(ls $HOME/Pictures/shots/* -drt | tail -n1)

elif [ "$1" == "-w" ]; then
		grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp -c "#FFFFFF" )" "$HOME/Pictures/shots/""$(date +"%F_%T").png" && notify-send -i $(ls $HOME/Pictures/shots/* -drt | tail -n1) "Screenshot Captured" 
		wl-copy < $(ls $HOME/Pictures/shots/* -drt | tail -n1)

else
		grim "$HOME/Pictures/shots/""$(date +"%F_%T").png" -c && notify-send -i $(ls $HOME/Pictures/shots/* -drt | tail -n1) "Screenshot Captured"  ## Normal screenshot  
		wl-copy < $(ls $HOME/Pictures/shots/* -drt | tail -n1)
fi


########################################################################

## Screenshots
 

## case $1 in
## 		-c)
## 			grim -g "$(slurp -p -c "#FFFFFF" )" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | awk 'FNR==2 {print $3}' | wl-copy ## Color Picker
## 		convert -size 120x50 xc:$(wl-paste) /tmp/color.png
## 		notify-send -i /tmp/color.png $(wl-paste)
## 		rm /tmp/color.png
## 		;;	
## 
## 

