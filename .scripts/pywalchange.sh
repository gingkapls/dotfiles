#!/bin/sh

filepath=$1
theme=""
filename=$(echo $filepath | awk -F '/' '{print $NF}')

if [ "$2" == "-d" ]
	then	
		sed -i 's/Light/Dark/g' $HOME/.config/gtk-3.0/settings.ini $HOME/.gtkrc-2.0 $HOME/.config/qt5ct/qt5ct.conf 
		sed -i 's/simple/darker/g' HOME/.config/qt5ct/qt5ct.conf 
		sed -i -e 's/colors.foreground-special/colors.primary/g' -e 's/colors.background-Light/colors.background-Dark/g' $HOME/.config/wal -q/templates/polyconfig
		sed -i -e 's/argb:FF/argb:25/g' $HOME/.config/wal -q/templates/dmenu.rasi
		wal -q -i $filepath -a 85 --saturate 0.6
		theme="Dark"
		sleep 0.1 
		gsettings set org.gnome.desktop.interface gtk-theme "Kimi-Dark"

	else if [ "$2" == "-wd" ]
	then	
		sed -i 's/Light/Dark/g' $HOME/.config/gtk-3.0/settings.ini $HOME/.gtkrc-2.0 
		sed -i 's/simple/darker/g' HOME/.config/qt5ct/qt5ct.conf 
		sed -i "4s/blurred.*/blurred\/$filename/" $HOME/.config/wal -q/templates/swaylockconfig
		ffmpeg -i $filepath -n -vf "gblur=10:1" ~/backgrounds/blurred/$filename 
#		wal -q -i ~/backgrounds/blurred/$filename --saturate 0.6 -e
		wal -q -i "$filepath" --saturate 0.6 -e $3 $4
#		swaymsg -t command output "*" "$HOME/backgrounds/blurred/$filename" fill
		swaymsg -t command output "*" "$filepath" fill
		theme="Dark"
		pkill mako
		mako & disown
		sleep 0.1 
		gsettings set org.gnome.desktop.interface gtk-theme "Kimi-Dark"
		gsettings set org.gnome.desktop.interface icon-theme "McMojave-circle-Dark"

	else if [ "$2" == "-wl" ]
	then
		sed -i 's/Dark/Light/g' $HOME/.config/gtk-3.0/settings.ini $HOME/.gtkrc-2.0
		sed -i 's/darker/simple/g' HOME/.config/qt5ct/qt5ct.conf 
		sed -i "4s/blurred.*/blurred\/$filename/" $HOME/.config/wal -q/templates/swaylockconfig
		ffmpeg -i $filepath -n -vf "gblur=10:1" ~/backgrounds/blurred/$filename 
#		wal -q -l -i ~/backgrounds/blurred/$filename -a 85 --saturate 0.6 -e
		wal -q -l -i "$filepath" -a 85 --saturate 0.6 -e $3 $4
#		swaymsg -t command output "*" "$HOME/backgrounds/blurred/$filename" fill
		swaymsg -t command output "*" "$filepath" fill
		theme="Light"
		pkill mako
		mako & disown
		sleep 0.1 
		gsettings set org.gnome.desktop.interface gtk-theme "Kimi-Light"
		gsettings set org.gnome.desktop.interface icon-theme "McMojave-circle-Light"

	else if [ "$2" == "-l" ]
	then
		sed -i 's/Dark/Light/g' $HOME/.config/gtk-3.0/settings.ini $HOME/.gtkrc-2.0 
		sed -i 's/darker/simple/g' HOME/.config/qt5ct/qt5ct.conf 
		sed -i -e 's/colors.primary/colors.foreground-special/g' -e 's/colors.background-Dark/colors.background-Light/g'  $HOME/.config/wal -q/templates/polyconfig
		sed -i -e 's/argb:25/argb:FF/g' $HOME/.config/wal -q/templates/dmenu.rasi
		wal -q -i $filepath -l -a 90 --saturate 0.4
		theme="Light"
		sleep 0.1 
		gsettings set org.gnome.desktop.interface gtk-theme "Kimi-Light"
fi
fi
fi
fi

sh $HOME/.scripts/alacrittyexport.sh
pkill imv
#cp $HOME/backgrounds/blurred/$filename $HOME/.cache/wal -q/wal -qlpaper
swaymsg -t command reload &
pkill nm-applet
pkill waybar
waybar & disown
nm-applet --indicator & disown
pkill mpd-notificatio
mpd-notification & disown
notify-send "${theme} Theme Applied"

## pkill kdeconnect-indi
# kdeconnect-indicator & disown
## betterlockscreen -u $filepath

