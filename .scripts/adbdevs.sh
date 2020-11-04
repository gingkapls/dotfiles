#!/bin/sh

adb devices | while read line
		do
			if [ ! "$line" == "" ] && [ "$(echo $line | awk '{print $2}')" == "device" ]
			then
				device=$(echo $line | awk '{print $1}')
				adb -s $device $@
			fi
done
