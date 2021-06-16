function lf
	set location (fd . --max-depth 6 --exclude ".local/share/nvim/view | .local/share/nvim/backup" | fzf --height=10 --min-height=1 --preview-window="right:wrap" --color=16 --preview="sniper.sh {}" --bind "j:down,k:up")
	pushd $location >/dev/null 2>&1 || xdg-open $location; pushd (dirname $location 2>/dev/null )
end

