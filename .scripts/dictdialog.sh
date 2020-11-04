#!/bin/sh

## word=$(wl-paste -p | sed 's/\W.*\|\s//g') 
word=$(wl-paste -p | sed 's/^\s\|\s$//g') 
zenity --width=800 --height=400 --list --column="Definition" "$(sdcv $word -u oxford -n -j | jq -r '.[] | .word, .definition')" | wl-copy
