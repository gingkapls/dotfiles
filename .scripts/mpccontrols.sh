#!/bin/sh

progress=$(mpc | awk 'FNR==2 {gsub(/[()%]/,"",$0); print $NF}')
#echo $progress
echo $1

case "$1:$progress" in
		forward:*)
			mpc next
			;;
		backward:0|1)
			mpc prev
			;;
		backward:*)
			mpc seek "-100%"
			echo seeking
			;;
esac
