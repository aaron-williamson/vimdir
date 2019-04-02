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
  let g:markdown_composer_autostart = 0
  nmap <Leader>mp :ComposerStart<CR>
  nmap <Leader>mo :ComposerOpen<CR>

  " FZF
  let g:fzf_command_prefix = 'Fzf'
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  nmap <C-p> :FzfFiles<CR>
  nmap <Leader>fb :FzfBuffers<CR>
  nmap <Leader>fc :FzfBCommits<CR>
  nmap <Leader>fC :FzfCommits<CR>
  nmap <Leader>ff :FzfFiles<CR>
  nmap <Leader>fg :FzfGFiles<CR>
  nmap <Leader>fG :FzfGFiles?<CR>
  nmap <Leader>fhc :FzfHistory:<CR>
  nmap <Leader>fhf :FzfHistory<CR>
  nmap <Leader>fhs :FzfHistory/<CR>
  nmap <Leader>fH :FzfHelptags<CR>
  nmap <Leader>fl :FzfBLines<CR>
  nmap <Leader>fL :FzfLines<CR>
  nmap <Leader>fm :FzfCommands<CR>
  nmap <Leader>fM :FzfMarks<CR>
  nmap <Leader>ft :FzfBTags<CR>
  nmap <Leader>fT :FzfTags<CR>
  nmap <Leader>fw :FzfWindows<CR>

  " Easymotion config
  let g:EasyMotion_smartcase = 1

  " Color scheme
  augroup UserHighlight
    autocmd!

    " Use an autocommand to set user colors for statusline so that it doesn't get cleared by color
    " scheme
    autocmd ColorScheme *
          \ execute 'highlight User1 guifg=#' . g:base16_gui02 . ' guibg=#' . g:base16_gui0D
          \ . ' ctermfg=' . g:base16_cterm02 . ' ctermbg=' . base16_cterm0D . ' gui=bold cterm=bold'
          \ | execute 'highlight User2 guifg=#' . g:base16_gui02 . ' guibg=#' . g:base16_gui0B
          \ . ' ctermfg=' . g:base16_cterm02 . ' ctermbg=' . base16_cterm0B . ' gui=bold cterm=bold'
          \ | execute 'highlight User3 guifg=#' . g:base16_gui02 . ' guibg=#' . g:base16_gui0E
          \ . ' ctermfg=' . g:base16_cterm02 . ' ctermbg=' . base16_cterm0E . ' gui=bold cterm=bold'
          \ | execute 'highlight User4 guifg=#' . g:base16_gui02 . ' guibg=#' . g:base16_gui08
          \ . ' ctermfg=' . g:base16_cterm02 . ' ctermbg=' . base16_cterm08 . ' gui=bold cterm=bold'
  augroup END

  let g:base16colorspace=256
  silent! colorscheme base16-summerfruit-dark

  " Vim-tmux-navigator mappings
  let g:tmux_navigator_no_mappings = 1
  if $TMUX !=# ''
    noremap <silent> <C-h> :TmuxNavigateLeft<CR>
    noremap <silent> <C-j> :TmuxNavigateDown<CR>
    noremap <silent> <C-k> :TmuxNavigateUp<CR>
    noremap <silent> <C-l> :TmuxNavigateRight<CR>
  endif

  " Quicker tabularize command writing
  cabbrev Tab Tabularize
  vmap <Leader>= :Tabularize /=<CR>

  " Yankring mappings
  nmap <Leader>p <Plug>(miniyank-startput)
  vmap <Leader>p <Plug>(miniyank-startput)
  nmap <Leader>PP <Plug>(miniyank-startPut)
  nmap <Leader>PN <Plug>(miniyank-cycle)
  nmap <Leader>PC <Plug>(miniyank-tochar)
  nmap <Leader>PL <Plug>(miniyank-toline)
  nmap <Leader>PB <Plug>(miniyank-toblock)

  " Ale configuration
  let g:ale_enabled = 0
  let g:ale_lint_delay = 750
  let g:ale_sign_column_always = 1
  let g:ale_lint_on_insert_leave = 1
  let g:ale_python_auto_pipenv = 1
  nmap <Leader>AD :ALEDisable <Bar> execute 'sign unplace ' . g:ale_sign_offset<CR>
  nmap <Leader>AE :ALEEnable<CR>
  nmap <Leader>AL <Plug>(ale_lint)
  nmap <Leader>Ad :ALEDetail<CR>

  " Automatically open quickfix list when AsyncRun writes to it
  let g:asyncrun_quickfix_size = 8
  augroup asyncRunOpenQF
    autocmd!
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(g:asyncrun_quickfix_size, 1)
  augroup END

  " vimtex config
  let g:vimtex_view_method = 'skim'
  let g:vimtex_quickfix_open_on_warning = 0
  let g:vimtex_imaps_enabled = 0
  if has('nvim') && executable('nvr')
    let g:vimtex_compiler_progname = 'nvr'
  endif

  " Configuration for Goyo and Limelight
  " 100 width instead of default 80
  let g:goyo_width = 100

  " Slightly more focus
  let g:limelight_default_coefficient = 0.8

  " Function and command for toggling writing mode + Goyo and Limelight
  function! FocusMode()
    execute 'Goyo'
    call WritingMode()
  endfunction
  command! -nargs=0 FocusMode call FocusMode()

  " Enable JSX in files that don't end in .jsx
  let g:jsx_ext_required = 0

  " Editor config settings
  let g:EditorConfig_core_mode = 'external_command'
  let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']

  " Vim polyglot settings
  let g:polyglot_disabled = ['latex'] " Disable polyglot so vimtex works correctly

  " Visual Star settings
  nnoremap <Leader>* :<C-U>execute 'Ack ' . shellescape(expand("<cword>"))<CR>
  vnoremap <Leader>* :<C-U>call VisualStarSearchSet('/')<CR>:execute "Ack '" . @/ . "'"<CR>

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
