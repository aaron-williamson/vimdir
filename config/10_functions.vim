" This contains all functions for my vim config

function! TabOrBufferNext()
  if tabpagenr('$') == 1
    bnext
  else
    tabnext
  endif
endfunction

function! TabOrBufferPrevious()
  if tabpagenr('$') == 1
    bprevious
  else
    tabprevious
  endif
endfunction

function! ToggleSpelling()
  if &spell
    set nospell
  else
    setlocal spell spelllang=en_us
  endif
endfunction
