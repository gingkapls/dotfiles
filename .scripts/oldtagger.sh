#!/bin/sh

album=$(echo $PWD | awk -F \/ '{print $NF}')
## if [ "$(find . -name '*png' -o -name '*jpg' -o -name '*jpeg' | wc -l)" == "1" ]
##     then
## 		echo "cover art found"
##     else
## 		url=$(xclip -out -selection clpboard)
## 		echo $url
## 		read -p "url ok? " -n 1 answer
## 		if [[ -z "$answer" || "$answer" == "y"  ]]
## 			then
## 				echo "okay" >> /dev/null
## 			else
## 				read -p "enter genius url: " url
## 		fi
## 		sh $HOME/.scripts/getalbumthumb.sh $url
## fi
## 
## thumbnail=$(find . -name '*png' -o -name '*jpg' -o -name '*jpeg' | cut -d/ -f2)
## 
if [ "$1" == "-o" ] 
	then
		(IFS='
		'
        find . -name '*opus' -o -name '*mp3' -o -name '*ogg' -o -name '*m4a' | awk '{gsub(/.\//,"",$0); print $0}' | while read song; do 
#        year=$(eyeD3 $song | awk -F "" '/recording date:/ {print $17 $18 $19 $20}')
			number=$(echo $song | awk -F ' - ' '{print $1}')
			title=$(echo $song |  awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]|ft[^*]*/,"",$2); gsub(/^[ ]+|[ ]+$/, "", $2); print $2}')
			artist=$(echo $song | awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]/,"",$NF); gsub(/^[ ]+|[ ]+$/, "", $NF); print $NF}')
	            id3tag -a "$artist" -s "$title" -A "$album" -t "$number" $song # --recording-date "$year" --add-image "$thumbnail:FRONT_COVER" 
		done)
	else if [ "$1" == "-no" ]
	then
		(IFS='
		'
        find . -name '*opus' -o -name '*mp3' -o -name '*ogg' -o -name '*m4a' | awk '{gsub(/.\//,"",$0); print $0}' | while read song; do 
#        year=$(eyeD3 $song | awk -F "" '/recording date:/ {print $17 $18 $19 $20}')
		title=$(echo $song |  awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]|ft[^*]*/,"",$1); gsub(/^[ ]+|[ ]+$/, "", $1); print $1}')
		artist=$(echo $song | awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]/,"",$NF); gsub(/^[ ]+|[ ]+$/, "", $NF); print $NF}')
	        id3tag -a "$artist" -s "$title" -A "$album" $song #--recording-date "$year" --add-image "$thumbnail:FRONT_COVER"
		done)

	else if [ "$1" == "-n" ]
	then
		(IFS='
		'
        find . -name '*opus' -o -name '*mp3' -o -name '*ogg' -o -name '*m4a' | awk '{gsub(/.\//,"",$0); print $0}' | while read song; do 
#        year=$(eyeD3 $song | awk -F "" '/recording date:/ {print $17 $18 $19 $20}')
		title=$(echo $song |  awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]|ft[^*]*/,"",$NF); gsub(/^[ ]+|[ ]+$/, "", $NF); print $NF}')
		artist=$(echo $song | awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]/,"",$1); gsub(/^[ ]+|[ ]+$/, "", $1); print $1}')
	        id3tag -a "$artist" -s "$title" -A "$album" $song #--recording-date "$year" --add-image "$thumbnail:FRONT_COVER"
		done)
	else 
		(IFS='
		'
        find . -name '*opus' -o -name '*mp3' -o -name '*ogg' -o -name '*m4a' | awk '{gsub(/.\//,"",$0); print $0}' | while read song; do 
#        year=$(eyeD3 $song | awk -F "" '/recording date:/ {print $17 $18 $19 $20}')
		number=$(echo $song | awk -F ' - ' '{print $1}')
        title=$(echo $song |  awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]|ft[^*]*/,"",$NF); gsub(/^[ ]+|[ ]+$/, "", $NF); print $NF}')
		artist=$(echo $song | awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]/,"",$2); gsub(/^[ ]+|[ ]+$/, "", $2); print $2}')
	        id3tag -a "$artist" -s "$title" -A "$album" -t "$number"  $song  # --recording-date "$year" --add-image "$thumbnail:FRONT_COVER"
		done)
	fi
	fi
fi

