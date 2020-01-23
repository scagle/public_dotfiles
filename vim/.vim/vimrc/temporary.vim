" Figure I need something for the other common configs as well
" NOTE: <leader>bv (bash - v) wont work because of <leader>bn / <leader>bp
nnoremap <silent> <leader>tv :tabnew $HOME/.tmux.conf<cr>
nnoremap <silent> <leader>rv :tabnew $HOME/.bashrc_steven<cr>
nnoremap <silent> <leader>stv :!tmux source $HOME/.tmux.conf<cr>
nnoremap <silent> <leader>srv :!source $HOME/.bashrc_steven<cr>
