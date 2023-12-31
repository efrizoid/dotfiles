set -g fish_greeting  # disable greeting
function fish_mode_prompt; end  # disable default vi mode indicator

# prompt
function fish_prompt
    set_color green
    echo -n (whoami)
    echo -n '@'
    echo -n (hostname | cut -d '.' -f 1)
    echo -n ':'
    set_color blue
    echo -n (prompt_pwd)
    set_color red --bold
    echo -n ' > '

    # # vi mode indicator
    # set_color red --bold
    # switch $fish_bind_mode
    #     case insert
    #         echo -n ' > '
    #     case visual
    #         echo -n ' V '
    #     case replace
    #         echo -n ' R '
    #     case replace_one
    #         echo -n ' r '
    #     case default
    #         echo -n ' N '
    # end

    set_color normal
end

# fzf and keybindings
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
function fish_user_key_bindings
    bind -M insert \cf forward-char
    fish_default_key_bindings
    # fish_vi_key_bindings  # vi bindings
    fzf_key_bindings
end

# nnn cd on quit
function n --wraps n --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
        echo "nnn is already running"
        return
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "-x" from both lines below,
    # without changing the paths.
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command function allows one to alias this function to `nnn` without
    # making an infinitely recursive alias
    command nnn -a -E -x -A -u -C $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

# aliases shared with bash
source $HOME/.dotfiles/bash_zsh/aliases.sh

# emacs vterm integration
if test "$INSIDE_EMACS" = 'vterm'; and test -n "$EMACS_VTERM_PATH"; and test -f "$EMACS_VTERM_PATH/etc/emacs-vterm.fish"
    source $EMACS_VTERM_PATH/etc/emacs-vterm.fish
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/eimantas/miniconda3/bin/conda
    eval /home/eimantas/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/eimantas/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/eimantas/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/eimantas/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

