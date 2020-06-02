#!/usr/bin/env bash

bind_key_reload() {
   tmux bind r source-file ~/.tmux.conf
}

default_settings() {
   tmux unbind C-b
   tmux set-option -g prefix C-a

   # help escape key to be quicker in vim
   tmux set -sg escape-time 0
}

vim_like_tmux() {
   tmux set-window-option -g mode-keys vi
   tmux set-option -g mode-keys vi
   tmux set-option -g status-keys vi

   # configure tmux copy/paste to act like vim
   tmux bind P paste-buffer


   # plugin setting
   tmux set-option -g @yank_with_mouse on
   tmux set-option -g @shell_mode 'vi'
   tmux set-option -g @yank_selection 'primary'
}

status_bar() {
   tmux set-option -g automatic-rename off
   tmux set-option -g pane-border-fg black
   tmux set-option -g pane-active-border-fg blue

   # do not rename window automatically
   tmux set-option -g allow-rename off

   tmux set mouse on


   #------------
   # tabs
   #------------
   tmux setw -g window-status-format "#[fg=white]#[bg=blue] #I #[bg=blue]#[fg=white] #W "
   tmux setw -g window-status-current-format "#[bg=brightmagenta]#[fg=white] *#I #[fg=white,bold]#[bg=cyan] [#W] "
   tmux setw -g window-status-content-attr bold,blink,reverse

   #------------
   # status bar
   #------------
   tmux set-option -g status-position bottom
   tmux set-option -g status-fg white
   tmux set-option -g status-bg blue
   tmux set-option -g status-left ''
   tmux set-option -g status-right-length 60
   tmux set-option -g status-right '♪ #(exec amixer get Master | egrep -o "[0-9]+%" | egrep -o "[0-9]*") | ♥ #(acpi | cut -d ',' -f 2) | %a %m-%d %H:%M'
}

main() {
   default_settings
   status_bar
   vim_like_tmux
   bind_key_reload
}
main
