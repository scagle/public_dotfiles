#!/bin/bash
DOTCONFIG=$HOME/.config
if [[ ! -d "$DOTCONFIG" ]]; then
    mkdir "$DOTCONFIG"
    echo "$DOTCONFIG created"
fi
echo "Linking stow configurations"
stow --verbose -t ~ stow/
