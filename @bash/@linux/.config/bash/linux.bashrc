#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls --color=auto' 

    # Use GNU style tools (without g-prefix) before using Mac OS X BSD ones
    PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
fi
