set nocompatible
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Navigating to other configuration files:
"   gf 	    open file in the same window ("goto file")
"   <c-w>f 	open file in a new window (Ctrl-w f)
"   <c-w>gf	open file in a new tab (Ctrl-w gf) 
source $HOME/.vim/vimrc/plugins.vim
source $HOME/.vim/vimrc/settings.vim
source $HOME/.vim/vimrc/plugin_configs.vim
source $HOME/.vim/vimrc/mappings.vim
source $HOME/.vim/vimrc/looks.vim
source $HOME/.vim/vimrc/misc.vim

