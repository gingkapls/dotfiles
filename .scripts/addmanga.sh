#!/bin/bash

pushd "$1"
series="$(pwd | awk -F "/" '{print $NF}')"

while read -r manga; do 
	name="$(echo $manga | perl -pe 's/Vol\..\d\s//;' -pe 's/Ch.\d*\K.+//g;' -pe 's/\d+/sprintf("%02d",$&)/ge;' -pe 's/(.*)/\U$1/g')" ## Cleaning up the chapter name
#	echo -ne "\r $PWD/$manga"
	echo -ne "\r $series $name"
	 while read page; do 
	 	aspect="$(file "$page" | perl -pe "s/\d.*\Kx.\K\d*\K.*//g;" -pe "s/.*,\s/scale=4; /g;" -pe "s/x/ \/ /" | bc)"
	 	if [ "$(echo "$aspect <= 1" | bc)" -eq 1 ]; then ## Checking the aspect ratio for cover image
			#echo $page
			#echo $aspect
			icon=$page
 			break
 		fi
	done < <(fd "jpg|png|jpeg" "$PWD/$manga" -t f)
echo -e "[Desktop Entry]
Name="$series $name"
Exec=imv \"$PWD/$manga/\"* -s crop && swaymsg -t command workspace current
Icon=$icon
Type=Application" > "$HOME/Mangas/.Desktops/$manga.desktop"
done < <(fd . -t d)
popd

