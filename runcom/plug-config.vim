
let NERDTreeMapOpenSplit = ""
nnoremap tt :NERDTree<CR>

nnoremap <LEADER>md :MarkdownPreview<CR>
nnoremap <LEADER>MD :MarkdownPreviewStop<CR>

let g:table_mode_corner='|'

let g:ycm_enable_semantic_highlighting=1
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_always_populate_location_list=0
let g:ycm_complete_in_comments=1
let g:ycm_max_num_candidates=10

nnoremap <LEADER>tp :LLPStartPreview<CR> "Tex Preview
let g:livepreview_previewer = 'okular'
