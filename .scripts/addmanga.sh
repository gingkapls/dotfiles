#!/bin/bash

pushd "$1"
series="$(pwd | awk -F "/" '{print $NF}')"

while read -r manga; do 
	name="$(echo $manga | perl -pe 's/Vol\..\d\s//;' -pe 's/Ch.\d*\K.+//g;' -pe 's/\d+/sprintf("%02d",$&)/ge;' -pe 's/(.*)/\U$1/g')"
	echo $PWD/$manga
	echo $series $name
	 while read page; do 
	 	aspect="$(file "$page" | perl -pe "s/\d.*\Kx.\K\d*\K.*//g;" -pe "s/.*,\s/scale=4; /g;" -pe "s/x/ \/ /" | bc)"
	 	if [ "$(echo "$aspect <= 1" | bc)" -eq 1 ]; then
			#echo $page
			#echo $aspect
			icon=$page
 			break
 		fi
	done < <(fd "jpg|png|jpeg" "$PWD/$manga" -t f)
echo -e "[Desktop Entry]
Name="$series $name"
Exec=imv \"$PWD/$manga/\"* && swaymsg -t command workspace current
Icon=$icon
Type=Application" > "$HOME/Mangas/.Desktops/$manga.desktop"
done < <(fd . -t d)
popd

## for page in $(fd "jpg|png|jpeg" .); do 
## 	aspect="$(file $i | perl -pe "s/\d.*\Kx.\K\d*\K.*//g;" -pe "s/.*,\s/scale=4; /g;" -pe "s/x/ \/ /" | bc)"
## 	if [ "$(echo "$aspect <= 1" | bc)" -eq 1 ]; then
## 		break
## 	fi
## 		break
## done

