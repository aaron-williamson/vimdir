" My plugins

" Don't load plugins if we don't want to
if !$NO_VIM_PLUGINS

  " Turn filetype off for vundle
  filetype off

  " Set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " Enable vundle
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'chriskempson/base16-vim'          " Base 16 color schemes
  Plugin 'rust-lang/rust.vim'               " Syntax highlighting for rust
  Plugin 'tpope/vim-rails'                  " Extra functions for rails
  Plugin 'pangloss/vim-javascript'          " Improved javascript support
  Plugin 'tpope/vim-fugitive'               " Fugitive for git integration
  Plugin 'michaeljsmith/vim-indent-object'  " Adds a indent-based text object
  Plugin 'mileszs/ack.vim'                  " Ack plugin for vim
  Plugin 'ctrlpvim/ctrlp.vim'               " CtrlP for fuzzy find/open
  Plugin 'skywind3000/asyncrun.vim'         " Easy asynchronous command running
  Plugin 'vim-airline/vim-airline'          " Airline for better statusbar
  Plugin 'vim-airline/vim-airline-themes'   " Themes for Airline
  Plugin 'plasticboy/vim-markdown'          " Better highlighting for markdown
  Plugin 'terryma/vim-multiple-cursors'     " Sublime-text style multiple cursors
  Plugin 'tpope/vim-surround'               " Surround for quoting/brackets/html
  Plugin 'tpope/vim-unimpaired'             " Some handy bracket mappings
  Plugin 'christoomey/vim-tmux-navigator'   " Allow seamless movement between vim and tmux

  " End vundle
  call vundle#end()

  " Turn filetype back on
  filetype plugin indent on

endif " End plugin load if
