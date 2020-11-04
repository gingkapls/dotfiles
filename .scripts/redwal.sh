#!/bin/sh

date=12
if [[ "$(date +%e)" != "$date" ]]; then
	wget -O /tmp/wal.rss 'https://www.reddit.com/r/wallpapers/top/.rss' -t2
	sed -i "s/date=12*]*/date=$(date +%e)/" $HOME/.scripts/redwal.sh
else	
	echo "already ran once"
fi
walposts=$(cat /tmp/wal.rss | grep -Po 'href=\"\K[^"]+' | grep -v '/top/')
wallink=$(echo $walposts | xargs shuf -n1 -e) 
echo $wallink
wget -O /tmp/redwalpost.html $wallink -t2
linkname=$(cat /tmp/redwalpost.html | grep -Po 'href=\"\K[^"]+' | grep -m1 "1920.*1080" | sed 's/&#x27;/d/')
echo $linkname
filename=$(echo $linkname | awk -F '/' '{gsub(/-1920[^-]*[0]/,"",$0); print $NF}')
echo $filename
wget -O ~/backgrounds/$filename $linkname -t2
