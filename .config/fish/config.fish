## Prompt
starship init fish | source 

source $HOME/.config/fish/fish_env

source $HOME/.config/fish/fish_aliases

source $HOME/.config/fish/fish_colors


#&& [ $XDG_VTNR -le 2 ]
if [ -z $DISPLAY ] 
	sh "$HOME/.cache/theme/shellcolors.sh"
	clear
	figlet -f standard (date +"%F %T") \nHi $USER! | lolcat
	fortune
	set -x STARSHIP_CONFIG $HOME/.config/vconstarship.toml
	else
		set -x STARSHIP_CONFIG $HOME/.config/starship.toml
end

## [ -z (pgrep tmux | head -n1) ] && tmux new -s default >/dev/null 2>&1 || tmux attach -t default >/dev/null 2>&1
