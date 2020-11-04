#!/bin/sh

if [ $1 == -sf ]; then
        sleep 0.2 && scrot -sf '$HOME/Pictures/shots/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f' -e 'notify-send --hints=string:x-dunst-stack-tag:scrot -i $f \"Screenshot Captured\"';

elif [ $1 == -u ]; then
        sleep 0.2 && scrot -u '$HOME/Pictures/shots/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f' -e 'notify-send --hints=string:x-dunst-stack-tag:scrot -i $f \"Screenshot Captured\"';

else
        sleep 0.2 && scrot '$HOME/Pictures/shots/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f' -e 'notify-send --hints=string:x-dunst-stack-tag:scrot -i $f \"Screenshot Captured\"';
fi
