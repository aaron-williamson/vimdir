" Configuration for my vim plugins

" Don't configure plugins if we don't want plugins
if !$NO_VIM_PLUGINS

  " Airline config
  " Requires unicode support for separators
  let g:airline_left_sep                                   = '»'
  let g:airline_right_sep                                  = '«'
  let g:airline#extensions#tabline#enabled                 = 1
  let g:airline#extensions#tabline#tab_nr_type             = 1
  let g:airline#extensions#tabline#buffer_idx_mode         = 1
  let g:airline#extensions#tabline#show_close_button       = 0

  " Airline tab selection keys
  nmap <Leader>1 <Plug>AirlineSelectTab1
  nmap <Leader>2 <Plug>AirlineSelectTab2
  nmap <Leader>3 <Plug>AirlineSelectTab3
  nmap <Leader>4 <Plug>AirlineSelectTab4
  nmap <Leader>5 <Plug>AirlineSelectTab5
  nmap <Leader>6 <Plug>AirlineSelectTab6
  nmap <Leader>7 <Plug>AirlineSelectTab7
  nmap <Leader>8 <Plug>AirlineSelectTab8
  nmap <Leader>9 <Plug>AirlineSelectTab9

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

  " Rails mappings
  nnoremap <Leader>rm :Emodel<CR>
  nnoremap <Leader>rc :Econtroller<CR>
  nnoremap <Leader>rv :Eview<Space>
  nnoremap <Leader>rh :Ehelper<CR>
  nnoremap <Leader>ra :A<CR>
  nnoremap <Leader>rr :Einitializer<CR>

  " Ack configuration
  let g:ack_autoclose        = 1
  let g:ack_autofold_results = 1
  let g:ackpreview           = 1
  nnoremap <Leader>a :LAck<Space>

  " CtrlP configuriation
  let g:ctrlp_switch_buffer       = 't'
  let g:ctrlp_open_multiple_files = 't'

  " Color scheme but only if we have true color
  if has("termguicolors")
    silent! colorscheme base16-monokai
    let g:airline_theme = 'base16_monokai'
  endif

  " Vim-tmux-navigator mappings
  let g:tmux_navigator_no_mappings = 1
  if (has("unix") && system("uname -s") == "Darwin\n") || $SSH_FROM_MAC
    nnoremap <silent> ˙ :TmuxNavigateLeft<CR>
    nnoremap <silent> ∆ :TmuxNavigateDown<CR>
    nnoremap <silent> ˚ :TmuxNavigateUp<CR>
    nnoremap <silent> ¬ :TmuxNavigateRight<CR>
  else
    nnoremap <silent> <A-h> :TmuxNavigateLeft<CR>
    nnoremap <silent> <A-j> :TmuxNavigateDown<CR>
    nnoremap <silent> <A-k> :TmuxNavigateUp<CR>
    nnoremap <silent> <A-l> :TmuxNavigateRight<CR>
  endif

endif " End plugin config if
