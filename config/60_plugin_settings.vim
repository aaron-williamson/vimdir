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
  noremap <Leader>gbl :Gblame<CR>

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

  " Specific configuration for ripgrep or the silver searcher
  if executable('rg')
    " Use rg for ack
    let g:ackprg = 'rg --vimgrep'
  elseif executable('ag')
    " Use ag for ack
    let g:ackprg = 'ag --vimgrep'
  endif

  " Markdown plugin configuration
  let g:vim_markdown_no_default_key_mappings = 1

  " FZF configuration
  map <C-p> :FZF<CR>

  " Color scheme
  silent! colorscheme base16-summerfruit-dark

  " Vim-tmux-navigator mappings
  let g:tmux_navigator_no_mappings = 1
  if $TMUX != ''
    if (g:on_macos || $SSH_FROM_MAC)
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
  endif

  " Quicker tabularize command writing
  cabbrev Tab Tabularize
  vmap <Leader>= :Tabularize /=<CR>

endif " End plugin config if
