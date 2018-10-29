" This contains all functions for my vim config

" Move to the next tab or buffer
function! ChangeTabOrBuffer(count, next_or_prev)
  " If we only have one tab, change buffers
  if tabpagenr('$') == 1
    if a:count > 0
      execute 'b' . a:next_or_prev a:count
    else
      execute 'b' . a:next_or_prev
    endif
  else " Otherwise change tabs
    if a:count > 0
      execute 'tab' . a:next_or_prev a:count
    else
      execute 'tab' . a:next_or_prev
    endif
  endif
endfunction

" This function pulls the current tab into a new tab, unlike the built-in
" CTRL-W_T, this will work even when there's only one window
function! PullToNewTab(count)
  " If there's only one split in the current window
  if winnr('$') == 1
    " Move it to the desired position
    if a:count > 0
      execute a:count 'tab' 'split'
    else
      tab split
    endif
  else " If there's more than one window in the current split
    " Record the tab number then close the split
    let l:current_buffer = bufnr('%')
    close!

    " Then move it to the desired position
    if a:count > 0
      execute a:count 'tab' 'split'
      execute 'buffer' l:current_buffer
    else
      tab split
      execute 'buffer' l:current_buffer
    endif
  endif
endfunction

" This function will center the window, but only if there is only one split
function! Center(...)
  " Check number of args, if there was zero, default to 100 width
  if a:0 is 0
    let l:min_width = 100
  else
    let l:min_width = a:1
  endif

  " Can't do it if there's more than one split, or if there isn't enough room
  " on the screen
  if winnr('$') > 1
    echom 'Cannot center in a tab page with more than one window'
    return
  elseif winwidth('%') < l:min_width + 1
    echom 'Cannot center window, not enough columns'
    return
  endif

  " Make sure we don't split right
  let l:splitright = 0
  if &splitright
    let l:splitright = 1
    set nosplitright
  endif

  " Now create and size the split
  let l:availablewidth = winwidth('%') - l:min_width + 1
  let l:splitwidth = l:availablewidth / 2
  execute l:splitwidth . ' vnew'

  " Restore splitright setting
  if l:splitright
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
    let b:writing_mode_old_spell = &spell
    setlocal spell

    " Set text width
    let b:writing_mode_old_textwidth = &textwidth
    setlocal textwidth=100

    " And set color column
    let b:writing_mode_old_colorcolumn = &colorcolumn
    setlocal colorcolumn=101
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
    if !b:writing_mode_old_spell
      setlocal nospell
    endif

    " Restore text width
    execute 'setlocal textwidth=' . b:writing_mode_old_textwidth

    " Restore color column
    execute 'setlocal colorcolumn=' . b:writing_mode_old_colorcolumn

    " Unlet variables
    unlet b:writing_mode_old_number
    unlet b:writing_mode_old_relnumber
    unlet b:writing_mode_old_spell
    unlet b:writing_mode_old_textwidth
    unlet b:writing_mode_old_colorcolumn
    unlet b:writing_mode
  endif
endfunction

" Toggles nicely between manual, indent, and marker fold methods
function! ToggleFoldMethod()
  if &foldmethod ==# 'manual'
    set foldlevel=0
    set foldmethod=indent
    set foldlevel=20
  elseif &foldmethod ==# 'indent'
    set foldmethod=marker
  else
    set foldmethod=manual
    normal! zE
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

" Tag for current editing mode
function! StatusMode()
  let l:mode = mode()

  if l:mode =~# 'n\|c'
    return '%1* NORMAL'
  elseif l:mode ==# 'i'
    return '%2* INSERT'
  elseif l:mode ==# 'v'
    return '%3* VISUAL'
  elseif l:mode ==# 'V'
    return '%3* V-LINE'
  elseif l:mode ==# ''
    return '%3* V-BLOCK'
  elseif l:mode =~# 'R'
    return '%4* REPLACE'
  elseif l:mode ==# 't'
    return '%2* TERMINAL'
  else
    return '%1* ' . l:mode
  endif
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
    return '[Writing | ' . wordcount()['words'] . ']'
  else
    return ''
  endif
endfunction

" Tag for fold method
function! StatusFoldMethod()
  return '[' . &foldmethod . ']'
endfunction

" Text width for status line
function! StatusTextWidth()
  if &textwidth
    return '/' . &textwidth
  else
    return ''
  endif
endfunction

" Whitespace checks, next few functions heavily influenced by vim-airline
" https://github.com/vim-airline/vim-airline
function! CheckMixedIndentFile()
  let l:c_like_langs = [ 'c', 'cpp', 'cuda', 'go', 'javascript', 'ld', 'php' ]
  if index(l:c_like_langs, &filetype) > -1
    " for C-like languages: allow /** */ comment style with one space before the '*'
    let l:head_spc = '\v(^ +\*@!)'
  else
    let l:head_spc = '\v(^ +)'
  endif

  let l:indent_tabs = search('\v(^\t+)', 'nw')
  let l:indent_spc  = search(l:head_spc, 'nw')
  if l:indent_tabs > 0 && l:indent_spc > 0
    return printf('%d:%d', l:indent_tabs, l:indent_spc)
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
    let l:checks = get(g:, 'whitespace_checks', ['mixed-indent', 'trailing', 'mixed-indent-file'])

    let l:trailing = 0
    if index(l:checks, 'trailing') > -1
      let l:trailing = search('\s$', 'nw')
    endif

    let l:mixed = 0
    if index(l:checks, 'mixed-indent') > -1
      let l:mixed = search('\v(^\t+ +)|(^ +\t+)', 'nw')
    endif

    let l:mixed_file = ''
    if index(l:checks, 'mixed-indent-file') > -1
      let l:mixed_file = CheckMixedIndentFile()
    endif

    let l:long = 0
    if index(l:checks, 'long') > -1 && &textwidth > 0
      let l:long = search('\%>'.&textwidth.'v.\+', 'nw')
    endif

    if l:trailing != 0
      let b:whitespace_check .= printf(' [%s]trailing', l:trailing)
    endif
    if l:mixed != 0
      let b:whitespace_check .= printf(' [%s]mixed-indent', l:mixed)
    endif
    if l:long != 0
      let b:whitespace_check .= printf(' [%s]long', l:long)
    endif
    if !empty(l:mixed_file)
      let b:whitespace_check .= printf(' [%s]mixed-indent-file', l:mixed_file)
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
