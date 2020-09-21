" vim: ft=vim foldmethod=marker

" Configurations for installed plugins

" Vim Quick Help:
"     Folds:
"         zo     open fold
"         zc     close fold
"         zj/zk  jump between folds
"         zn/zm  open/close all folds

" Vim_Airline:  Status Bar {{{
if has_key(plugs, "vim-airline")
    augroup VimAirLine
        autocmd!
        set t_Co=256
        let g:airline_theme='minimalist'
    "       let g:airline_solarized_bg='dark'
        let g:airline_powerline_fonts = 1
    "    let g:airline#extensions#tabline#enabled = 1
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
    augroup end
endif
" }}}

" NERDTree:     File System Explorer {{{
if has_key(plugs, "nerdtree")
    augroup NERDTree
        autocmd!
        nnoremap <silent> <leader>f :NERDTreeFind<cr>
        nnoremap <silent> <leader>F :NERDTreeToggle<cr>
        let NERDTreeQuitOnOpen=1
    augroup end
endif
" }}}

" VimWiki:      Personal Wiki {{{
if has_key(plugs, "vimwiki")
    augroup VimWiki
        autocmd!
        let g:vimwiki_list = [
            \ {'path':'~/vimwiki/wiki', 'path_html':'~/vimwiki/html/'},
            \ {'path':'~/workwiki/wiki', 'path_html':'~/workwiki/html/'},
        \ ]

        " Disable Table Mappings: (conflicts with Deoplete/Ultisnips)
        let g:vimwiki_table_mappings = 0

        " Open HTML In Web Browser:
        autocmd FileType vimwiki nnoremap <silent> <leader>oc :Vimwiki2HTMLBrowse<cr> 
    augroup end
endif
" }}}

" Ultisnips:    Snippet Expander {{{
if has_key(plugs, "vim-ultisnips")
    augroup UltiSnips
        autocmd!
        " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
        let g:UltiSnipsExpandTrigger="<c-j>"
        let g:UltiSnipsJumpForwardTrigger="<c-j>"
        
        " If you want :UltiSnipsEdit to tab your window.
        let g:UltiSnipsEditSplit="tabdo"

        " Where to save new snippets
        let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/plugged/my-snippets/UltiSnips"]
        " Edit Ultisnips for current filetype
        nnoremap <silent><leader>eu :UltiSnipsEdit <cr>
    augroup end
endif
" }}}

" FZF:          Fuzzy File Finder {{{
if has_key(plugs, "fzf") && has_key(plugs, "fzf.vim")
    augroup FZF
        autocmd!
        " Grabs the name of buffers from their full paths
        function! s:GetBufferNames()
            redir => ls
            for buf in getbufinfo()
                silent echo buf.name
            endfor
            redir end
            return split(ls, '\n')
        endfunction

        function! s:buflist()
          redir => ls
          silent ls
          redir end
          return split(ls, '\n')
        endfunction

        function! s:bufopen(e)
          execute 'buffer' a:e
        endfunction

        function! s:tabopen(e)
          execute 'tabnew' a:e
        endfunction

        " Select an open buffer, and open in current buffer
        nnoremap <silent> <leader>b :call fzf#run({
        \   'source':  reverse(<sid>GetBufferNames()),
        \   'sink':    function('<sid>bufopen'),
        \   'options': '+m --tiebreak=length',
        \   'down':    len(<sid>buflist()) + 2
        \ })<CR>

        " Select an open buffer, and open it in a new tab
        nnoremap <silent> <leader>t :call fzf#run({
        \   'source':  reverse(<sid>GetBufferNames()),
        \   'sink':    function('<sid>tabopen'),
        \   'options': '+m --tiebreak=length',
        \   'down':    len(<sid>buflist()) + 2
        \ })<CR>
    augroup end
endif
" }}}

" RG:           Rip Grep {{{
if has_key(plugs, "vim-ripgrep")
    augroup RG 
        autocmd!
        nnoremap <leader>rg :Rg<cr>
    augroup end
endif
" }}}

" Vimtex:       Latex for Vim {{{
if has_key(plugs, "vimtex")
    augroup Vimtex
        autocmd!
        let g:tex_flavor = 'latex'
        let g:vimtex_view_method = 'zathura'
    augroup end
endif
" }}}

" Deoplete:     Lightweight Autocompletion for Neovim {{{
if has_key(plugs, "nvim-yarp")
    if has_key(plugs, "deoplete.nvim")
        augroup Deoplete 
            autocmd!
            if has("python3") && has("nvim") 
                let g:deoplete#enable_at_startup = 1
                call deoplete#custom#option('smart_case', v:true)
                
                " Tab completion / cycling
                " https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
                inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
                inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

                inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
                function! s:my_cr_function() abort
                  return deoplete#close_popup() . "\<CR>"
                endfunction
            endif
        augroup end
    endif
endif
" }}}

" QuickScope:   Left - Right Movement Helper {{{
if has_key(plugs, "vim-quick-scope")
    augroup Quick-Scope
        autocmd!
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
        autocmd ColorScheme * highlight QuickScopePrimary guifg='#ff5555' gui=underline ctermfg=9 cterm=underline
    augroup end
endif
" }}}

" Vim_Pandoc:   Pandoc Integration and Utilities for Vim {{{
if has_key(plugs, "vim-vim-wiki")
    augroup Vim-Pandoc
        autocmd!
        let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
        let g:pandoc#filetypes#pandoc_markdown = 0
    augroup end
endif
" }}}

" Vim_Fugitive: A Git wrapper so awesome, it should be illegal {{{
if has_key(plugs, "vim-fugitive")
    augroup Vim-Fugitive
        autocmd!
        " fugitive git bindings
        nnoremap <leader>ga :Git add %:p<CR><CR>
        nnoremap <leader>gs :Gstatus<CR>
        nnoremap <leader>gc :Gcommit -v -q<CR>
        nnoremap <leader>gt :Gcommit -v -q %:p<CR>
        nnoremap <leader>gd :Gdiff<CR>
        nnoremap <leader>gg :Gdiff<SPACE>
        nnoremap <leader>ge :Gedit<CR>
        nnoremap <leader>gr :Gread<CR>
        nnoremap <leader>gw :Gwrite<CR><CR>
        nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
        nnoremap <leader>gp :Ggrep<Space>
        nnoremap <leader>gm :Gmove<Space>
        nnoremap <leader>gb :Git branch<Space>
        nnoremap <leader>go :Git checkout<Space>
        nnoremap <leader>gps :Dispatch! git push<CR>
        nnoremap <leader>gpl :Dispatch! git pull<CR>
    augroup end
endif
" }}}

" Sideways:     Move arguments around horizontally {{{
if has_key(plugs, "vim-sideways")
    augroup Vim-Sideways
        autocmd!
        nnoremap <silent> <leader>ch :SidewaysLeft
        nnoremap <silent> <leader>cl :SidewaysRight
    augroup end
endif
" }}}
