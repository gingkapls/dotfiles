function 1dl
	set output_format "%(title)s.%(ext)s"
	if test $argv[-1] = "-x" 
		youtube-dl -x $argv[1] -o $output_format --audio-format mp3 --no-playlist --no-cache-dir --embed-thumbnail --add-metadata -4
	else if test $argv[-1] = "-m"
		youtube-dl -f bestvideo+bestaudio $argv[1] -o $output_format --audio-format mp3 --no-playlist --no-cache-dir --embed-thumbnail --add-metadata -4
	else
		youtube-dl -F $argv[1]
	read num
		if test $num = ""
			set num bestvideo+bestaudio
		end
	youtube-dl -f $num $argv[1] -o $output_format --no-playlist --no-cache-dir --add-metadata --geo-bypass --embed-thumbnail -4
	end
#	set filename (youtube-dl --get-filename -o $output_format $argv[1])
#	echo $filename
end

