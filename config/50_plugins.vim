" My plugins

" Don't load plugins if we don't want to
if !$NO_VIM_PLUGINS

  " vim-plug: https://github.com/junegunn/vim-plug
  call plug#begin(g:vim_dir . "/plugins")

  " Language plugins
  Plug 'rust-lang/rust.vim'      " Syntax highlighting for rust
  Plug 'tpope/vim-rails'         " Extra functions for rails
  Plug 'pangloss/vim-javascript' " Improved javascript support
  Plug 'plasticboy/vim-markdown' " Better highlighting for markdown
  Plug 'tmux-plugins/vim-tmux'   " Syntax and better manual usage for tmux conf

  " Workflow/command plugins
  Plug 'tpope/vim-fugitive'              " Fugitive for git integration
  Plug 'michaeljsmith/vim-indent-object' " Adds a indent-based text object
  Plug 'mileszs/ack.vim'                 " Ack plugin for vim
  Plug 'ctrlpvim/ctrlp.vim'              " CtrlP for fuzzy find/open
  Plug 'skywind3000/asyncrun.vim'        " Easy asynchronous command running
  Plug 'terryma/vim-multiple-cursors'    " Sublime-text style multiple cursors
  Plug 'tpope/vim-surround'              " Surround for quoting/brackets/html
  Plug 'tpope/vim-unimpaired'            " Some handy bracket mappings
  Plug 'godlygeek/tabular'               " Automatic alignment
  Plug 'tpope/vim-repeat'                " Allow repeating supported plugins

  " Tmux integration plugins
  if $TMUX != ''
    Plug 'christoomey/vim-tmux-navigator' " Allow seamless movement between vim and tmux
    Plug 'roxma/vim-tmux-clipboard'       " Tmux clipboard integration

    " We only need this if we're using tmux with traditional vim
    if !has('nvim')
      Plug 'aaron-williamson/vim-tmux-focus-events' " Focus events for clipboard integration
    endif
  endif

  " Customization
  Plug 'chriskempson/base16-vim'        " Base 16 color schemes
  Plug 'vim-airline/vim-airline'        " Airline for better statusbar
  Plug 'vim-airline/vim-airline-themes' " Themes for Airline
  "Plug 'xolox/vim-colorscheme-switcher' " Colorscheme switcher, useful for testing out new colorschemes
  "Plug 'xolox/vim-misc'                 " required for colorscheme switcher

  call plug#end()

endif " End plugin load if
