" This contains all functions for my vim config

" Move to the next tab or buffer
function! TabOrBufferNext(count)
  " If we only have one tab, change buffers
  if tabpagenr('$') == 1
    if a:count == 0
      bnext
    else
      execute a:count 'bnext'
    endif
  else " Otherwise change tabs
    if a:count == 0
      tabnext
    else
      execute a:count 'tabnext'
    endif
  endif
endfunction

" Same as above, but backwards
function! TabOrBufferPrevious(count)
  if tabpagenr('$') == 1
    if a:count == 0
      bprevious
    else
      execute a:count 'bprevious'
    endif
  else
    if a:count == 0
      tabprevious
    else
      execute a:count 'tabprevious'
    endif
  endif
endfunction

" This function pulls the current tab into a new tab, unlike the built-in
" CTRL-W_T, this will work even when there's only one window
function! PullToNewTab(count)
  " Need to subtract one from count to mimic CTRL-W_T behaviour
  let l:adjusted_count = a:count - 1

  " If there's only one split in the current window
  if winnr('$') == 1
    " Move it to the desired position
    if a:count > 0
      execute l:adjusted_count 'tab' 'split'
    else
      tab split
    endif
  else " If there's more than one window in the current split
    " Record the tab number then close the split
    let l:current_buffer = bufnr('%')
    close!

    " Then move it to the desired position
    if a:count > 0
      execute l:adjusted_count 'tab' 'split'
      execute 'buffer' l:current_buffer
    else
      tab split
      execute 'buffer' l:current_buffer
    endif
  endif
endfunction

function! ToggleSpelling()
  if &spell " If spell is enabled, disable it
    set nospell
  else " If spell is disabled, enable it to US english and CA English
    setlocal spell spelllang=en_us,en_ca
  endif
endfunction

" This function will center the window, but only if there is only one split
function! Center(min_width)
  " Can't do it if there's more than one split, or if there isn't enough room
  " on the screen
  if winnr('$') > 1
    echom 'Cannot center in a tab page with more than one window'
    return
  elseif winwidth('%') < a:min_width + 1
    echom 'Cannot center window, not enough columns'
    return
  endif

  " Make sure we don't split right
  let splitright = 0
  if &splitright
    let splitright = 1
    set nosplitright
  endif

  " Now create and size the split
  let availablewidth = winwidth('%') - a:min_width + 1
  let splitwidth = availablewidth / 2
  execute splitwidth . ' vnew'

  " Restore splitright setting
  if splitright
    set splitright
  endif

  " Switch back to buffer for editing
  wincmd l
endfunction

" This function will enable my preferred writing settings
function! WritingMode()
  if !exists('b:writing_mode')
    " disable Numbers
    let b:writing_mode_old_number = &number
    let b:writing_mode_old_relnumber = &relativenumber
    setlocal nonumber
    setlocal norelativenumber

    " Then enable spelling mode
    let b:writing_mode_old_spelllang = &spelllang
    let b:writing_mode_old_spell = &spell
    setlocal spelllang=en_ca,en_us
    setlocal spell

    " Set text width
    let b:writing_mode_old_textwidth = &textwidth
    setlocal textwidth=120

    " And set color column
    let b:writing_mode_old_colorcolumn = &colorcolumn
    setlocal colorcolumn=121
    let b:writing_mode = 'on'
  else
    " Re-enable numbers
    if b:writing_mode_old_number
      setlocal number
    endif
    if b:writing_mode_old_relnumber
      setlocal relativenumber
    endif

    " Restore spelling mode
    if b:writing_mode_old_spell
      setlocal nospell
    endif
    execute 'setlocal spelllang=' . b:writing_mode_old_spelllang

    " Restore text width
    execute 'setlocal textwidth=' . b:writing_mode_old_textwidth

    " Restore color column
    execute 'setlocal colorcolumn=' . b:writing_mode_old_colorcolumn

    " Unlet variables
    unlet b:writing_mode_old_number
    unlet b:writing_mode_old_relnumber
    unlet b:writing_mode_old_spell
    unlet b:writing_mode_old_spelllang
    unlet b:writing_mode_old_textwidth
    unlet b:writing_mode_old_colorcolumn
    unlet b:writing_mode
  endif
endfunction

