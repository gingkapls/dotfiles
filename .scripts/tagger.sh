#!/bin/sh

SONGLIST=()
while read song; do
	SONGLIST+=("$song")
done <<< $(find . -name '*opus' -o -name '*mp3' -o -name '*ogg' -o -name '*m4a' | sort -n | awk '{gsub(/.\//,"",$0); print $0}') 


## CREATING TAGS LIST & VARIABLES
TRACKID=()
TITLE=()
ARTIST=()
YEAR=()
ALBUM=$(echo $PWD | awk -F \/ '{print $NF}')
GENRE=$(echo $PWD | awk -F \/ '{print $5}')

if [ "$(find . -name '*png' -o -name '*jpg' -o -name '*jpeg' | wc -l)" == "1" ]
    then
		echo "cover art found"
    else
		url=$(xclip -out -selection clipboard)
		echo $url
		read -p "url ok? " -n 1 answer
		if [[ -z "$answer" || "$answer" == "y"  ]]
			then
				echo "okay" >/dev/null
			else
				read -p "enter genius url: " url
		fi
		sh $HOME/.scripts/getalbumthumb.sh $url
fi

thumbnail=$(find . -name '*png' -o -name '*jpg' -o -name '*jpeg' | cut -d/ -f2)

## FILLING UP TAG LISTS

for i in $(seq 0 ${#SONGLIST[@]});
do
		YEAR+=("$(eyeD3 "${SONGLIST[$i]}" | awk -F "" '/recording date:/ {print $17 $18 $19 $20}')")
		TRACKID+=("$(echo ${SONGLIST[$i]} | awk -F ' - ' '{print $1}')")
		TITLE+=("$(echo ${SONGLIST[$i]} |  awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]|ft[^*]*/,"",$NF); gsub(/^[ ]+|[ ]+$/, "", $NF); print $NF}')")
		ARTIST+=("$(echo ${SONGLIST[$i]} | awk -F ' - ' '{gsub(/.opus|.m4a|.mp3|.ogg|[(][^)]*[)]|[\[][^\]]*[\]]/,"",$2); gsub(/^[ ]+|[ ]+$/, "", $2); print $2}')")
done


if [ "$1" == "-n" ]
	then	
		for i in $(seq 0 ${#SONGLIST[@]}); do
			eyeD3 -a "${TRACKID[$i]}" -t "${TITLE[i]}" -A "$ALBUM" --recording-date "${YEAR[$i]}" -G "$GENRE" --add-image "$thumbnail:FRONT_COVER" "${SONGLIST[$i]}" >/dev/null 2>&1
		done

	else if [ "$1" == "-o" ]
	then
		for i in $(seq 0 ${#SONGLIST[@]}); do
			eyeD3 -a "${TITLE[$i]}" -t "${TITLE[$i]}" -A "$ALBUM" -n "${TRACKID[$i]}" --recording-date "${YEAR[$i]}" -G "$GENRE" --add-image "$thumbnail:FRONT_COVER" "${SONGLIST[$i]}" >/dev/null 2>&1
		done

	else if [ "$1" == "-no" ]
	then
		for i in $(seq 0 ${#SONGLIST[@]}); do
			eyeD3 -a "${TITLE[$i]}" -t "${ARTIST[$i]}" -A "$ALBUM" --recording-date "${YEAR[$i]}" -G "$GENRE" --add-image "$thumbnail:FRONT_COVER" "${SONGLIST[$i]}" >/dev/null 2>&1
		done

	else if [ "$1" == "-d" ]
	then
		for i in $(seq 0 ${#SONGLIST[@]}); do
			echo ${TRACKID[$i]}" "${TITLE[$i]}"  ${TITLE[$i]} ${ARTIST[$i]} ${YEAR[$i]}"
	done

	else
		for i in $(seq 0 ${#SONGLIST[@]}); do
			eyeD3 -a "${ARTIST[$i]}" -t "${TITLE[$i]}" -A "$ALBUM" -n "${TRACKID[$i]}" --recording-date "${YEAR[$i]}" -G "$GENRE" --add-image "$thumbnail:FRONT_COVER" "${SONGLIST[$i]}" >/dev/null 2>&1
		done

	fi
	fi
	fi
fi

echo "Tagging Done"

# echo ${TRACKID[@]}
# echo ${TITLE[@]}
# echo ${ARTIST[@]}
# echo ${YEAR[@]}
