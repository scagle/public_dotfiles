" Look and feel configurations

augroup Colorscheme
    autocmd!

    " Keep colorscheme at default
    colorscheme default

    " General (got fed up with DARK blue comments on black screens)
    highlight Comment ctermfg=Gray

    " For vimdiff
    highlight DiffAdd    cterm=bold ctermfg=white ctermbg=blue gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=white ctermbg=blue gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=white ctermbg=blue gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=white ctermbg=red  gui=none guifg=bg guibg=Red

    " Deoplete
    highlight Pmenu     ctermbg=black ctermfg=gray 
    highlight PmenuSel  ctermbg=yellow ctermfg=black 
    highlight PmenuSbar ctermbg=black ctermfg=yellow

    " Color the wrap column in C++ / C projects (I like 100 characters)
    highlight ColorColumn ctermbg=darkred ctermfg=white
    autocmd BufRead,BufNewFile *.cpp,*.c,*.hpp,*.h silent set colorcolumn=101

    autocmd BufRead,BufNewFile *.bashrc setlocal syntax=sh

    " View images in vim ( for fun )
    autocmd BufReadPre *.jpg,*.jpeg silent set ro
    autocmd BufReadPost *.jpg,*.jpeg silent %!jp2a --width=78 "%"
    autocmd BufReadPre *.png,*.gif,*.bmp silent set ro
    autocmd BufReadPost *.png,*.gif,*.bmp silent %!convert "%" jpg:- | jp2a --width=78 -

augroup end

