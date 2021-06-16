## Prompt
starship init fish | source 

source $HOME/.config/fish/fish_env

source $HOME/.config/fish/fish_aliases

source $HOME/.config/fish/fish_colors


#&& [ $XDG_VTNR -le 2 ]
if [ -z $DISPLAY ] 
	sh "$HOME/.cache/theme/shellcolors.sh"
	clear
	fortune
	set -x STARSHIP_CONFIG $HOME/.config/vconstarship.toml
	else
		set -x STARSHIP_CONFIG $HOME/.config/starship.toml
end
