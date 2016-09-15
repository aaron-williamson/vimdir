" Configuration for my vim plugins

" Airline config
" Requires unicode support for separators
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_theme = 'base16_tomorrow'

" Fugitive mappings (matches my git aliases)
nnoremap <Leader>gst :Gstatus<CR>
nnoremap <Leader>glg :Gvsplit! log --graph --oneline<CR>
nnoremap <Leader>glp :Gvsplit! log --graph --oneline -p<CR>
nnoremap <Leader>gdi :Gvsplit! diff<CR>
nnoremap <Leader>gdc :Gvsplit! diff --cached<CR>
nnoremap <Leader>gdt :Gvdiff<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gaa :Gpedit! add --all<CR>
nnoremap <Leader>gfa :Gpedit! fetch --all<CR>
nnoremap <Leader>gpu :Gpush<Space>
nnoremap <Leader>gpd :Gpull --ff-only<CR>

" Multiple cursors configuration
map <Leader>mf :MultipleCursorsFind<Space>
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" Ack configuration
let g:ack_autoclose = 1
let g:ack_autofold_results = 1
nnoremap <Leader>a :LAck<Space>

" CtrlP configuriation
let g:ctrlp_switch_buffer = 't'
let g:ctrlp_open_multiple_files = 't'

" Color scheme
silent! colorscheme base16-tomorrow-night
