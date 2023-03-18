

let mapleader=" "
let maplocalleader=" "
nnoremap <LEADER>sv :source $MYVIMRC<CR> 
nnoremap <LEADER>ev :vsplit $MYVIMRC<CR>
nnoremap <LEADER>sp :source %<CR>

source ~/.vim/runcom/keymapping.vim
source ~/.vim/runcom/general.vim
source ~/.vim/runcom/autocmd.vim
source ~/.vim/runcom/plug-config.vim



" Plugins
call plug#begin('~/.vim/plugged')

" Plug 'ycm-core/YouCompleteMe'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview',{'for':'tex'}
Plug 'neoclide/coc.nvim' , {'branch': 'release'}

call plug#end()














