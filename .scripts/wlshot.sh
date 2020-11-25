#!/bin/sh

## Screenshots

case "$1" in
	"-c")
		grim -g "$(slurp -p -c "#FFFFFF" )" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | awk 'FNR==2 {print $3}' | wl-copy 
		convert -size 120x50 xc:$(wl-paste) /tmp/color.png
		notify-send -i /tmp/color.png $(wl-paste) --app-name="screenshots"
		rm /tmp/color.png
	;;
	"-p")
		grim -g "$(slurp -c "#FFFFFF" )" "$HOME/Pictures/shots/""$(date +"%F_%T").png" && notify-send -i $(ls $HOME/Pictures/shots/* -drt | tail -n1) "Screenshot Captured" --app-name="screenshots" ## Partial screenshot 
		wl-copy < $(ls $HOME/Pictures/shots/* -drt | tail -n1)
	;;
	"-w")
		grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp -c "#FFFFFF" )" "$HOME/Pictures/shots/""$(date +"%F_%T").png" && notify-send -i $(ls $HOME/Pictures/shots/* -drt | tail -n1) "Screenshot Captured" --app-name="screenshots"
		wl-copy < $(ls $HOME/Pictures/shots/* -drt | tail -n1)
	;;
	*)
		grim "$HOME/Pictures/shots/""$(date +"%F_%T").png" -c && notify-send -i $(ls $HOME/Pictures/shots/* -drt | tail -n1) "Screenshot Captured"  --app-name="screenshots" ## Normal screenshot  
		wl-copy < $(ls $HOME/Pictures/shots/* -drt | tail -n1)
	;;
esac
