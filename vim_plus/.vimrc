" vim: ft=vim foldmethod=marker
" Vim Quick Help:
"     Navigation: 
"         gf          open filepath in the same window 
"         <ctrl-w>f   open filepath in a new window 
"         <ctrl-w>gf  open filepath in a new tab 
"         <ctrl-^>    go back to previous file
"     Folds:
"         zo     open fold
"         zc     close fold
"         zj/zk  jump between folds
"         zn/zm  open/close all folds

" Functions: {{{
" Source External Configurations Matching A Glob Pattern: {{{
function GlobSourceFiles(glob_pattern)
    let s:source_files = glob(a:glob_pattern)
    if s:source_files
        for source_file in s:source_files
            source source_file
        endfor
    endif
endfunction
" }}} GlobSourceFiles()

" Initialize Plugin Manager And All Plugins: {{{
function SetupPlugins()
    " Plugin Manager Setup:
    source $HOME/.vim/vimrc/vim_plug_install.vim  " Install 'vim-plug' plugin manager if needed
    call plug#begin('~/.vim/plugged')             " Listen for plugins, install to specified directory

    " Plugins:
    source $HOME/.vim/vimrc/plugins.vim
    call GlobSourceFiles("$HOME/.vim/vimrc/external_plugins/*.vim")

    " Plugin Manager Teardown: (Stop listening for plugins, and install any if needed)
    call plug#end()

    " Configurations:
    source $HOME/.vim/vimrc/plugin_configs.vim
endfunction
" }}} SetupPlugins()
" }}} Functions

" Precursor Settings:
set nocompatible
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
let mapleader = ","           " Change MapLeader from '\' to ',' for easier command execution
let maplocalleader = "\\"     " Keep LocalMapLeader the same ( Rarely use )

" Minimal Mode Exclusions:          (Add command below as alias)
" Command To Enable Minimal Mode: vim --cmd 'let g:minimal_config=1'
if !exists("g:minimal_config")
    call SetupPlugins()                                      " Local + External Plugins
    call GlobSourceFiles("$HOME/.vim/vimrc/external/*.vim")  " External Configurations
else
    autocmd VimEnter * echom "Launched Vim in Minimal Mode! (No plugins)"
endif

" Configurations:
source $HOME/.vim/vimrc/settings.vim
source $HOME/.vim/vimrc/mappings.vim
source $HOME/.vim/vimrc/looks.vim
source $HOME/.vim/vimrc/misc.vim
source $HOME/.vim/vimrc/humor.vim

