#!/bin/env bash

terminal_width="$(tput cols)"
upperline_char="─"
lowerline_char="▁"
new_width=$((terminal_width/4))

for (( i = 0; i < $terminal_width; i++ )); do
   upline+=$upperline_char 
   lowline+=$lowerline_char
   space+=" "
done

text="${1:-$(</dev/stdin)}"

#echo -e "$space" $upline "$space""\n $space$text$space\n""$space" $lowline "$space"

echo $upline
while IFS= read -r line
do
#       echo "$space$line$space"
       echo "$line"
   done < <(printf '%s\n' "$text")

echo $lowline
