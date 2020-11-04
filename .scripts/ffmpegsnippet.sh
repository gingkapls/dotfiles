
## quality 2.95x compression
## ffmpeg -hwaccel auto -i <INPUT_FILE> -c:v hevc_nvenc -map 0:v -map 0:a -rc constqp -qp 28 <OUTPUT_FILE>

## size 5.6x compression
## ffmpeg -hwaccel auto -i <INPUT_FILE> -c:v hevc_nvenc -map 0:v -map 0:a -crf 51 <OUTPUT_FILE>

## 1.5x vol
## ffmpeg -hwaccel auto -i <INPUT_FILE> -c:v hevc_nvenc -map 0:v -map 0:a -crf 51 -af "volume=1.5" <OUTPUT_FILE>
## ffmpeg -hwaccel auto -i <INPUT_FILE> -c:v hevc_nvenc -map 0:v -map 0:a -crf 51 -filter:a "volume=1.5" <OUTPUT_FILE>

ffmpeg -hwaccel auto -i <INPUT_FILE> -map 0:v -map 0:a -vf scale="-1:480" -af "volume=1.5" <OUTPUT_FILE>
