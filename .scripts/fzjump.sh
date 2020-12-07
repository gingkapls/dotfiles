#!/bin/env bash

mode=$1

case $mode in
		finder)
			file="$(fd . $2 --max-depth 5 --exclude ".vim/view|.vim/backup" | fzf --height=10 --min-height=1 --color=16 --preview="sniper.sh {}" --preview-window=":wrap")"
		;;
		locater)
				file="$(cat $HOME/.db | fzf --height=10 --min-height=1 --color=16 --preview="sniper.sh {}" --preview-window=":wrap")"
		;;
esac

#echo -e "\r$file"
dir="$(dirname $file)"
pushd $file 2>/dev/null || pushd $dir 2>/dev/null
