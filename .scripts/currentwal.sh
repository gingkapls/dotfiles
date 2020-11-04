#!/bin/sh

if [ "$1" == "-p" ]; then
          echo awk -F "'" 'FNR==2 {print $2}' $HOME/.fehbg
  else
          echo $(awk -F "'" 'FNR==2 {print $2}' $HOME/.fehbg)
fi
