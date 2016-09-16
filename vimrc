" Aaron Williamson's Vimrc
" This file just ties together my other configuration files, see them for more
" information

" Process all vim config files in order -- From Aaron Bieber
for filename in sort(split(glob('~/.vim/config/*.vim'), '\n'))
  execute 'source '.filename
endfor
