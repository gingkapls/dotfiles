#!/bin/sh

word="$(< /dev/stdin)"

if [[ -z "$word" ]]
	then
		notify-send "No word in clipboard"
	else
		zenity --width=800 --height=400 --list --column="Definition" "$(sdcv $word -u oxford -n -j | jq -r '.[] | .word, .definition')" | wl-copy
fi
