" Look and feel configurations

augroup Colorscheme
    autocmd!

    " Keep colorscheme at default
    colorscheme default

    " General (got fed up with DARK blue comments on black screens)
    "highlight Comment ctermfg=Gray

    " Fold highlight colors
	highlight Folded ctermbg=darkgrey ctermfg=white

    " For vimdiff
    let w:super_diff=1
    " Switch between "intense" and "neutral" colors (for when it becomes overwhelming)
    function! AlternateSuperDiff(alternate)
        if ( a:alternate == 1 )
            let w:super_diff=!w:super_diff
            echom "Toggling Super VimDiff Mode"
        endif
        if ( w:super_diff == 1 )
            highlight DiffAdd    cterm=bold ctermfg=black ctermbg=green gui=none guifg=bg guibg=red
            highlight DiffDelete cterm=bold ctermfg=lightred ctermbg=darkred gui=none guifg=bg guibg=red
            highlight DiffChange cterm=bold ctermfg=white ctermbg=darkgray gui=none guifg=bg guibg=red
            highlight DiffText   cterm=bold ctermfg=black ctermbg=blue gui=none guifg=bg guibg=blue
        else
            highlight DiffAdd    cterm=bold ctermfg=white ctermbg=black gui=none guifg=bg guibg=black
            highlight DiffDelete cterm=bold ctermfg=white ctermbg=black gui=none guifg=bg guibg=black
            highlight DiffChange cterm=bold ctermfg=white ctermbg=black gui=none guifg=bg guibg=black
            highlight DiffText   cterm=bold ctermfg=white ctermbg=darkgray gui=none guifg=bg guibg=darkgray
        endif
    endfunction
    call AlternateSuperDiff(0)

    " Spellcheck should be distinctly different from vimdiff highlights, so that code reviews are easier
    highlight SpellBad   cterm=bold ctermfg=white ctermbg=red gui=none guifg=bg guibg=red
    highlight SpellCap   cterm=bold ctermfg=yellow ctermbg=red gui=none guifg=bg guibg=red
    highlight SpellLocal cterm=bold ctermfg=yellow ctermbg=red gui=none guifg=bg guibg=red
    highlight SpellRare  cterm=bold ctermfg=yellow ctermbg=red gui=none guifg=bg guibg=red

    " Deoplete Tab Completion
    highlight Pmenu     ctermbg=black ctermfg=gray
    highlight PmenuSel  ctermbg=yellow ctermfg=black
    highlight PmenuSbar ctermbg=black ctermfg=yellow

    autocmd BufRead,BufNewFile *.bashrc setlocal syntax=sh

augroup end

