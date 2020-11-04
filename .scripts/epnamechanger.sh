#!/bin/sh

ext=$1
epname=$(echo $PWD | awk -F '/' '{ print $NF }')
perl-rename 's/\D//g' *mkv  ## extract digits
perl-rename 's/\d+/sprintf("%04d",$&)/e' * ## add leading zeroes
perl-rename 's/(.*\d)$/'"$epname"' EP - $1.'"$ext"'/g' * ## rename to show name
