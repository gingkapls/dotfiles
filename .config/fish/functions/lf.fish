function lf
	set location (fd . "$HOME" --max-depth 6 --exclude ".vim" | fzf --height=10 --min-height=1 --preview-window="right:75" --color=16 --preview="sniper.sh {}")
	pushd $location >/dev/null 2>&1 || pushd (dirname $location 2>/dev/null ) >/dev/null 2>&1
end

