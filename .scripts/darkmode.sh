#!/bin/sh

case $1 in
	"dark")
		walset.sh dark $HOME/.cache/theme/wallpaper
	;;
	"light")
		walset.sh light $HOME/.cache/theme/wallpaper
	;;
esac
