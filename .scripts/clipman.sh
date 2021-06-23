#!/bin/sh

clipboard_file="/tmp/.cliphistory"

case $1 in 
	"service")
		for pid in $(pidof -x clipman.sh); do
		    if [ $pid != $$ ]; then
		        kill -9 $pid
		    fi 
		done >/dev/null
		wl-paste -w wl-paste >> $clipboard_file
	;;
	"request")
		[ -z ! $(tac $clipboard_file | tail -n10 | wofi --show dmenu -x 1510 -y 0 -L 5 -W 400 -b -i) ] && wl-copy 
	;;
	*)
		false
	;;
esac



