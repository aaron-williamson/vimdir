" Aaron Williamson's init.vim
" This file just ties together my other configuration files, see them for more information

" Make sure we're reading the right config files
if has('nvim')
  " Some neovim detection
  if $XDG_CONFIG_HOME !=? ''
    let g:vim_dir = '$XDG_CONFIG_HOME/nvim'
  else
    let g:vim_dir = '$HOME/.config/nvim'
  endif
else
  " Normal vim dir otherwise
  let g:vim_dir = '$HOME/.vim'
endif

" --- EXCLUDE FROM COMBINED ---
" Process all vim config files in order -- From Aaron Bieber
for s:filename in sort(split(glob(g:vim_dir.'/config/*.vim'), '\n'))
  execute 'source '.s:filename
endfor
