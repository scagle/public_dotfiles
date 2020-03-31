#!/bin/bash
DOTCONFIG=$HOME/.config
if [[ ! -d "$DOTCONFIG" ]]; then
    mkdir "$DOTCONFIG"
    echo "$DOTCONFIG created"
fi
echo "Linking stow configurations"
stow --verbose -t ~ stow/

common() {
    stow bash_init rg scripts shell stow tmux_init vim_plus zsh_init
    (cd vim_plus && stow nvim_sub vimwiki_sub)
}

mac_common() {
    common
    stow _mac
}

linux_common() {
    common
    stow _linux_plus
}

linux_i3() {
    linux_common
    (cd _linux_plus && stow i3_sub)
}

[[ $1 == "common" ]] && common
[[ $1 == "mac_common" ]] && mac_common
[[ $1 == "linux_common" ]] && linux_common
[[ $1 == "linux_i3" ]] && linux_i3
