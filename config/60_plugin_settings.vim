" Configuration for my vim plugins

" Set scriptencoding for the special characters for MacOS
scriptencoding UTF-8

" Don't configure plugins if we don't want plugins
if exists('g:loading_plugins')

  " Fugitive mappings (matches my git aliases)
  noremap <Leader>gst :Gstatus<CR>
  noremap <Leader>glg :Gvsplit! log --graph --oneline<CR>
  noremap <Leader>glp :Gvsplit! log --graph --oneline -p<CR>
  noremap <Leader>gdi :Gvsplit! diff<CR>
  noremap <Leader>gdc :Gvsplit! diff --cached<CR>
  noremap <Leader>gdt :Gvdiff<CR>
  noremap <Leader>gci :Gcommit<CR>
  noremap <Leader>gbl :Gblame<CR>
  noremap <Leader>glg :Glog<CR>

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
    let g:ackprg = 'rg --smart-case --vimgrep'
  elseif executable('ag')
    " Use ag for ack
    let g:ackprg = 'ag --vimgrep'
  endif

  " Markdown plugin configuration
  let g:vim_markdown_no_default_key_mappings = 1

  " Livedown for markdown preview
  let g:markdown_composer_autostart = 0
  map <Leader>mp :ComposerStart<CR>
  map <Leader>mo :ComposerOpen<CR>

  " FZF
  let g:fzf_command_prefix = 'Fzf'
  let g:fzf_buffers_jump   = 1
  map <C-p> :FzfFiles<CR>
  map <Leader>fb :FzfBuffers<CR>
  map <Leader>fc :FzfBCommits<CR>
  map <Leader>fC :FzfCommits<CR>
  map <Leader>ff :FzfFiles<CR>
  map <Leader>fg :FzfGFiles<CR>
  map <Leader>fG :FzfGFiles?<CR>
  map <Leader>fhc :FzfHistory:<CR>
  map <Leader>fhf :FzfHistory<CR>
  map <Leader>fhs :FzfHistory/<CR>
  map <Leader>fH :FzfHelptags<CR>
  map <Leader>fl :FzfBLines<CR>
  map <Leader>fL :FzfLines<CR>
  map <Leader>fm :FzfCommands<CR>
  map <Leader>fM :FzfMarks<CR>
  map <Leader>ft :FzfBTags<CR>
  map <Leader>fT :FzfTags<CR>
  map <Leader>fw :FzfWindows<CR>

  " Color scheme
  silent! colorscheme base16-summerfruit-dark

  " Vim-tmux-navigator mappings
  let g:tmux_navigator_no_mappings = 1
  if $TMUX !=# ''
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

  " Yankring mappings
  map <Leader>p <Plug>(miniyank-startput)
  map <Leader>PP <Plug>(miniyank-startPut)
  map <Leader>PN <Plug>(miniyank-cycle)
  map <Leader>PC <Plug>(miniyank-tochar)
  map <Leader>PL <Plug>(miniyank-toline)
  map <Leader>PB <Plug>(miniyank-toblock)

  " Neomake makers
  let g:neomake_vim_enabled_makers  = ['vint']
  let g:neomake_sh_enabled_makers   = ['shellcheck']
  let g:neomake_ruby_enabled_makers = ['rubocop']
  let g:neomake_rust_enabled_makers = ['cargo']

  " Neomake maps
  map <Leader>nm :Neomake<CR>

  " NERDTree config
  let NERDTreeQuitOnOpen = 1
  map - :NERDTreeToggle<CR>

  " vimtex config
  let g:vimtex_view_method = 'skim'
  if has('nvim') && executable('nvr')
    let g:vimtex_compiler_progname = 'nvr'
  endif

endif " End plugin config if
