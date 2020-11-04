#!/bin/sh
# open an executable in floating mode

setsid bspc rule -a \* -o state=floating && $@ &>/dev/null < /dev/null &
