#!/bin/bash
DOTCONFIG=$HOME/.config
if [[ ! -d "$DOTCONFIG" ]]; then
    mkdir "$DOTCONFIG"
    echo "$DOTCONFIG created"
fi
echo "Linking stow configurations"
stow --verbose -t ~ stow/

if [[ $1 == "mac_common" ]]; then
    stow _mac alacritty bash_init rg scripts shell stow tmux_init vim_plus zsh_init
    (cd vim_plus && stow nvim_sub vimwiki_sub)
fi

if [[ $1 == "linux_common" ]]; then
    stow _linux alacritty bash_init rg scripts shell stow tmux_init vim_plus zsh_init
    (cd vim_plus && stow nvim_sub vimwiki_sub)
fi