function! ToggleFoldMethod()
  " Toggles nicely between manual and indent fold methods
  if &foldmethod ==# 'manual'
    set foldlevel=0
    set foldmethod=indent
    set foldlevel=20
  else
    set foldmethod=manual
    normal! zE
  endif
endfunction

" Custom mappings for netrw
function! NetrwMappings()
  noremap <buffer> <Esc> :Rex<CR>
endfunction

" Tag for paste mode
function! StatusPasteMode()
  if &paste
    return '[Paste]'
  else
    return ''
  end
endfunction

" Tag for writing mode
function! StatusWritingMode()
  if exists('b:writing_mode')
    return '[Writing]'
  else
    return ''
  endif
endfunction

" Text width for status line
function! StatusTextWidth()
  if &textwidth
    return '/' . &textwidth
  else
    return ''
  endif
endfunction

" Whitespace toggle function
function! ToggleShowWhitespace(show_space)
  " If we aren't already showing whitespace, just show whitespace in the
  " desired manner (with or without spaces)
  if !&list
    set list
    set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<

    if a:show_space
      set listchars+=space:%
    endif
  else
    " If we are already showing whitespace, check to see if the desired spaces
    " state has changed, and toggle it if it has, otherwise stop showing
    " whitespace
    if &listchars =~# 'space:' && !a:show_space
      set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<
    elseif &listchars !~# 'space:' && a:show_space
      set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<,space:%
    else
      set nolist
    endif
  endif
endfunction

" Whitespace checks, next few functions heavily influenced by vim-airline
" https://github.com/vim-airline/vim-airline
function! CheckMixedIndentFile()
  let c_like_langs = [ 'c', 'cpp', 'cuda', 'go', 'javascript', 'ld', 'php' ]
  if index(c_like_langs, &ft) > -1
    " for C-like languages: allow /** */ comment style with one space before the '*'
    let head_spc = '\v(^ +\*@!)'
  else
    let head_spc = '\v(^ +)'
  endif

  let indent_tabs = search('\v(^\t+)', 'nw')
  let indent_spc  = search(head_spc, 'nw')
  if indent_tabs > 0 && indent_spc > 0
    return printf('%d:%d', indent_tabs, indent_spc)
  else
    return ''
  endif
endfunction

" Function to tie all whitespace checks together
function! StatusWhitespaceCheck()
  " Only run these checks on reasonably sized files that we can modify
  if &readonly || !&modifiable || line('$') > 20000
    return ''
  endif

  " Make it easy to disable all checks
  if exists('b:no_whitespace_check')
    return ''
  endif

  " Don't check too frequently
  if !exists('b:whitespace_check')
    let b:whitespace_check = ''
    " Only run the checks we want to, this allows disabling or enabling checks
    " on a per file-type basis using autocmd's
    let checks = get(g:, 'whitespace_checks', ['mixed-indent', 'trailing', 'mixed-indent-file'])

    let trailing = 0
    if index(checks, 'trailing') > -1
      let trailing = search('\s$', 'nw')
    endif

    let mixed = 0
    if index(checks, 'mixed-indent') > -1
      let mixed = search('\v(^\t+ +)|(^ +\t+)', 'nw')
    endif

    let mixed_file = ''
    if index(checks, 'mixed-indent-file') > -1
      let mixed_file = CheckMixedIndentFile()
    endif

    let long = 0
    if index(checks, 'long') > -1 && &tw > 0
      let long = search('\%>'.&tw.'v.\+', 'nw')
    endif

    if trailing != 0
      let b:whitespace_check .= printf(' [%s]trailing', trailing)
    endif
    if mixed != 0
      let b:whitespace_check .= printf(' [%s]mixed-indent', mixed)
    endif
    if long != 0
      let b:whitespace_check .= printf(' [%s]long', long)
    endif
    if !empty(mixed_file)
      let b:whitespace_check .= printf(' [%s]mixed-indent-file', mixed_file)
    endif

    let b:whitespace_check = substitute(b:whitespace_check, '^[ ]*', '', '')
  endif

  return b:whitespace_check
endfunction

" Function to toggle the whitespace checker
function! ToggleWhitespaceCheck()
  if exists('b:no_whitespace_check')
    unlet b:no_whitespace_check
  else
    let b:no_whitespace_check = 'true'
  endif
endfunction
