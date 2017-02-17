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
