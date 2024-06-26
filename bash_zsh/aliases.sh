# general
alias ..='cd ..'
alias ...="cd ../.."
alias cdc='cd ~/.dotfiles'  # to config directory
alias ll='ls --color=auto --group-directories-first -lh'
alias Find='sudo find / -name'  # global find by name
alias mkdir='mkdir -p'  # create nested dirs
alias cp='cp -i'  # ask before overwriting

# nvim
alias nvimd='nvim --cmd "lua vim.g.disable_plugins=true"'  # nvim without plugins but with config
alias nvim0='nvim --noplugin -u NONE'  # nvim without config

# nnn
alias N='sudo -E nnn -a -E -x -A -u -C'

# lazygit
alias g='lazygit'

# pacman
alias paci='sudo pacman -S'  # install
alias pacs='pacman -Ss'  # search
alias pacu='sudo pacman -Syu'  # update
alias pacr='sudo pacman -R'  # remove single
alias pacrr='sudo pacman -Rs'  # remove with dependencies
alias pacl='sudo pacman -Ql'  # list files installed by package
alias pacb="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"  # browse

# flatpak
alias flatu='flatpak uninstall --unused; flatpak update'
