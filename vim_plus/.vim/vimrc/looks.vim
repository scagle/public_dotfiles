" Look and feel configurations

augroup Colorscheme
    autocmd!

    " Keep colorscheme at default
    colorscheme default

    " General (got fed up with DARK blue comments on black screens)
    highlight Comment ctermfg=Gray

    " Fold highlight colors
	highlight Folded ctermbg=darkgrey ctermfg=white

    " For vimdiff
    highlight DiffAdd    cterm=bold ctermfg=white ctermbg=blue gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=white ctermbg=blue gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=white ctermbg=blue gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=white ctermbg=red  gui=none guifg=bg guibg=Red

    " Deoplete Tab Completion
    highlight Pmenu     ctermbg=black ctermfg=gray 
    highlight PmenuSel  ctermbg=yellow ctermfg=black 
    highlight PmenuSbar ctermbg=black ctermfg=yellow

    autocmd BufRead,BufNewFile *.bashrc setlocal syntax=sh

augroup end

