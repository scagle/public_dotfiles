#!/bin/bash

# Insert source command into ~/.bashrc and ~/.bash_profile
COMMAND_BASHRC='source $HOME/.config/bash/bash.rc'
COMMAND_BASHPROFILE='source $HOME/.config/bash/bash.profile'
if [[ -z $(grep "$COMMAND_BASHRC" $HOME/.bashrc) ]]; then 
    echo "$COMMAND_BASHRC" >> $HOME/.bashrc
else
    echo "Already Initialized ~/.bashrc"
fi

if [[ -z $(grep "$COMMAND_BASHPROFILE" $HOME/.bash_profile) ]]; then 
    echo "$COMMAND_BASHPROFILE" >> $HOME/.bash_profile 
else
    echo "Already Initialized ~/.bash_profile"
fi
