#!/bin/sh

## Rotate output clockwise
orientation="$(swaymsg -t get_outputs | jq -r '.[0] | .transform')"

case $orientation in
    normal)
        swaymsg output - transform 270
    ;;
    270)
        swaymsg output - transform 180
    ;;
    180)
        swaymsg output - transform 90
    ;;
    90)
        swaymsg output - transform normal
    ;;
esac
