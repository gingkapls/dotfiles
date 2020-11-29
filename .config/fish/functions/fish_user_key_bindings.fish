## vim mode

function fish_user_key_bindings
	fish_default_key_bindings -M insert
	fish_vi_key_bindings --no-erase insert
	bind -M insert \cc kill-whole-line force-repaint
	bind -M insert '!' __history_previous_command
	bind -M insert '$' __history_previous_command_arguments
	bind -M insert -k btab forward-word
end
