" This contains all functions for my vim config

" Toggle paste function
function! TogglePasteMode(after_mode)
  if &paste
    set nopaste
    echo "Disabled paste mode"
  else
    set paste
    if a:after_mode == "i"
      startinsert
    elseif a:after_mode == "o"
      normal o
    end
  end
endfunction

" Toggle highlight function
function! ToggleHighlightSearch()
  if &hlsearch
    set nohlsearch
    echo "Disabled search highlighting"
  else
    set hlsearch
    echo "Enabled search highlighting"
  end
endfunction
