#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Use GNU style tools (without g-prefix) before using MacOS
    PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
    [[ -x /usr/local/bin/gls ]] && alias ls='gls --color'
    [[ -x /usr/local/bin/grm ]] && alias rm='grm'
    [[ -x /usr/local/bin/gmv ]] && alias mv='gmv'
    [[ -x /usr/local/bin/gfind ]] && alias find='gfind'
    [[ -x /usr/local/bin/gmkdir ]] && alias mkdir='gmkdir'
fi
