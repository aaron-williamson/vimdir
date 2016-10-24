" This contains all functions for my vim config

function! TabOrBufferNext(count)
  if tabpagenr('$') == 1
    execute a:count "bnext"
  else
    execute a:count "tabnext"
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
    execute l:adjusted_count "tab" "split"
  else
    let l:current_buffer = bufnr('%')
    close!
    execute l:adjusted_count "tab" "split"
    execute "buffer" l:current_buffer
  endif
endfunction

function! ToggleSpelling()
  if &spell
    set nospell
  else
    setlocal spell spelllang=en_us
  endif
endfunction
