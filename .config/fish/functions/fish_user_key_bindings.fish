## vim mode
set -g fish_user_key_bindings fish_vi_key_bindings
bind -M insert \cc kill-whole-line force-repaint

## bang bang
bind ! __history_previous_command
bind '$' __history_previous_command_arguments
