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

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" 

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh" 

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit


### EXPORTS
export EDITOR="nvim"
export TERM="xterm-256color"                      # getting proper colors
export BROWSER="brave"

# Enable colors:
autoload -U colors && colors	# Load colors

# Automatically cd into typed directory
setopt autocd

# Completions styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


# Shell integrations
eval "$(fzf --zsh)"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt appendhistory
setopt sharehistory
setopt inc_append_history

### SET FZF DEFAULTS
export FZF_DEFAULT_OPTS="--layout=reverse --exact --border=bold --border=rounded --margin=3% --color=dark"

### "nvim" as manpager
export MANPAGER="nvim +Man!"

# A funktion for the Yazi file manager so it cd to where you are.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] ;
  then PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

if [ -d "$HOME/.config/emacs/bin" ] ;
    then PATH="$HOME/.config/emacs/bin/:$PATH"
fi


# MY ALIAS
# use Neovim
alias vim="nvim"
alias vi="nvim"

# Emacs alias
#alias emacs= "emacsclient -c -a 'emacs'"

# Adding color
alias ls="lsd -lah --group-dirs first"
alias grep="grep --color=auto"

# pacman package manager
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'


# Starchip-A cross-shell prompt
# To install Starchip run: curl -sS https://starship.rs/install.sh | sh
eval "$(starship init zsh)"

