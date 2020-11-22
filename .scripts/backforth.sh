#!/bin/sh

state=$1
case "$state" in
		"up")
			swaymsg focus down
			state="down"
			;;
		"down")
			swaymsg focus up
			state="up"
			;;
		"left")
			swaymsg focus right
			state="right"
			;;
		"right")
			swaymsg focus left
			state="left"
			;;
esac

