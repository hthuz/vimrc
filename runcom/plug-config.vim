
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
" " <C-g>u breaks current undo, please make your own choice

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


