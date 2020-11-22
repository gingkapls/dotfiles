#!/bin/sh

wallpaperpath=$(cat $HOME/.cache/wal/wal)

if [ "$1" == "-l" ]; then
        $HOME/.scripts/pywalchange.sh $wallpaperpath -l
elif [ "$1" == "-wl" ]; then
        $HOME/.scripts/pywalchange.sh $wallpaperpath -wl
elif [ "$1" == "-d" ]; then
        $HOME/.scripts/pywalchange.sh $wallpaperpath -d
elif [ "$1" == "-wd" ]; then
        $HOME/.scripts/pywalchange.sh $wallpaperpath -wd
fi
