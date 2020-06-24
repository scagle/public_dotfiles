# vim: foldmethod=marker
# {{{ General Settings
# Set a larger history
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
# }}}

# {{{ Options
setopt HIST_IGNORE_SPACE
setopt appendhistory
setopt promptsubst
# }}}

# {{{ Sourcing External Configurations
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -d "$HOME/.config/shell/" ]]; then
    # Source all Generic configurations
    RCS=($HOME/.config/shell/*.rc(N))
    for RC in $RCS; do
        emulate sh -c 'source $RC'
    done

    # Source all Zsh configurations
    ZRCS=($HOME/.config/shell/*.zshrc(N))
    for ZSHRC in $ZSHRCS; do
        source $ZSHRC
    done
fi
# }}}

# {{{ Zinit 
source "$HOME/.zinit/bin/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

# Install Oh-My-Zsh framework
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh

# Install powerlevel10k theme
zplugin ice depth=1; zplugin light romkatv/powerlevel10k

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions
# }}}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
