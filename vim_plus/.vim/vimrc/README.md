# vimrc/
Directory that contains all vim configurations that are sourced inside `~/.vimrc`

# Subdirectories
## external/
Directory to store symbolic links to external configurations.
Useful with GNU stow, and private dotfiles, to add work configs and other 
private configurations.

## external_plugins/
Same as `external/`, but for any configurations which are sourced during the
plugin stage (Plugins are initialized before anything else, to prevent overwriting
of personal configurations)

