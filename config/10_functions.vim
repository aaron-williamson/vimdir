" This contains all functions for my vim config

function! TabOrBufferNext(count)
  if tabpagenr('$') == 1
    if a:count == 0
      bnext
    else
      execute a:count "bnext"
    endif
  else
    if a:count == 0
      tabnext
    else
      execute a:count "tabnext"
    endif
  endif
endfunction

function! TabOrBufferPrevious(count)
  if tabpagenr('$') == 1
    execute a:count "bprevious"
  else
    execute a:count "tabprevious"
  endif
endfunction

function! PullToNewTab(count)
  let l:adjusted_count = a:count - 1
  if winnr('$') == 1
    if a:count > 0
      execute l:adjusted_count "tab" "split"
    else
      tab split
    endif
  else
    let l:current_buffer = bufnr('%')
    close!
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
  if &spell
    set nospell
  else
    setlocal spell spelllang=en_us
  endif
endfunction

function! ToggleFoldMethod()
  if &foldmethod == "manual"
    set foldlevel=0
    set foldmethod=indent
    set foldlevel=20
  else
    set foldmethod=manual
    normal zE
  endif
endfunction
