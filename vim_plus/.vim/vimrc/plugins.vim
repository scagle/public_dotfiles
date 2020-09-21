" vim: ft=vim foldmethod=marker
" Plugin Definitions

" {{{ Important (Can't live without)
" Plug 'terryma/vim-multiple-cursors' " Find/Replace/Manipulate
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'scrooloose/nerdtree'          " Navigate files with filetree
Plug 'godlygeek/tabular'            " Align text in many ways
Plug 'tpope/vim-surround'           " Trying to get used to it
Plug 'vimwiki/vimwiki'              " For notetaking/general documenting
Plug 'junegunn/fzf', {'do': './install --bin --all'}  " Fuzzy file search for terminal
Plug 'junegunn/fzf.vim'                         " Fuzzy file search for vim
Plug 'christoomey/vim-tmux-navigator'           " Better tmux - vim navigation 

if has('python3') && has('nvim')
    Plug 'Shougo/deoplete.nvim'     " Useful auto complete
    Plug 'roxma/nvim-yarp'          " NeoVim plugin helper
endif
" }}}

" {{{ Experimental (Rarely Use / Trying Out)
Plug 'jremmen/vim-ripgrep'                      " Speeds up fzf TODO This guy isn't that good. Phase him out
"Plug 'SirVer/ultisnips'                         " Snippet  
Plug 'honza/vim-snippets'                       " Snippets for Ultisnips
Plug 'tpope/vim-fugitive'                       " Better Git wrapper
"Plug 'unblevable/quick-scope'                   " f/F/t/T Helper
"Plug 'ludovicchabant/vim-gutentags'             " Better tags
"Plug 'andymass/vim-matchup'                     " Better % start/end scope jump
Plug 'will133/vim-dirdiff'                      " Vimdiff on directories
Plug 'tpope/vim-repeat'                         " Repeat other plugin maps with '.'
Plug 'Konfekt/FastFold'                         " Quicker folds (computationally)
Plug 'tmhedberg/SimpylFold'                     " Better python folding
"Plug 'chrisbra/vim-diff-enhanced'               " Better diff options (sometimes)
Plug 'AndrewRadev/sideways.vim'                 " Moving Parameters / Arguments around

" Github markdown viewer (README.md)
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() } } 

"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'lervag/vimtex'                            " Vim Latex 
" }}}

" {{{ Aesthetics
Plug 'vim-airline/vim-airline'        " For sleek airline bar at bottom
Plug 'vim-airline/vim-airline-themes' " For more themes with airline bar
Plug 'scagle/vim-tba'                 " TramelBlaze Assembly syntax highlighting
Plug 'cormacrelf/vim-colors-github'   " White background colorscheme works well with TOhtml
" }}}
