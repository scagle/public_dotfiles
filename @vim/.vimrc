" Quick Help:
"     Navigation: 
"         gf          open filepath in the same window 
"         <ctrl-w>f   open filepath in a new window 
"         <ctrl-w>gf  open filepath in a new tab 
"         <ctrl-o>    go back to previous cursor location/file
"         <ctrl-^>    go back to previous file

set nocompatible
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Load Primary Configurations
source $HOME/.vim/vimrc/plugins.vim
source $HOME/.vim/vimrc/settings.vim
source $HOME/.vim/vimrc/plugin_configs.vim
source $HOME/.vim/vimrc/mappings.vim
source $HOME/.vim/vimrc/looks.vim
source $HOME/.vim/vimrc/misc.vim
source $HOME/.vim/vimrc/humor.vim

" Load Extra Configurations
let extra_configs=glob("$HOME/.vim/vimrc/extra/*.vim") 
if extra_configs
    for config in extra_configs
        source config
    endfor
endif

" Quick and dirty settings for temporary use
source $HOME/.vim/vimrc/temporary.vim

