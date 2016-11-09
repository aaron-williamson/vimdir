" Configuration for my vim plugins

" Don't configure plugins if we don't want plugins
if !$NO_VIM_PLUGINS

  " Airline config
  " Requires unicode support for separators
  if g:on_windows
    let g:airline_left_sep  = '�'
    let g:airline_right_sep = '�'
  else
    let g:airline_left_sep  = '»'
    let g:airline_right_sep = '«'
  endif
  let g:airline#extensions#tabline#enabled           = 1
  let g:airline#extensions#tabline#tab_nr_type       = 1
  let g:airline#extensions#tabline#buffer_idx_mode   = 1
  let g:airline#extensions#tabline#show_close_button = 0

  " Airline tab selection keys
  map <Leader>1 <Plug>AirlineSelectTab1
  map <Leader>2 <Plug>AirlineSelectTab2
  map <Leader>3 <Plug>AirlineSelectTab3
  map <Leader>4 <Plug>AirlineSelectTab4
  map <Leader>5 <Plug>AirlineSelectTab5
  map <Leader>6 <Plug>AirlineSelectTab6
  map <Leader>7 <Plug>AirlineSelectTab7
  map <Leader>8 <Plug>AirlineSelectTab8
  map <Leader>9 <Plug>AirlineSelectTab9

  " Fugitive mappings (matches my git aliases)
  noremap <Leader>gst :Gstatus<CR>
  noremap <Leader>glg :Gvsplit! log --graph --oneline<CR>
  noremap <Leader>glp :Gvsplit! log --graph --oneline -p<CR>
  noremap <Leader>gdi :Gvsplit! diff<CR>
  noremap <Leader>gdc :Gvsplit! diff --cached<CR>
  noremap <Leader>gdt :Gvdiff<CR>
  noremap <Leader>gci :Gcommit<CR>
  noremap <Leader>gaa :Gpedit! add --all<CR>
  noremap <Leader>gfa :Gpedit! fetch --all<CR>
  noremap <Leader>gpu :Gpush<Space>
  noremap <Leader>gpd :Gpull --ff-only<CR>

  " Multiple cursors configuration
  noremap <Leader>mf :MultipleCursorsFind<Space>
  let g:multi_cursor_exit_from_visual_mode = 0
  let g:multi_cursor_exit_from_insert_mode = 0

  " Rails mappings
  noremap <Leader>rm :Emodel<CR>
  noremap <Leader>rc :Econtroller<CR>
  noremap <Leader>rv :Eview<Space>
  noremap <Leader>rh :Ehelper<CR>
  noremap <Leader>ra :A<CR>
  noremap <Leader>rr :Einitializer<CR>

  " Ack configuration
  let g:ack_autoclose        = 1
  let g:ack_autofold_results = 1
  let g:ackpreview           = 1
  nnoremap <Leader>a :LAck!<Space>

  " Specific configuration if we have the silver searcher installed
  if executable('ag')
    " Use ag for ack
    let g:ackprg = 'ag --vimgrep'

    " Use ag for ctrlp
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  endif

  " CtrlP configuration
  let g:ctrlp_switch_buffer       = 't'
  let g:ctrlp_open_multiple_files = 't'
  let g:ctrlp_match_window        = 'max:25,results:50'

  " Color scheme but only if we have true color
  if has("termguicolors")
    set termguicolors
    silent! colorscheme base16-summerfruit-dark
  endif

  " Vim-tmux-navigator mappings
  let g:tmux_navigator_no_mappings = 1
  if g:on_macos || $SSH_FROM_MAC
    noremap <silent> ˙ :TmuxNavigateLeft<CR>
    noremap <silent> ∆ :TmuxNavigateDown<CR>
    noremap <silent> ˚ :TmuxNavigateUp<CR>
    noremap <silent> ¬ :TmuxNavigateRight<CR>
  else
    noremap <silent> <A-h> :TmuxNavigateLeft<CR>
    noremap <silent> <A-j> :TmuxNavigateDown<CR>
    noremap <silent> <A-k> :TmuxNavigateUp<CR>
    noremap <silent> <A-l> :TmuxNavigateRight<CR>
  endif

  " Quicker tabularize command writing
  cabbrev Tab Tabularize

endif " End plugin config if
