#!/bin/sh

darkpaper="$HOME/backgrounds/images/ilya-kuvshinov-girl-cup.jpg"
lightpaper="$HOME/backgrounds/images/ilya-kuvshinov-anime-girl-with-umbrella-w9.jpg"

if [ "$(cat $HOME/.cache/wal/wal)" == "$darkpaper" ]; then
		mode=dark
else
		mode=light
fi

echo $mode

case "$mode" in 
"light")
	$HOME/.scripts/pywalchange.sh $darkpaper -wd -b "#110B19"
	;;
"dark")
	$HOME/.scripts/pywalchange.sh $lightpaper -wl
	;;
"*")
	notify-send "Incorrect argument"
	;;
esac
	
# wallpaperpath=$(cat $HOME/.cache/wal/wal)
# 
# if [ "$1" == "-l" ]; then
#         $HOME/.scripts/pywalchange.sh $wallpaperpath -l
# elif [ "$1" == "-wl" ]; then
#         $HOME/.scripts/pywalchange.sh $wallpaperpath -wl
# elif [ "$1" == "-d" ]; then
#         $HOME/.scripts/pywalchange.sh $wallpaperpath -d
# elif [ "$1" == "-wd" ]; then
#         $HOME/.scripts/pywalchange.sh $wallpaperpath -wd
# fi
