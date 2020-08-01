# If initialized after already stowed, then a git-submodule is created, since it places
# the tpm plugin directory in the sym-linked directory (inside repository) instead
# of the filesystem (output repository). So I make sure to unstow first before init.
(cd ..; stow stow && stow -D tmux_init)
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/tmux-tpm/plugins/tpm
(cd ..; stow tmux_init)
