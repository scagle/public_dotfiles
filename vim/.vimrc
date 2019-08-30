execute pathogen#infect()
set runtimepath^=~/.vim/bundle
syntax on
filetype plugin on
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set number
set backspace=indent,eol,start
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
highlight Comment ctermfg=yellow

" For Easy Motion Plugin
let mapleader = ","

" For saving keystrokes on split windows
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" For saving time on reordering tabs
noremap <M-Left>  :-tabmove<cr>
noremap <M-Right> :+tabmove<cr>
" For Cursor Column aligning
noremap <Leader><Leader>c :set cursorcolumn!<Enter>

"##### NERDTree configurations #####
" Toggle NERDTree by typing <Leader>f
nnoremap <Leader>f :NERDTreeToggle<Enter>
" Make NERDTree Pretty
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Quit NERDTree when opening file
let NERDTreeQuitOnOpen = 1
" Quit NERDTree when it's the last tab open (IE  :wq)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Deleting vim buffer when deleting files in NERDTree
let NERDTreeAutoDeleteBuffer = 1
"###################################

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

nnoremap <leader>ev  :tabnew $MYVIMRC<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>
nnoremap <leader>I   :set foldmethod=indent<cr>zX
nnoremap <leader>S   :set foldmethod=syntax<cr>zX

" for practice :)
inoremap jk <esc>
