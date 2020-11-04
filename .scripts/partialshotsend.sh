#!/bin/sh

sleep 0.2 && scrot -s /tmp/shot.png
kdeconnect-cli -n zenfone --share /tmp/shot.png
sleep 1
notify-send -I /tmp/shot.png "Screenshot Sent to Device"
sleep 1
rm /tmp/shot.png

