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
  " Enhanced ruby support
  Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
  " Extra rails functionality
  Plug 'tpope/vim-rails'
  " Extra bundler functionality
  Plug 'tpope/vim-bundler'
  " Improved javascript editing, problems with on-demand loading
  Plug 'pangloss/vim-javascript' ", { 'for': 'javascript' }
  " Improved JSX editing, problems with on-demand loading
  Plug 'mxw/vim-jsx'
  " Coffee script syntax highlighting support + extras
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
  " Better markdown support, problems with on-demand loading
  Plug 'plasticboy/vim-markdown' ", { 'for': 'markdown' }
  " Better tmux configuration file support
  Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
  " Scala support, problems with on-demand loading and sbt
  Plug 'derekwyatt/vim-scala' ", { 'for': ['scala', 'sbt.scala'] }

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
  " Allow * and # searching from visual mode
  Plug 'bronson/vim-visual-star-search'

  " -- Tmux integration plugins --
  if $TMUX != ''
    " Allow seamless movement between vim and tmux
    Plug 'christoomey/vim-tmux-navigator', { 'on':
          \ ['TmuxNavigateLeft', 'TmuxNavigateDown',
          \ 'TmuxNavigateUp', 'TmuxNavigateRight'] }
  endif

  " -- Customization plugins --
  Plug 'chriskempson/base16-vim' " Base 16 color schemes

  " -- Occasional use plugins --
  "Plug 'xolox/vim-colorscheme-switcher' " Colorscheme switcher, useful for testing out new colorschemes
  "Plug 'xolox/vim-misc'                 " required for colorscheme switcher

  call plug#end()

endif " End plugin load if
