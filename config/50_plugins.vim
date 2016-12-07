" My plugins

" Don't load plugins if we don't want to
if !$NO_VIM_PLUGINS

  " vim-plug: https://github.com/junegunn/vim-plug
  call plug#begin(g:vim_dir . "/plugins")

  " -- Language plugins --
  " Rust support
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  " TOML support
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  " Extra rails functionality, too hard to do on demand, but it might do on
  " demand loading by itself
  Plug 'tpope/vim-rails'
  " Extra bundler functionality, too hard to do on demand, but it might do on
  " demand loading by itself
  Plug 'tpope/vim-bundler'
  " Improved javascript editing, does on demand loading itself I think,
  " either way on demand with vim-plug didn't seem to work
  Plug 'pangloss/vim-javascript'
  " Better markdown support
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  " Better tmux configuration file support
  Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }

  " -- Workflow/command plugins --
  " Fugitive for git integration
  Plug 'tpope/vim-fugitive'
  " Indent-based text object
  Plug 'michaeljsmith/vim-indent-object'
  " Ack plugin
  Plug 'mileszs/ack.vim', { 'on': 'Ack' }
  " CtrlP for fuzzy find/open
  Plug 'ctrlpvim/ctrlp.vim'
  " FZF for fuzzy find/open
  Plug 'junegunn/fzf', { 'on': 'FZF' }
  " Easy asynchronous execution
  Plug 'skywind3000/asyncrun.vim', { 'on': 'AsyncRun' }
  " Sublime-text style multiple cursors
  Plug 'terryma/vim-multiple-cursors'
  " Surround for quoting/brackets/html
  Plug 'tpope/vim-surround'
  " Some handy bracket mappings
  Plug 'tpope/vim-unimpaired'
  " Automatic alignment
  Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
  " Allow repeating supported plugins
  Plug 'tpope/vim-repeat'

  " -- Tmux integration plugins --
  if $TMUX != ''
    " Allow seamless movement between vim and tmux
    Plug 'christoomey/vim-tmux-navigator', { 'on':
          \ ['TmuxNavigateLeft', 'TmuxNavigateDown',
          \ 'TmuxNavigateUp', 'TmuxNavigateRight'] }
  endif

  " Customization
  Plug 'chriskempson/base16-vim'        " Base 16 color schemes
  "Plug 'xolox/vim-colorscheme-switcher' " Colorscheme switcher, useful for testing out new colorschemes
  "Plug 'xolox/vim-misc'                 " required for colorscheme switcher

  call plug#end()

endif " End plugin load if
