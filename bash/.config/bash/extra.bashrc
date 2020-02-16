#!/bin/bash

# Edit files within git repository (starting and descending from cwd)
alias cppe='vim `{ git ls-tree -r HEAD --name-only; git status | grep "new file" | awk '"'"'{ print $3 }'"'"'; } | grep -e "\.\(c\|cpp\)$" -e "\.\(h\|hpp\)$" | env LC_COLLATE=C sort`'
alias cme='vim `{ git ls-tree -r HEAD --name-only; git status | grep "new file" | awk '"'"'{ print $3 }'"'"'; } | grep -e "CMakeLists.txt" -e ".cmake"`'
alias pye='vim `{ git ls-tree -r HEAD --name-only; git status | grep "new file" | awk '"'"'{ print $3 }'"'"'; } | grep -e "\.py$" | env LC_COLLATE=C sort`'
alias javae='vim `{ git ls-tree -r HEAD --name-only; git status | grep "new file" | awk '"'"'{ print $3 }'"'"'; } | grep -e "\.java$" | env LC_COLLATE=C sort`'

# Vim/Neovim editing
if [[ ( -f /usr/bin/nvim || -f /usr/local/bin/nvim ) && -d $HOME/.config/nvim/ ]]; then 
    alias vim='nvim' # Prefer Neovim over Vim if it's installed and stowed
fi
if [[ -f /usr/bin/vim  || -f /usr/local/bin/vim  ]]; then
    alias vi='vim'   # Prefer either Neovim or Vim over Vi
fi

# Source Current Flavor's bashrc ($FLAVOR set in /etc/environment as "FLAVOR=foo")
# Flavors defined in $HOME/.config/flavors (also see https://github.com/scagle/dotfiles)
if [[ ! -z "${FLAVOR}" && -d "${HOME}/.config" && -d "${HOME}/.config/flavors" ]]; then
    export FLAVOR_DIR="${HOME}/.config/flavors/${FLAVOR}/"
    source "${HOME}/.config/flavors/${FLAVOR}/${FLAVOR}.bashrc"
fi;
    
# Ripgrep
if [[ -x /bin/rg || -x /usr/local/bin/rg ]]; then
    export RIPGREP_CONFIG_PATH=$HOME/.config/rg/.ripgreprc
    alias rgf="rg --files | rg"
fi

# Makefiles
if [[ -f /usr/bin/make ]]; then 
    alias m='make'
    if [[ -f /usr/bin/unbuffer ]]; then 
        # Less Make (unbuffer used to keep colors)
        alias lm='unbuffer make | less -R'
    fi
fi
