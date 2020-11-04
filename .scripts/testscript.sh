#!/bin/sh

name=$(zenity --entry --text "enter a name plz")
perl-rename "s/\.(mkv|mp4)/ $name $&/" $(ls $HOME/Videos/test/ -t | head -n1) -n
