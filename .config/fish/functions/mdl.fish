function mdl
	set output_format "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"
	set output_format_mom "%(title)s.%(ext)s"
	if test $argv[-1] = "-x"
		youtube-dl -x $argv[1] --yes-playlist --playlist-items $argv[2..-2] -o $output_format --audio-format mp3 --no-cache-dir --embed-thumbnail --add-metadata -4
	else if test $argv[-1] = "-m"
		youtube-dl -f bestvideo+bestaudio $argv[1] --yes-playlist --playlist-items $argv[2..-2] -o $output_format_mom --audio-format mp3 --no-cache-dir --add-metadata -R 20  -4
		else if test $argv[-1] = "-b"
	youtube-dl -f bestvideo+bestaudio $argv[1] --yes-playlist --playlist-items $argv[2..-2] -o $output_format --no-cache-dir --add-metadata --write-sub --sub-format=en -4
	else
	read num
		if test $num = ""
			set num bestvideo+bestaudio
		end
	youtube-dl -f $num $argv[1] --yes-playlist --playlist-items $argv[2..-1] -o $output_format --no-cache-dir --add-metadata --write-sub --sub-format=en -4
	end
end

