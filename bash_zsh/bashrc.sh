# add ~/.local/bin to PATH (mostly for remote sessions)
new_entry=$HOME/.local/bin  
case ":$PATH:" in
  *":$new_entry:"*) :;; # already there
  *) PATH="$new_entry:$PATH";; # or PATH="$PATH:$new_entry"
esac

source "$HOME/.dotfiles/bash_zsh/env_vars.sh"

# start fish only if:
#   - in interactive mode
#   - bash has execution command (to allow bash <command> without going to fish)
#   - parent process is not fish (this allows launch 'bash' when in fish)
#   - fish is available on the system
if [[ $- == *i* && -z ${BASH_EXECUTION_STRING} && $(command -v fish) && $(ps --no-header --pid=$PPID --format=comm) != "fish" ]]
then
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
    exec fish $LOGIN_OPTION
fi

# if fish is not started, then proceed with bash config

export HISTFILE="$HOME/.bash_history"  # history filepath
export HISTSIZE=10000  # maximum events for internal history
export HISTFILESIZE=20000  # maximum events for internal history
export HISTCONTROL=ignoreboth:erasedups  # dont write a duplicate event to the history file
export HISTIGNORE="ls:bg:fg:exit:reset:clear"
shopt -s autocd  # cd then entering just path
shopt -s histappend  # append to the history file, don't overwrite it
shopt -s histverify  # dont execute history selection

PS1='\e[32m\u@\h:\e[34m\W \e[31m>\e[0m '  # prompt

# set -o vi  # vi mode
# bind -m vi-command 'Control-l: clear-screen'
# bind -m vi-insert 'Control-l: clear-screen'

# edit command in text editor by pressing <C-e> in normal mode
# source "$HOME/.dotfiles/bash_zsh/edit_command.sh"
# bind -x '"\C-e": edit_command_line'

# fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# nn cd on quit
source "$HOME/.dotfiles/bash_zsh/nnn_cd_on_quit.sh"

# aliases
source "$HOME/.dotfiles/bash_zsh/aliases.sh"
