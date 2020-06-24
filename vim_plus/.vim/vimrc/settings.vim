" Generic Settings
syntax on                     " Enable Syntax Highlighting

set number                    " Set line numbers
set noswapfile                " Disable pesky swap files
set tabstop=4                 " show existing tab with 4 spaces width
set shiftwidth=4              " when indenting with '>', use 4 spaces width
set expandtab                 " On pressing tab, insert 4 spaces
set copyindent                " Indents lines with tab or spaces based on previous lines
set hlsearch                  " Highlight Search and Increment Search
set incsearch                 " Incremental search that shows partial matches
set lazyredraw                " Prevent redrawing screen during macros/etc for speed up
set foldopen+=jump            " Open folds if jumping to a line within them
set undolevels=5000           " Set maximum undo levels

let mapleader = ","           " Change MapLeader from '\' to ',' for easier command execution
let maplocalleader = "\\"     " Keep LocalMapLeader the same ( Rarely use )
