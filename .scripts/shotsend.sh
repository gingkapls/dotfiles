#!/bin/sh

scrot /tmp/shot.png
kdeconnect-cli -n zenfone --share /tmp/shot.png
sleep 1
notify-send -I /tmp/shot.png "Screenshot Sent to Device"
sleep 1
rm /tmp/shot.png

