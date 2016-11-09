" My plugins

" Don't load plugins if we don't want to
if !$NO_VIM_PLUGINS

  " Turn filetype off for vundle
  filetype off

  " Set the runtime path to include Vundle and initialize
  execute "set runtimepath+=".g:vim_dir."/bundle/Vundle.vim"
  call vundle#begin()

  " Enable vundle
  Plugin 'VundleVim/Vundle.vim'


  " Language plugins
  Plugin 'rust-lang/rust.vim'      " Syntax highlighting for rust
  Plugin 'tpope/vim-rails'         " Extra functions for rails
  Plugin 'pangloss/vim-javascript' " Improved javascript support
  Plugin 'plasticboy/vim-markdown' " Better highlighting for markdown
  Plugin 'tmux-plugins/vim-tmux'   " Syntax and better manual usage for tmux conf

  " Workflow/command plugins
  Plugin 'tpope/vim-fugitive'              " Fugitive for git integration
  Plugin 'michaeljsmith/vim-indent-object' " Adds a indent-based text object
  Plugin 'mileszs/ack.vim'                 " Ack plugin for vim
  Plugin 'ctrlpvim/ctrlp.vim'              " CtrlP for fuzzy find/open
  Plugin 'skywind3000/asyncrun.vim'        " Easy asynchronous command running
  Plugin 'terryma/vim-multiple-cursors'    " Sublime-text style multiple cursors
  Plugin 'tpope/vim-surround'              " Surround for quoting/brackets/html
  Plugin 'tpope/vim-unimpaired'            " Some handy bracket mappings
  Plugin 'godlygeek/tabular'               " Automatic alignment
  Plugin 'tpope/vim-repeat'                " Allow repeating supported plugins

  " Tmux integration plugins
  Plugin 'tmux-plugins/vim-tmux-focus-events' " Focus events for clipboard integration (Not necessary for neovim)
  Plugin 'christoomey/vim-tmux-navigator'     " Allow seamless movement between vim and tmux
  Plugin 'roxma/vim-tmux-clipboard'           " Tmux clipboard integration

  " Customization
  Plugin 'chriskempson/base16-vim'        " Base 16 color schemes
  Plugin 'vim-airline/vim-airline'        " Airline for better statusbar
  Plugin 'vim-airline/vim-airline-themes' " Themes for Airline
  "Plugin 'xolox/vim-colorscheme-switcher' " Colorscheme switcher, useful for testing out new colorschemes
  "Plugin 'xolox/vim-misc'                 " required for colorscheme switcher

  " End vundle
  call vundle#end()

  " Turn filetype back on
  filetype plugin indent on

endif " End plugin load if
