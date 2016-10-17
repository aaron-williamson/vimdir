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
  noremap <Leader>1 <Plug>AirlineSelectTab1
  noremap <Leader>2 <Plug>AirlineSelectTab2
  noremap <Leader>3 <Plug>AirlineSelectTab3
  noremap <Leader>4 <Plug>AirlineSelectTab4
  noremap <Leader>5 <Plug>AirlineSelectTab5
  noremap <Leader>6 <Plug>AirlineSelectTab6
  noremap <Leader>7 <Plug>AirlineSelectTab7
  noremap <Leader>8 <Plug>AirlineSelectTab8
  noremap <Leader>9 <Plug>AirlineSelectTab9

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
  nnoremap <Leader>a :LAck<Space>

  " Specific configuration if we have the silver searcher installed
  if executable('ag')
    " Use ag for ack
    let g:ackprg = 'ag --vimgrep'

    " Use ag for ctrlp
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  endif

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

endif " End plugin config if
