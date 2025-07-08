# Styrmans Fish config.
# https://github.com/styrman-g/mydotfiles

### ADDING TO THE PATH
# First line removes the path; second line sets it. Witout the first line,
#your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $/.local/bin $fish_user_paths

### EXPORT ###
set fish_greeting						# Supresses fish intro message
set TERM "xterm-256color"				# Sets the terminal type
set EDITOR "nvim"						# Sets editor


### SET MANPAGER

## "nvim" as manpager
set -x MANPAGER "nvim +Man!"

## "less" as manpager
#set -x MANPAGER "less"

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### FUNCTIONS ###

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

### ALIASES ###
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim
alias vim='nvim'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'

# Merge Xresources
alias merge=`xrdb -merge ~/.Xresources´


### SETTING THE STARCHIP PROMPT ###
starchip init fish | source


### FZF ###
CTRL -t = fzf select
CTRL -r = fzf history
ALT -c = fzf cd
fzf --fish | source




