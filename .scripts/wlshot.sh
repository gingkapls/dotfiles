#!/bin/sh

## Screenshots
app_id="$(swaymsg -t get_tree | jq -r '.. | select (.pid? and .focused?) | .app_id')"

case "$1" in
	"-c") ## Color Picker
		grim -g "$(slurp -p -c "#000000" )" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | awk 'FNR==2 {print $3}' | wl-copy 
		convert -size 96x96 xc:$(wl-paste) /tmp/color.png
		notify-send "$(wl-paste)" -i /tmp/color.png --app-name=colorpicker 
		rm /tmp/color.png
		break
	;;
	"-p") ## Partial screenshot 
		grim -g "$(slurp -c "#000000" )" "$HOME/Pictures/shots/""$(date +"%F_%T")_"$app_id".png" && notify-send -i $(ls $HOME/Pictures/shots/* -drt | tail -n1) "Screenshot Captured" --app-name="screenshots" -t 2000
		wl-copy < $(ls $HOME/Pictures/shots/* -drt | tail -n1)
		tesseract $(ls $HOME/Pictures/shots/* -drt | tail -n1) - | wl-copy -p
		break
	;;
	"-w") ## Window screenshot
		grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp -c "#FFFFFF" )" "$HOME/Pictures/shots/""$(date +"%F_%T")_"$app_id".png" && notify-send -i $(ls $HOME/Pictures/shots/* -drt | tail -n1) "Screenshot Captured" --app-name="screenshots" 
		wl-copy < $(ls $HOME/Pictures/shots/* -drt | tail -n1)
		tesseract $(ls $HOME/Pictures/shots/* -drt | tail -n1) - | wl-copy -p
		break
	;;
	"-t") ## OCR
		grim -g "$(slurp -c "#000000" )" -t ppm - | tesseract - - | wl-copy -p
		notify-send "Copied to Clipboard" "$(wl-paste -p)"
		break
	;;
	*) ## Normal screenshot  
		grim "$HOME/Pictures/shots/""$(date +"%F_%T")_"$app_id".png" -c && notify-send -i $(ls $HOME/Pictures/shots/* -drt | tail -n1) "Screenshot Captured"  --app-name="screenshots" -t 2000
		wl-copy < $(ls $HOME/Pictures/shots/* -drt | tail -n1)
		tesseract $(ls $HOME/Pictures/shots/* -drt | tail -n1) - | wl-copy -p
		break
	;;
esac
