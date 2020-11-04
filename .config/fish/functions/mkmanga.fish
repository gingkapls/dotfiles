function mkmanga
	if [ -z "$argv[1]" ]
		for i in (ls -d $HOME/Mangas/*)
			addmanga.sh $i
		end
	else
		addmanga.sh "$argv"
	end
end


