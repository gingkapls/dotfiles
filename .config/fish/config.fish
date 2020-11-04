function  mergepdf
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=$argv[-1] $argv[1..-2]
end

## Prompt
starship init fish | source 

source $HOME/.config/fish/fish_env
source $HOME/.config/fish/fish_aliases

if [ -z $DISPLAY ] && [ $XDG_VTNR -le 2 ]
	wal -R 
	figlet (date +"%F %T") | lolcat
	figlet "Hi $USER !" | lolcat
	fortune
end

cat ~/.cache/wal/sequences &  

## [ -z (pgrep tmux | head -n1) ] && tmux new -s default >/dev/null 2>&1 || tmux attach -t default >/dev/null 2>&1
