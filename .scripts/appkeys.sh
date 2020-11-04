#!/bin/sh

app=$(swaymsg -t get_tree | awk 'c&&!--c;/focus.*true*/{c=38}' | cut -d '"' -f4)
if [ -z "$app" ]; then
		app=$(swaymsg -t get_tree | awk 'c&&!--c;/focus.*true*/{c=48}' | cut -d '"' -f4)
	else
		true
fi

#if [ "$app" == "[Ff]irefox"
echo "$app"

## [ -z (swaymsg -t get_tree | awk 'c&&!--c;/focus.*true*/{c=38}' | cut -d '"' -f4) ] && sleep 1 && swaymsg -t get_tree | awk 'c&&!--c;/focus.*true*/{c=48}' | cut -d '"' -f4 || swaymsg -t get_tree | awk 'c&&!--c;/focus.*true*/{c=38}'| cut -d '"' -f4


