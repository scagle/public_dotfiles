" Key Mappings for both general use and filetypes

augroup GeneralMappings
    autocmd!

    """ Normal Mode Mappings
    " Split Navigation
    nnoremap <C-J> <C-W><C-J> 
    nnoremap <C-K> <C-W><C-K> 
    nnoremap <C-L> <C-W><C-L> 
    nnoremap <C-H> <C-W><C-H> 

    " Quickly editing / sourcing vimrc
    nnoremap <silent> <leader>ev :tabnew $ACTUALVIMRC<cr>
    nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

    " Fold helpers
    nnoremap <silent> <leader>I  :set foldmethod=indent<cr>zX<cr>
    nnoremap <silent> <leader>S  :set foldmethod=syntax<cr>zX<cr>

    " Toggle list symbols (useful for checking tabs)
    nnoremap <silent> <leader>l  :set list!<cr>

    " Toggle spell checker
    nnoremap <leader>sc          :setlocal spell! spelllang=en_us <cr>

    " Toggle word wrap
    nnoremap <silent> <leader>W  :set wrap!<cr>

    " Toggle cursor column
    nnoremap <silent> <leader>cc :set cursorcolumn!<cr>

    " Quickly remove persistant highlighted text after searches
    nnoremap <silent> <space>    :noh<return><esc>

    " Quickly move between files ( buffers / tabs )
    "nnoremap <silent> <leader>b  :ls<CR>:b<Space><Space><BS>
    "nnoremap <silent> <leader>t  :ls<CR>:tabnew<Space><Space><BS>
    nnoremap <silent> <BS> <C-^>

    " Navigate between buffers quickly
    nnoremap <silent> <leader>n  :bp<cr>
    nnoremap <silent> <leader>m  :bn<cr>

    """ Insert Mode Mappings
    " Alternative escape(s) ( Can't live without it now. Faster, and saves my pinkie from pressing <esc> )
    "  ( Blame this guy not me: http://learnvimscriptthehardway.stevelosh.com/chapters/10.html )
    inoremap jk <esc>

    " Tabbed File Helpers
    function AlternateTabSize()
        if ( &shiftwidth == 4 ) " If default tab then
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

    if exists(":terminal")
        tnoremap <Esc> <C-\><C-n>
        tnoremap jk <C-\><C-n>
    endif
augroup end

augroup FileSpecficMappings
    autocmd! 

    function! FindPrevPattern(pattern)
        return filter([search(a:pattern, 'bnW'), line('.')], 'v:val')[0].'G'
    endfunction
    " Update Header: Creates/Updates headers in verilog files
    " autocmd FileType verilog nnoremap <silent> <leader>uh 
    "     \ mm/module\s\([a-z]\\|[A-Z]\\|\s\\|_\\|-\\|[0-9]\)\+(<CR>
    "     \ :exec "normal" . FindPrevPattern('DESC:')<CR>
    "     \ O<ESC>VggxO<ESC>0Dihead <ESC>:call UltiSnips#ExpandSnippet()<CR><ESC>:w<CR>`m

    " Open Vimwikiin web browser
    autocmd FileType vimwiki nnoremap <silent> <leader>oc :Vimwiki2HTMLBrowse<cr> 

augroup end

