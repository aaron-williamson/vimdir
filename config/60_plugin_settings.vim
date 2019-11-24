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

  " Automatically open quickfix list when AsyncRun writes to it
  let g:asyncrun_quickfix_size = 8
  augroup asyncRunOpenQF
    autocmd!
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(g:asyncrun_quickfix_size, 1)
  augroup END

  " Enable JSX in files that don't end in .jsx
  let g:jsx_ext_required = 0

  " Editor config settings
  let g:EditorConfig_core_mode = 'external_command'
  let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']

  " Visual Star settings
  nnoremap <Leader>* :<C-U>execute 'Ack ' . shellescape(expand("<cword>"))<CR>
  vnoremap <Leader>* :<C-U>call VisualStarSearchSet('/')<CR>:execute "Ack '" . @/ . "'"<CR>

  " Emmet settings
  let g:user_emmet_install_global = 0
  augroup EmmetSettings
    autocmd!

    autocmd FileType html,css,eruby EmmetInstall
  augroup END
  let g:startify_custom_header = []
  let g:startify_change_to_vcs_root = 1

endif " End plugin config if
