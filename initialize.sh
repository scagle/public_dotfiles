#!/bin/bash
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

print_usage() {
    echo "Usage:"
    echo "  Arg1: Configuration Type"
    echo "    common       : sensible configurations for most systems"
    echo "    mac_common   : common + Mac specific configurations"
    echo "    linux_common : common + Linux specific configurations"
    echo "    linux_i3     : common + linux_common + i3 specific configurations"
}

if [[ -z $1 ]] ; then
    print_usage 
    exit 1 
fi

DOTCONFIG=$HOME/.config
if [[ ! -d "$DOTCONFIG" ]]; then
    mkdir "$DOTCONFIG"
    echo "$DOTCONFIG created"
fi
echo "Linking stow configurations"
stow --verbose -t ~ stow/

case $1 in
    "common" )
        common ;;
    "mac_common" )
        mac_common ;;
    "linux_common" )
        linux_common ;;
    "linux_i3" )
        linux_i3 ;;
    * )
        echo "Invalid argument '$1'"
        print_usage
        exit 1 ;; 
esac
