#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Terminal prompt 
PS1='\[\033[01;31m\][\u@\h \W]\[\033[00m\]\$ '
PS2='> '

# Helps with duplicated commands when "up-arrowing"
HISTCONTROL=ignoreboth

# Neovim compatibility (referenced in $HOME/.vim/vimrc/mappings.vim)
export ACTUALVIMRC=$HOME/.vimrc

# Tabbing multiple times shows results then starts completing results
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

# Source all bash configurations 
if [[ -d "$HOME/.config/bash/" ]]; then
    CONFIGS="$HOME/.config/bash/*.bashrc"
    for CONFIG in $CONFIGS
    do
        source $CONFIG
    done
fi

# Auto-generated appended configurations:
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
