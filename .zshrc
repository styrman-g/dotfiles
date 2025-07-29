# ____ _______   ______  __  __    _    _   _ ____  
#/ ___|_   _\ \ / /  _ \|  \/  |  / \  | \ | / ___| 
#\___ \ | |  \ V /| |_) | |\/| | / _ \ |  \| \___ \ 
# ___) || |   | | |  _ <| |  | |/ ___ \| |\  |___) |
#|____/ |_|   |_| |_| \_\_|  |_/_/   \_\_| \_|____/ 
#                                                   
# _________  _   _ ____   ____ 
#|__  / ___|| | | |  _ \ / ___|
#  / /\___ \| |_| | |_) | |    
# / /_ ___) |  _  |  _ <| |___ 
#/____|____/|_| |_|_| \_\\____|
#                              
# My zsh config file.
# https://github.com/styrman-g


# Enable colors:
autoload -U colors && colors	# Load colors

# Automatically cd into typed directory
setopt autocd

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt inc_append_history

### SET FZF DEFAULTS
export FZF_DEFAULT_OPTS="--layout=reverse --exact --border=bold --border=rounded --margin=3% --color=dark"

### "nvim" as manpager
export MANPAGER="nvim +Man!"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

### EXPORTS
export EDITOR=nvim
export TERM="xterm-256color"                      # getting proper colors

# A funktion for the Yazi file manager so it cd to where you are.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# MY ALIAS
# use Neovim
alias vim="nvim"
alias vi="nvim"

# Adding color
alias ls="lsd -lah --group-dirs first"
alias grep="grep --color=auto"


# Starchip-A cross-shell prompt
# To install Starchip run: curl -sS https://starship.rs/install.sh | sh
eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

