" Configuration for my vim plugins

" Don't configure plugins if we don't want plugins
if !$NO_VIM_PLUGINS

  " Fugitive mappings (matches my git aliases)
  noremap <Leader>gst :Gstatus<CR>
  noremap <Leader>glg :Gvsplit! log --graph --oneline<CR>
  noremap <Leader>glp :Gvsplit! log --graph --oneline -p<CR>
  noremap <Leader>gdi :Gvsplit! diff<CR>
  noremap <Leader>gdc :Gvsplit! diff --cached<CR>
  noremap <Leader>gdt :Gvdiff<CR>
  noremap <Leader>gci :Gcommit<CR>

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
  nnoremap <Leader>a :Ack<Space>

  " Specific configuration if we have the silver searcher installed
  if executable('rg')
    " Use rg for ack
    let g:ackprg = 'rg --vimgrep'

    " Use rg for ctrlp
    let g:ctrlp_user_command = 'rg -l --color never --hidden "" %s'
  elseif executable('ag')
    " Use ag for ack
    let g:ackprg = 'ag --vimgrep'

    " Use ag for ctrlp
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  endif

  " Markdown plugin configuration
  let g:vim_markdown_no_default_key_mappings = 1

  " CtrlP configuration
  let g:ctrlp_switch_buffer       = 't'
  let g:ctrlp_open_multiple_files = 't'
  let g:ctrlp_match_window        = 'max:25,results:50'

  " Color scheme
  silent! colorscheme base16-summerfruit-dark

  " Vim-tmux-navigator mappings
  let g:tmux_navigator_no_mappings = 1
  if (g:on_macos || $SSH_FROM_MAC) && $TMUX != ''
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
  vmap <Leader>= :Tabularize /=<CR>

endif " End plugin config if
