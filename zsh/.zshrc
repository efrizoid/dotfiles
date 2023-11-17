# zsh
export SHELL="/bin/zsh"
export ZDOTDIR="$HOME/.dotfiles/zsh"
export HISTFILE="$HOME/.zhistory"  # history filepath
export HISTSIZE=10000  # maximum events for internal history
export SAVEHIST=10000  # maximum events in history file
setopt HIST_SAVE_NO_DUPS  # dont write a duplicate event to the history file
setopt AUTO_CD  # do cd if just path without command is given
unsetopt BEEP  # disable beeping
PROMPT="%F{green}%n%B@%b%m:%f%F{blue}%~%f %F{red}>%f "

bindkey -v  # vi mode
export KEYTIMEOUT=1  # faster switching between vi modes
source "$ZDOTDIR/vi_mode_improvements.zsh"  # change cursor in insert and normal modes

# edit command in nvim by pressing V in normal mode
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

zstyle ':completion::complete:*' gain-privileges 1  # allow completion when using sudo
autoload -U compinit; compinit  # initialize completion
_comp_options+=(globdots)  # complete hidden files

setopt AUTO_PUSHD  # push the current directory visited on the stack
setopt PUSHD_IGNORE_DUPS  # do not store duplicates in the stack
setopt PUSHD_SILENT  # do not print the directory stack after pushd or popd
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index  # alias for jumping in dir stack

# XDG Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# nvim
export EDITOR="nvim"
export VISUAL="nvim"
alias nvimd='nvim --noplugin -u NONE'  # launch nvim without any plugin or config

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# nnn
alias N='sudo -E nnn -a -E -x -A -u'
export LC_COLLATE="C"
export NNN_BMS="d:$HOME/Documents;D:$HOME/Downloads;p:$HOME/Dropbox/phd"
export NNN_PLUG="d:diffs;f:fzcd;o:fzopen;"
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export NNN_TRASH=1  # use trash cli
source "$ZDOTDIR/nnn_cd_on_quit.zsh"  # change cursor in insert and normal modes

# general aliases
alias ls='ls --color=auto --group-directories-first -lh'
alias Find='sudo find / -name'

# pacman aliases
alias paci='sudo pacman -S'  # install
alias pacs='pacman -Ss'  # search
alias pacu='sudo pacman -Syu'  # update
alias pacr='sudo pacman -R'  # remove single
alias pacrr='sudo pacman -Rs'  # remove with dependencies
alias pacb="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"  # browse
