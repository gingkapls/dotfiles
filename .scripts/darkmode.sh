#!/bin/sh

case $1 in
	"dark")
		flavours apply "$(flavours current)"
		gsettings set org.gnome.desktop.interface icon-theme 'McMojve-circle-Dark'
		gsettings set org.gnome.desktop.interface gtk-theme 'dummy'
		gsettings set org.gnome.desktop.interface gtk-theme 'FlatColor'
	;;
	"light")
		flavours apply "$(flavours current)"
		gsettings set org.gnome.desktop.interface icon-theme 'McMojve-circle-Light'
		gsettings set org.gnome.desktop.interface gtk-theme 'dummy'
		gsettings set org.gnome.desktop.interface gtk-theme 'FlatColor'
	;;
esac

