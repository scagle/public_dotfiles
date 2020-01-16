" Configurations for 'Plug' Plugin Manager

" Install Plug.vim if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Important (Can't live without)
Plug 'terryma/vim-multiple-cursors' " Find/Replace/Manipulate
Plug 'scrooloose/nerdtree'          " Navigate files with filetree
Plug 'godlygeek/tabular'            " Align text in many ways
Plug 'tpope/vim-surround'           " Trying to get used to it
Plug 'vimwiki/vimwiki'              " For notetaking/general documenting

" Semi-Important (Sort of use)
if has('python3') && has('nvim')
    Plug 'Shougo/deoplete.nvim'     " Useful auto complete
    Plug 'roxma/nvim-yarp'          " NeoVim plugin helper
endif

" Experimental (Rarely Use / Trying Out)
"
"
"Plug 'SirVer/ultisnips'                         " Snippet  
Plug 'honza/vim-snippets'                       " Snippets for Ultisnips
Plug 'junegunn/fzf', {'do': './install --all'}  " Fuzzy file search for terminal
Plug 'junegunn/fzf.vim'                         " Fuzzy file search for vim
Plug 'jremmen/vim-ripgrep'                      " Speeds up fzf
Plug 'tpope/vim-fugitive'                       " Better Git wrapper
Plug 'unblevable/quick-scope'                   " f/F/t/T Helper
Plug 'ludovicchabant/vim-gutentags'             " Better tags
"Plug 'andymass/vim-matchup'                     " Better % 
Plug 'christoomey/vim-tmux-navigator'           " Better tmux - vim navigation 
Plug 'will133/vim-dirdiff'                      " Vimdiff on directories

" Github markdown viewer (README.md)
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() } } 

"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'lervag/vimtex'                            " Vim Latex 


" Aesthetics
Plug 'vim-airline/vim-airline'        " For sleek airline bar at bottom
Plug 'vim-airline/vim-airline-themes' " For more themes with airline bar
Plug 'scagle/vim-tba'                 " TramelBlaze Assembly syntax highlighting
Plug 'cormacrelf/vim-colors-github'   " White background colorscheme works well with TOhtml


call plug#end()
