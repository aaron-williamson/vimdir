" Configuration for my vim plugins
scriptencoding UTF-8

" Don't configure plugins if we don't want plugins
if exists('g:loading_plugins')

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
  let g:vim_markdown_new_list_item_indent = 2
  let g:vim_markdown_math = 1

  " Livedown for markdown preview
  let g:markdown_composer_autostart = 0
  map <Leader>mp :ComposerStart<CR>
  map <Leader>mo :ComposerOpen<CR>

  " FZF
  let g:fzf_command_prefix = 'Fzf'
  let g:fzf_history_dir = '~/.local/share/fzf-history'
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

  " Ale configuration
  let g:ale_enabled = 0
  let g:ale_lint_delay = 750
  let g:ale_sign_column_always = 1
  let g:ale_lint_on_insert_leave = 1
  map <Leader>AT :ALEToggle<CR>
  map <Leader>AD :ALEDisable<CR>
  map <Leader>AE :ALEEnable<CR>
  map <Leader>AL <Plug>(ale_lint)
  map <Leader>AI :ALEInfo<CR>
  map <Leader>Ad :ALEDetail<CR>

  " Automatically open quickfix list when AsyncRun writes to it
  let g:asyncrun_quickfix_size = 8
  augroup asyncRunOpenQF
    autocmd!
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(g:asyncrun_quickfix_size, 1)
  augroup END

  " vimtex config
  let g:vimtex_view_method = 'skim'
  if has('nvim') && executable('nvr')
    let g:vimtex_compiler_progname = 'nvr'
  endif

  " Configuration for Goyo and Limelight
  " 100 width instead of default 80
  let g:goyo_width = 100

  " Slightly more focus
  let g:limelight_default_coefficient = 0.8

  " Automatically enable Limelight with Goyo
  augroup focusedWriting
    autocmd!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
  augroup END

  " Enable JSX in files that don't end in .jsx
  let g:jsx_ext_required = 0

  " Editor config settings
  let g:EditorConfig_core_mode = 'external_command'
  let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']

  " Deoplete settings
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#option({
        \ 'auto_complete': v:false
        \})
  inoremap <silent><expr> <C-n> deoplete#mappings#manual_complete()

  " vim-startify config, disable doublequote lint since I wasn't able to do
  " this with single quotes
  " vint: -ProhibitUnnecessaryDoubleQuote
  if has('nvim')
    let g:ascii_header = [
          \ "     ...     ...                              .....     .      ...     ..      ..",
          \ "  .=*8888n..\"%888:                          .d88888Neu. 'L   x*8888x.:*8888: -\"888:",
          \ " X    ?8888f '8888        ...     ..        F\"\"\"\"*8888888F  X   48888X `8888H  8888",
          \ " 88x. '8888X  8888>    :~\"\"888h.:^\"888:    *      `\"*88*\"  X8x.  8888X  8888X  !888>",
          \ "'8888k 8888X  '\"*8h.  8X   `8888X  8888>    -....    ue=:. X8888 X8888  88888   \"*8%-",
          \ " \"8888 X888X .xH8    X888n. 8888X  ?888>           :88N  ` '*888!X8888> X8888  xH8>",
          \ "   `8\" X888!:888X    '88888 8888X   ?**h.          9888L     `?8 `8888  X888X X888>",
          \ "  =~`  X888 X888X      `*88 8888~ x88x.     uzu.   `8888L    -^  '888\"  X888  8888>",
          \ "   :h. X8*` !888X     ..<\"  88*`  88888X  ,\"\"888i   ?8888     dx '88~x. !88~  8888>",
          \ "  X888xX\"   '8888..:     ..XC.    `*8888k 4  9888L   %888>  .8888Xf.888x:!    X888X.:",
          \ ":~`888f     '*888*\"    :888888H.    `%88> '  '8888   '88%  :\"\"888\":~\"888\"     `888*\"",
          \ "    \"\"        `\"`     <  `\"888888:    X\"       \"*8Nu.z*\"       \"~'    \"~        \"\"",
          \ "                            %888888x.-`",
          \ "                              \"\"**\"\""
          \]
  else
    let g:ascii_header = [
          \ "                         .....     .      ...     ..      ..",
          \ "                       .d88888Neu. 'L   x*8888x.:*8888: -\"888:",
          \ "     ...     ..        F\"\"\"\"*8888888F  X   48888X `8888H  8888",
          \ "  :~\"\"888h.:^\"888:    *      `\"*88*\"  X8x.  8888X  8888X  !888>",
          \ " 8X   `8888X  8888>    -....    ue=:. X8888 X8888  88888   \"*8%-",
          \ "X888n. 8888X  ?888>           :88N  ` '*888!X8888> X8888  xH8>",
          \ "'88888 8888X   ?**h.          9888L     `?8 `8888  X888X X888>",
          \ "  `*88 8888~ x88x.     uzu.   `8888L    -^  '888\"  X888  8888>",
          \ " ..<\"  88*`  88888X  ,\"\"888i   ?8888     dx '88~x. !88~  8888>",
          \ "    ..XC.    `*8888k 4  9888L   %888>  .8888Xf.888x:!    X888X.:",
          \ "  :888888H.    `%88> '  '8888   '88%  :\"\"888\":~\"888\"     `888*\"",
          \ " <  `\"888888:    X\"       \"*8Nu.z*\"       \"~'    \"~        \"\"",
          \ "       %888888x.-`",
          \ "         \"\"**\"\""
          \]
  endif

  let g:startify_custom_header = map(g:ascii_header, '"   " . v:val')
  " vint: +ProhibitUnnecessaryDoubleQuote

endif " End plugin config if
