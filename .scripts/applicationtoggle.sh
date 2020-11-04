#!/bin/sh

appname=$1
if (pgrep -x $appname); then
	wm_id=$(wmctrl -lx | awk -v pattern="$appname" '$appname ~ pattern { print $1 }') >/dev/null
	if [ "$2" == "-k" ]
		then pkill $appname -f 
		else
			bspc node -f $wm_id
	fi
else
	exec $appname &
fi
