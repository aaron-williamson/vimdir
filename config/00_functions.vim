" This contains all functions for my vim config

" Move to the next tab or buffer
function! TabOrBufferNext(count)
  " If we only have one tab, change buffers
  if tabpagenr('$') == 1
    if a:count == 0
      bnext
    else
      execute a:count "bnext"
    endif
  else " Otherwise change tabs
    if a:count == 0
      tabnext
    else
      execute a:count "tabnext"
    endif
  endif
endfunction

" Same as above, but backwards
function! TabOrBufferPrevious(count)
  if tabpagenr('$') == 1
    if a:count == 0
      bprevious
    else
      execute a:count "bprevious"
    endif
  else
    if a:count == 0
      tabprevious
    else
      execute a:count "tabprevious"
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
      execute l:adjusted_count "tab" "split"
    else
      tab split
    endif
  else " If there's more than one window in the current split
    " Record the tab number then close the split
    let l:current_buffer = bufnr('%')
    close!

    " Then move it to the desired position
    if a:count > 0
      execute l:adjusted_count "tab" "split"
      execute "buffer" l:current_buffer
    else
      tab split
      execute "buffer" l:current_buffer
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

" This function will enable my preferred writing settings and center the
" text nicely, though it requires there to be only one split.
function! WritingMode()
  " Can't do it if there's more than one split
  if winnr('$') > 1
    echoerr "Cannot enable writing mode in a window with more than one split"
    return
  endif
  
  " Make sure we have enough room before doing the split to center text
  " With nu and rnu it's 4 extra width and we need 78 for the text
  if winwidth('%') > 82
    " Make sure we don't split right
    let l:splitright = v:false
    if &splitright
      let l:splitright = v:true
      set nosplitright
    endif

    " Now create and size the split
    let l:availablewidth = winwidth('%') - 82
    let l:splitwidth = l:availablewidth / 2
    execute l:splitwidth . " vnew"

    " Disable numbers
    setlocal nonumber
    setlocal norelativenumber

    " Restore splitright setting
    if l:splitright
      set splitright
    endif

    " Switch back to buffer for editing
    wincmd l
  endif

  " Then enable spelling mode
  setlocal spell spelllang=en_us,en_ca

  " Set text width
  setlocal textwidth=78

  " And set color column
  setlocal colorcolumn=79
endfunction

function! ToggleFoldMethod()
  " Toggles nicely between manual and indent fold methods
  if &foldmethod == "manual"
    set foldlevel=0
    set foldmethod=indent
    set foldlevel=20
  else
    set foldmethod=manual
    normal zE
  endif
endfunction

" Custom mappings for netrw
function! NetrwMappings()
  noremap <buffer> <Esc> :Rex<CR>
endfunction

" Tag for paste mode
function! StatusPasteMode()
  if &paste
    return "[Paste]"
  else
    return ""
  end
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
    return printf("%d:%d", indent_tabs, indent_spc)
  else
    return ''
  endif
endfunction

" Function to tie all whitespace checks together
function! StatusWhitespaceChecks()
  " Only run these checks on reasonably sized files that we can modify
  if &readonly || !&modifiable || line('$') > 20000
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

    let b:whitespace_check = substitute(b:whitespace_check, "^[ ]*", "", "")
  endif

  return b:whitespace_check
endfunction

function! RefreshWhitespaceCheck()
  unlet! b:airline_whitespace_check
endfunction
