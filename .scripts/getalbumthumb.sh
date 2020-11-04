#!/bin/sh

url=$1
curl -L "$url" > /tmp/albumhtml
albumurl=$(grep -Pom1 'srcset="\K[^ ]+' '/tmp/albumhtml')
wget -O 'cover.jpg' "$albumurl"

# cat 285756 | grep -Pom1 'srcset="\K[^ ]+'

# cat source | grep -Po 'album_cover_arts/\K[^&]+'

# cat source | grep -Po 'cover_art-image" src="\K[^"]+'
