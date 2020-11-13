#!/bin/sh

## word=$(wl-paste -p | sed 's/\W.*\|\s//g') 
# case "$1" in
# 		"paste")
# 			word=$(wl-paste -p | sed 's/^\s\|\s$//g') 
# 			;;
# 		"type")
# 				word="$(cat /dev/stdin)"
# 			;;
# esac


word="$(< /dev/stdin)"

if [[ -z "$word" ]]
	then
		notify-send "No word in clipboard"
	else
		zenity --width=800 --height=400 --list --column="Definition" "$(sdcv $word -u oxford -n -j | jq -r '.[] | .word, .definition')" | wl-copy
fi
