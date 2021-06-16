#!/bin/sh

pushd $HOME/Pictures/Wallpapers/
mode=$1

if [ -z $2 ]; then
	wallpaper=$(ls -td * | fzf --preview "flavours generate $mode {} && flavours apply -l generated & swaymsg output '*' bg $HOME/Pictures/Wallpapers/{} fill & flavours info generated" --color=16 --bind "j:down,k:up") 
else
	wallpaper=$2
fi

if [ ! -z $wallpaper ]; then
    cp $wallpaper ~/.cache/theme/wallpaper -f
    case $mode in
        dark)
            flavours generate dark $wallpaper
            gsettings set org.gnome.desktop.interface icon-theme 'McMojave-circle-Dark'
            gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors-light'
        ;;
        light)
            flavours generate light $wallpaper
            gsettings set org.gnome.desktop.interface icon-theme 'McMojave-circle-Light'
            gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors-dark'
        ;;
    esac
    flavours apply generated
else
    false
fi

nm-applet & disown
ffmpeg -y -i $wallpaper -vf "boxblur=6:6" ~/.cache/theme/blurredwallpaper.png >/dev/null 2>&1
