#!/bin/sh

vid_link=$(wl-paste)
{
title=$(youtube-dl --force-ipv4 -e "$vid_link") 
notify-send "Playing $title at $1"
#quality=$1
} &

{
if [ "$1" == "360p" ]
	then
		mpv --no-cache '--ytdl-format=bestvideo[height=360]+bestaudio' --ytdl-raw-options=force-ipv4= "$vid_link" &

elif [ "$1" == "480p" ] 
	then
		mpv --no-cache '--ytdl-format=bestvideo[height=480]+bestaudio' --ytdl-raw-options=force-ipv4= "$vid_link" &

elif [ "$1" == "720p" ] 
	then
		mpv --no-cache '--ytdl-format=bestvideo[height=720][fps<=30]+bestaudio' --ytdl-raw-options=force-ipv4= "$vid_link" &

elif [ "$1" == "720p60" ] 
	then
		mpv --no-cache '--ytdl-format=bestvideo[height=720][fps>31]+bestaudio' --ytdl-raw-options=force-ipv4= "$vid_link" &

elif [ "$1" == "1080p" ] 
	then
		mpv --no-cache '--ytdl-format=bestvideo[height=1080][fps<=30]+bestaudio' --ytdl-raw-options=force-ipv4= "$vid_link" &

elif [ "$1" == "1080p60" ] 
	then
		mpv --no-cache '--ytdl-format=bestvideo[height=1080][fps>31]+bestaudio' --ytdl-raw-options=force-ipv4= "$vid_link" &
fi

} > /dev/null 2>&1 & # > /tmp/vid_qual 

#	[ $? -eq 2 ] && mpv --no-cache --ytdl-format=bestvideo+bestaudio --ytdl-raw-options=force-ipv4= "$vid_link" 

#while [ "$(wc -l /tmp/vid_qual | cut -b-2)" -lt 5 ]
#	do sleep 0
#done

# quality=$(printf "%dp %dfps" $(awk -F ')' '/fps/ { gsub(/[^x]*[x]|\(|\....|fps/,"",$3); print $3 }' /tmp/vid_qual))

# echo > /tmp/vid_qual

exit
