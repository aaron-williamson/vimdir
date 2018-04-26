" This file is here for compatibility with vim, only used when I'm not using neovim, and it can't
" just be a link since I sometimes use windows
if has('win32') || has('win32unix') || has('win64')
  source $HOME/vimfiles/init.vim
else
  source $HOME/.vim/init.vim
endif
