" Key Mappings for both general use and filetypes

" General Mappings: {{{
augroup GeneralMappings
    autocmd!

    " Quickly Editing Common Files:
    nnoremap <silent> <leader>vnv :tabnew $MYVIMRC<cr>
    nnoremap <silent> <leader>vv :tabnew $ACTUALVIMRC<cr>
    nnoremap <silent> <leader>vt :tabnew $HOME/.tmux.conf<cr>
    nnoremap <silent> <leader>vb :tabnew $HOME/.bashrc<cr>
    nnoremap <silent> <leader>vc :tabnew $HOME/.config/<cr>
    nnoremap <leader>svv :source $MYVIMRC<cr>
    nnoremap <leader>svt :!tmux source $HOME/.tmux.conf<cr>
    nnoremap <leader>svb :!source $HOME/.bashrc<cr>

    " Split Navigation:
    nnoremap <C-J> <C-W><C-J> 
    nnoremap <C-K> <C-W><C-K> 
    nnoremap <C-L> <C-W><C-L> 
    nnoremap <C-H> <C-W><C-H> 

    " Fold Helpers:
    nnoremap <silent> <leader>M :set foldmethod=marker<cr>zX<cr>
    nnoremap <silent> <leader>I :set foldmethod=indent<cr>zX<cr>
    nnoremap <silent> <leader>S :set foldmethod=syntax<cr>zX<cr>
    " This one is used for CMake files with lots of macros
    nnoremap <silent> <leader>C :set foldmarker=macro(,endmacro(<cr>:set foldmethod=marker<cr>zX<cr>

    " Toggle Symbols:
    " Shows all symbols in the file, such as pesky tabs and trailing whitespace
    nnoremap <silent> <leader>l :set list!<cr>

    " Toggle Spell Checker:
    nnoremap <leader>sc :setlocal spell! spelllang=en_us <cr>
    nnoremap <leader>ss z=1<cr> 

    " Toggle Word Wrap:
    nnoremap <silent> <leader>W :set wrap!<cr>

    " Toggle Wrap Scan: (searches wrapping)
    nnoremap <leader><leader>w :set wrapscan!<cr>

    " Toggle Cursor Column:
    nnoremap <silent> <leader>cc :set cursorcolumn!<cr>

    " Remove Highlighted Searches:
    nnoremap <silent> <space> :noh<return><esc>

    " Quickly Move Between Files: 
    nnoremap <silent> <BS> <C-^>
    " Note: Favoring FZF over :ls currently
    " nnoremap <silent> <leader>b  :ls<CR>:b<Space><Space><BS>
    " nnoremap <silent> <leader>t  :ls<CR>:tabnew<Space><Space><BS>

    " Navigate Between Adjacent Buffers:
    nnoremap <silent> <leader>n :bp<cr>
    nnoremap <silent> <leader>m :bn<cr>

    " Alternative Escapes: (saves my pinkie from pressing <esc>)
    " Blame this person not me: http://learnvimscriptthehardway.stevelosh.com/chapters/10.html
    inoremap jj <esc>
    inoremap kk <esc>
    inoremap jk <esc>
    inoremap kj <esc>

    " Disable ALL F1 Helps: (since it's annoying when using Mac touchbar)
    nmap <F1> <esc>
    imap <F1> <esc>
    nmap <M-F1> <esc>
    imap <M-F1> <esc>
    nmap <S-F1> <esc>
    imap <S-F1> <esc>
    nmap <M-S-F1> <esc>
    imap <M-S-F1> <esc>

    " Vimdiff helpers
    nnoremap <silent> <leader>sd :call AlternateSuperDiff(1)<cr>
    nnoremap <silent> <leader>du :diffupdate<cr>

    " Disable Ex Mode: (I hit 'Q' at least 10 times a day by accident)
    nnoremap Q <nop>

    " Tabbed File Helpers:
    function! AlternateTabSize()
        if ( &shiftwidth == 4 )
            let &shiftwidth=2
            let &tabstop=2
            let &expandtab=0
        else
            let &shiftwidth=4
            let &tabstop=4
            let &expandtab=1
        endif
        echo "shiftwidth=" . &shiftwidth . ", tabstop=" . &tabstop . ", expandtab=" . &expandtab
    endfunction
    nnoremap <silent> <leader><tab> :call AlternateTabSize()<cr>
    inoremap <s-tab> <c-v><tab>

    " Vim Terminal Helpers:
    if exists(":terminal")
        tnoremap <Esc> <C-\><C-n>
        tnoremap jk <C-\><C-n>
    endif

    " Remap Common Ex Mistakes:
    command! W w
    command! Q q

augroup end
" }}}

" General File Specific Mappings: {{{
augroup FileSpecficMappings
    autocmd! 

augroup end
" }}}
