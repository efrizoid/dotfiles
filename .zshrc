# zsh
export HISTFILE="$ZDOTDIR/.zhistory"  # history filepath
export HISTSIZE=10000  # maximum events for internal history
export SAVEHIST=10000  # maximum events in history file
setopt HIST_SAVE_NO_DUPS  # dont write a duplicate event to the history file
autoload -U compinit; compinit  # initialize completion
_comp_options+=(globdots)  # complete hidden files
PROMPT="%n@%m:%~ > "

# nvim
export EDITOR="nvim"
export VISUAL="nvim"
alias nvimd='nvim --noplugin -u NONE'  # launch nvim without any plugin or config

# general aliases
alias ls='ls -lah --color=auto'

# pacman aliases
alias paci='sudo pacman -S'  # install
alias pacs='sudo pacman -Ss'  # search
alias pacu='sudo pacman -Syu'  # update
alias pacr='sudo pacman -R'  # remove single
alias pacrr='sudo pacman -Rs'  # remove with dependencies
