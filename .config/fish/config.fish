## Prompt
starship init fish | source 

source $HOME/.config/fish/fish_env

source $HOME/.config/fish/fish_aliases

source $HOME/.config/fish/fish_colors

if [ -z $DISPLAY ] && [ $XDG_VTNR -le 2 ]
	figlet (date +"%F %T") | lolcat
	figlet "Hi $USER !" | lolcat
	fortune
end

## [ -z (pgrep tmux | head -n1) ] && tmux new -s default >/dev/null 2>&1 || tmux attach -t default >/dev/null 2>&1
