function zf
	set location (cat $HOME/.db | fzf --height=10 --preview-window="right:75" --min-height=1 --color=16 --preview="sniper.sh {}")
	pushd $location >/dev/null 2>&1 || pushd (dirname $location 2>/dev/null ) >/dev/null 2>&1
end

