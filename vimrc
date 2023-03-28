

let mapleader=" "
let maplocalleader=" "

" General
filetype plugin indent on
syntax enable
set background=dark
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
    autocmd FileType markdown nnoremap <buffer> <localleader>j /^## <cr>:nohlsearch<cr>
    autocmd FileType markdown nnoremap <buffer> <localleader>k ?^## <cr>:nohlsearch<cr>
augroup END

augroup filetype_vim 
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END



" Plugins
call plug#begin('~/.vim/plugged')

" Plug 'ycm-core/YouCompleteMe'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview',{'for':'tex'}
Plug 'neoclide/coc.nvim' , {'branch': 'release'}
Plug 'altercation/vim-colors-solarized'

Plug 'hthuz/potion-vim'

call plug#end()


" Plugin Config
let NERDTreeMapOpenSplit = ""
nnoremap tt :NERDTree<CR>

nnoremap <LEADER>md :MarkdownPreview<CR>
nnoremap <LEADER>MD :MarkdownPreviewStop<CR>

let g:table_mode_corner='|'
 
" let g:ycm_enable_semantic_highlighting=1
" let g:ycm_enable_diagnostic_highlighting=0
" let g:ycm_always_populate_location_list=0
" let g:ycm_complete_in_comments=1
" let g:ycm_max_num_candidates=10

nnoremap <LEADER>tp :LLPStartPreview<CR> "Tex Preview
let g:livepreview_previewer = 'okular'

    
" coc tab completion

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

