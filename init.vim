" Aaron Williamson's init.vim
" This file just ties together my other configuration files, see them for more
" information

" Whether or not we're on macos
let g:on_macos = ((has("unix") && system("uname -s") == "Darwin\n"))

" Whether or not we're on windows
let g:on_windows = has('win32') || has('win32unix') || has('win64')

" Make sure we're reading the right config files
if g:on_windows
  let g:vim_dir = '$HOME/vimfiles'
else
  let g:vim_dir = '$HOME/.vim'
endif

" --- EXCLUDE FROM COMBINED ---
" Process all vim config files in order -- From Aaron Bieber
for filename in sort(split(glob(g:vim_dir.'/config/*.vim'), '\n'))
  execute 'source '.filename
endfor
