function lf
	set location (fd . "$HOME" --max-depth 6 --exclude ".vim/view|.vim/backup" | fzf --height=10 --min-height=1 --preview-window="right:wrap" --color=16 --preview="sniper.sh {}")
	pushd $location >/dev/null 2>&1 || pushd (dirname $location 2>/dev/null ) >/dev/null 2>&1
end

