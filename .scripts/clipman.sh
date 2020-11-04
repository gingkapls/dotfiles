#!/bin/sh
wl-paste -w printf '%s:\n\n %s\n %s\n' $(date +'%F %H:%M:%S') $(wl-paste) $(wl-paste -p) >> $HOME/.cliphistory
