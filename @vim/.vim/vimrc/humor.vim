" View images in vim ( for fun )
autocmd BufReadPre *.jpg,*.jpeg silent set ro
autocmd BufReadPost *.jpg,*.jpeg silent %!jp2a --width=78 "%"
autocmd BufReadPre *.png,*.gif,*.bmp silent set ro
autocmd BufReadPost *.png,*.gif,*.bmp silent %!convert "%" jpg:- | jp2a --width=78 -

cmap jk echoerr "IDENTITY THEFT IS NOT A JOKE JIM!"<cr>
