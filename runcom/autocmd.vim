
augroup filetype_general
    " Indent
    autocmd! 
    " The Same effct as normal << >>
    autocmd BufReadPost * nnoremap <buffer> <localleader>i I    <esc>
    autocmd BufReadPost * nnoremap <buffer> <localleader>ui I<c-h><esc>
    " Perverse original position
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
augroup END

augroup filetype_c
    " Commentj
    autocmd! 
    autocmd FileType c nnoremap <buffer> <localleader>c I// <esc>
    autocmd FileType c nnoremap <buffer> <localleader>u ^xxx<esc>
    autocmd FileType cpp nnoremap <buffer> <localleader>c I// <esc>
    autocmd FileType cpp nnoremap <buffer> <localleader>u ^xxx<esc>
augroup END

augroup filetype_md
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_us  
    " Go to next header
    autocmd FileType markdown nnoremap <buffer> <localleader>j /^## <cr>:nohlsearch<cr>
    autocmd FileType markdown nnoremap <buffer> <localleader>k ?^## <cr>:nohlsearch<cr>
augroup END


" Vimscript
augroup filetype_vim 
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
