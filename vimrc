

let mapleader=" "
let maplocalleader=" "

" General
filetype plugin indent on
syntax enable
" set background=dark
set number
set wrap
set showcmd
set autoindent
set mouse=a
set encoding=utf-8
set completeopt=longest,menuone
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase


" Keymapping
nnoremap <LEADER>sv :source $MYVIMRC<CR> 
nnoremap <LEADER>ev :vsplit $MYVIMRC<CR>
noremap <LEADER><CR> :nohlsearch<CR>
noremap S :w<CR>
inoremap <LEFT> <nop>
inoremap <RIGHT> <nop>
inoremap <UP> <nop>
inoremap <DOWN> <nop>

nnoremap <LOCALLEADER>pi :PlugInstall<CR>
nnoremap <localleader>pc :PlugClean<CR>

" Autocmd
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
    " Comment
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
    autocmd FileType markdown nnoremap <buffer> <localleader>k ?^## <cr>:nohlsearch<cr>
augroup END

augroup filetype_vim 
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

 

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'connorholyday/vim-snazzy'
   
Plug 'ycm-core/YouCompleteMe' " python install --clangd-completer to support C only
Plug 'neoclide/coc.nvim' , {'branch': 'release'}

Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
Plug 'luochen1990/rainbow'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'preservim/vim-markdown'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview',{'for':'tex'}
Plug 'vim-python/python-syntax'
Plug 'vhda/verilog_systemverilog.vim'

Plug 'hthuz/potion-vim'

" Plug '~/.vim/plugged/vim-polyglot'
call plug#end()


" Plugin Config


" Vim-snazzy
colorscheme snazzy
" let g:SnazzyTransparent = 1

" Markdwon Preview
nnoremap <LEADER>md :MarkdownPreview<CR>
nnoremap <LEADER>MD :MarkdownPreviewStop<CR>

" Vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 0
set conceallevel=2

" Vim-table-mode
let g:table_mode_corner='|'
 

" YouCompleteMe
let g:ycm_enable_semantic_highlighting=1
let g:ycm_auto_trigger=0
let g:ycm_filetype_whitelist = {
    \ 'c': 1,
    \ 'cpp': 1
  \ }

let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting=0
" let g:ycm_always_populate_location_list=0
" let g:ycm_complete_in_comments=1
" let g:ycm_max_num_candidates


" Tex Preview
nnoremap <LEADER>tp :LLPStartPreview<CR> "Tex Preview
let g:livepreview_previewer = 'okular'

    
" Coc.nvim
inoremap <silent><expr> <TAB>
     \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
     \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
 " <C-g>u breaks current undo, please make your own choice

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Python-syntax
let g:python_highlight_indent_errors = 0
let g:python_highlight_all = 1


" rainbow
let g:rainbow_active = 1
