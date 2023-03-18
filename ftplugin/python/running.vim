

if !exists("g:python_command")
    let g:python_command = "python"
endif

function! PythonInterpretAndRun()
    let python_code_name = bufname("%")
    let python_result = system(g:python_command . " " . python_code_name)
    let python_result_win = bufwinnr("__Python_Result__")

    if python_result_win ==# -1
        setlocal splitright
        execute (winwidth(0) * 3 / 10) .. "vsplit __Python_Result__"
        " vsplit __Python_Result__
    else
        execute python_result_win .. "wincmd w"
    endif

    normal! ggdG
    setlocal buftype=nofile
    call append(0, split(python_result, '\v\n'))
    
    execute bufwinnr(python_code_name) .. "wincmd w"

endfunction


function! PythonCloseResult()
    let python_result_win = bufwinnr("__Python_Result__")
    if python_result_win ==# -1
        return
    else
        execute python_result_win . "q"
    endif

endfunction


nnoremap <buffer> <localleader>r :call PythonInterpretAndRun()<cr>
nnoremap <buffer> <localleader>e :call PythonCloseResult()<cr>



