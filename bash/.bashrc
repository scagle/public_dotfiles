#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Terminal prompt 
PS1='\[[01;31m\][\u@\h \W]\[[00m\]\$ '
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
export GHS_MULTI_PATH="/opt/ghs/multi_wd024.1"
alias fcgchecker='python3.6 $HGST_IPFW_WORKSPACE_ROOT/../scripts/python/fcgchecker/main.py'
alias iwyuhelper='python3.6 $HGST_IPFW_WORKSPACE_ROOT/../scripts/python/iwyuhelper/main.py'
alias build="./build.sh"
alias setup_environment="source ./setup_environment.sh"
alias setup="source ./setup.sh"
export NIAGARA_DIRECTORY="/usr/local/niagara"
export ARMDS5LIB="/usr/local/ARM_Compiler_5/lib"
export ARMDS5INC="/usr/local/ARM_Compiler_5/include"
export ARMDS5BIN="/usr/local/ARM_Compiler_5/bin64"
export GHS_LMHOST="salic01.hgst.com:2010"
export LM_LICENSE_FILE="7789@snjfwlic.sanjose.hgst.com:1700@rfwlic.rochester.hgst.com:10011@fwrepo.fujisawa.hgst.com"
