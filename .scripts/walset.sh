#!/bin/sh

mode=$1
wallpaper=$(ls -td $HOME/backgrounds/images/* | fzf --preview 'swaymsg output "*" bg {} fill' --preview-window="right:0" --color=16)

if [ ! -z $wallpaper ]; then
    cp $wallpaper ~/.cache/wallpaper
    ffmpeg -y -i $wallpaper -vf "boxblur=6:6" ~/.cache/blurredwallpaper.png >/dev/null & disown &
    case $mode in
        dark)
            flavours generate dark $wallpaper
            gsettings set org.gnome.desktop.interface icon-theme 'McMojave-circle-Dark'
        ;;
        light)
            flavours generate light $wallpaper
            gsettings set org.gnome.desktop.interface icon-theme 'McMojave-circle-Light'
        ;;
    esac
    flavours apply generated
else
    false
fi

pkill nm-applet
nm-applet & disown
