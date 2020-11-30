#!/bin/sh

pfile="${1:-$(</dev/stdin)}"

filetype="$(file -- "$pfile" | rg "directory|text" -o)"

case "$filetype" in 
		"text")
			bat --theme=Nord -nf --line-range ":$FZF_PREVIEW_LINES" "$pfile" -m "vimrc:VimL"
			;;
		"directory")
			tree -FCL "$FZF_PREVIEW_COLUMNS" "$pfile"
			;;
		"PDF")
			pdftotext "$pfile" - | bat --theme=Nord -nf --line-range ":$FZF_PREVIEW_LINES" 
			;;
esac
