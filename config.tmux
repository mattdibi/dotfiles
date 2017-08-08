set -g default-terminal "screen-256color"

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
bind-key -T copy-mode-vi C-h select-pane -L
bind-key -T copy-mode-vi C-j select-pane -D
bind-key -T copy-mode-vi C-k select-pane -U
bind-key -T copy-mode-vi C-l select-pane -R
bind-key -T copy-mode-vi C-\ select-pane -l

# Status bar theme
set -g status-bg 'colour235'
set -g message-command-fg 'colour222'
set -g status-justify 'centre'
set -g status-left-length '100'
set -g status 'on'
set -g pane-active-border-fg 'colour154'
set -g message-bg 'colour238'
set -g status-right-length '100'
set -g status-right-attr 'none'
set -g message-fg 'colour222'
set -g message-command-bg 'colour238'
set -g status-attr 'none'
set -g status-utf8 'on'
set -g pane-border-fg 'colour238'
set -g status-left-attr 'none'
setw -g window-status-fg 'colour121'
setw -g window-status-attr 'none'
setw -g window-status-activity-bg 'colour235'
setw -g window-status-activity-attr 'none'
setw -g window-status-activity-fg 'colour154'
setw -g window-status-separator ''
setw -g window-status-bg 'colour235'
set -g status-left '#[fg=colour232,bg=colour154] #S #[fg=colour154,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour222,bg=colour238] #W #[fg=colour238,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour121,bg=colour235] #(whoami)  #(uptime  | cut -d " " -f 1,2,3) #[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]'
set -g status-right '#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour121,bg=colour235] %r  %a  %Y #[fg=colour238,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour222,bg=colour238] #H #[fg=colour154,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour232,bg=colour154] #(rainbarf --battery --remaining --no-rgb) '
setw -g window-status-format '#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[default] #I  #W #[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]'
setw -g window-status-current-format '#[fg=colour235,bg=colour238,nobold,nounderscore,noitalics]#[fg=colour222,bg=colour238] #I  #W  #F #[fg=colour238,bg=colour235,nobold,nounderscore,noitalics]'
