" Configurations for various installed plugins

"""" Vim-Airline
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


"""" NerdTree
augroup NERDTree
    autocmd!
    nnoremap <silent> <leader>f :NERDTreeToggle<cr>
    let NERDTreeQuitOnOpen=1
augroup end


"""" VimWiki
augroup VimWiki
    autocmd!
    let g:vimwiki_list = [{'path':'~/.vimwiki/wiki', 'path_html':'~/.vimwiki/html/'}]
    function! VimwikiLinkHandler(link)
        " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
        "   1) [[vfile:~/Code/PythonProject/abc123.py]]
        "   2) [[vfile:./|Wiki Home]]
        let link = a:link
        if link =~# '^vfile:'
            let link = link[1:]
        else
            return 0
        endif
        let link_infos = vimwiki#base#resolve_link(link)
        if link_infos.filename == ''
            echomsg 'Vimwiki Error: Unable to resolve link!'
            return 0
        else
            exe 'tabnew ' . fnameescape(link_infos.filename)
            return 1
        endif
    endfunction

    " mapping to open wiki link in new tab (urxvt doesnt support default map)
    "nmap <Leader>nt <Plug>VimwikiTabnewLink
augroup end

"""" Ultisnips
augroup UltiSnips
    autocmd!
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    " If you want :UltiSnipsEdit to tab your window.
    let g:UltiSnipsEditSplit="tabdo"
    nnoremap <silent><leader>eu :UltiSnipsEdit <cr>
    let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/plugged/my-snippets/UltiSnips"]
augroup end


"""" FZF
augroup FZF
    autocmd!
    " Get just the path of the files
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

    nnoremap <silent> <leader>b :call fzf#run({
    \   'source':  reverse(<sid>GetBufferNames()),
    \   'sink':    function('<sid>bufopen'),
    \   'options': '+m --tiebreak=length',
    \   'down':    len(<sid>buflist()) + 2
    \ })<CR>

    nnoremap <silent> <leader>t :call fzf#run({
    \   'source':  reverse(<sid>GetBufferNames()),
    \   'sink':    function('<sid>tabopen'),
    \   'options': '+m --tiebreak=length',
    \   'down':    len(<sid>buflist()) + 2
    \ })<CR>
augroup end

""" Vimtex
augroup Vimtex
    autocmd!
    let g:tex_flavor = 'latex'
    let g:vimtex_view_method = 'zathura'
augroup end

""" Deoplete
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

""" Quick-Scope
augroup Quick-Scope
    autocmd!
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#ff5555' gui=underline ctermfg=9 cterm=underline
augroup end

""" Vim-Pandoc
augroup Vim-Pandoc
    autocmd!
    let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
    let g:pandoc#filetypes#pandoc_markdown = 0
augroup end

""" Vim-Fugitive
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
