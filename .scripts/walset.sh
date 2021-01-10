#!/bin/sh

mode=$1
wallpaper=$(ls -td $HOME/backgrounds/images/* | fzf --preview 'swaymsg output "*" bg {} fill' --preview-window="right:0" --color=16 --bind "j:down,k:up")

if [ ! -z $wallpaper ]; then
    cp $wallpaper ~/.cache/theme/wallpaper
    ffmpeg -y -i $wallpaper -vf "boxblur=6:6" ~/.cache/theme/blurredwallpaper.png >/dev/null 2>&1 &
    case $mode in
        dark)
            flavours generate dark $wallpaper
            gsettings set org.gnome.desktop.interface icon-theme 'McMojave-circle-Dark'
            gsettings set org.gnome.desktop.interface cursor-theme 'Oxygen_White'
        ;;
        light)
            flavours generate light $wallpaper
            gsettings set org.gnome.desktop.interface icon-theme 'McMojave-circle-Light'
            gsettings set org.gnome.desktop.interface cursor-theme 'Oxygen_Black'
        ;;
    esac
    flavours apply generated
else
    false
fi

nm-applet & disown
