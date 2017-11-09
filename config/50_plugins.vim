" My plugins, I use vim-plug for plugin management
" vim-plug: https://github.com/junegunn/vim-plug

" Don't load plugins if we don't want to
if !$NO_VIM_PLUGINS
  let g:loading_plugins = 'true'

  " Auto install plug.vim if it's missing
  if empty(glob(g:vim_dir . '/autoload/plug.vim'))
    execute 'silent !curl -fLo' . g:vim_dir . '/autoload/plug.vim --create-dirs ' .
          \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif

  call plug#begin(g:vim_dir . '/plugins')

  " -- Language plugins --
  " Rust support
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  " Racer for rust omnicompletion
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  " TOML support
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  " Extra rails functionality
  Plug 'tpope/vim-rails'
  " Extra bundler functionality
  Plug 'tpope/vim-bundler'
  " Improved javascript editing, problems with on-demand loading
  Plug 'pangloss/vim-javascript' ", { 'for': 'javascript' }
  " Improved JSX editing, problems with on-demand loading
  Plug 'mxw/vim-jsx' ",{ 'for': 'javascript.jsx' }
  " Coffee script syntax highlighting support + extras
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
  " Better markdown support, problems with on-demand loading
  Plug 'plasticboy/vim-markdown' ", { 'for': 'markdown' }
  " Better tmux configuration file support
  Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
  " Scala support, problems with on-demand loading and sbt
  Plug 'derekwyatt/vim-scala' ", { 'for': ['scala', 'sbt.scala'] }
  " Go syntax highlighting support and friends
  Plug 'fatih/vim-go', { 'for': 'go' }
  " Improved haskell support
  Plug 'neovimhaskell/haskell-vim'
  " LaTeX editing in vim
  Plug 'lervag/vimtex'

  " -- Workflow/command plugins --
  " Fugitive for git integration
  Plug 'tpope/vim-fugitive'
  " Indent-based text object
  Plug 'michaeljsmith/vim-indent-object'
  " Ack plugin
  Plug 'mileszs/ack.vim', { 'on': 'Ack' }
  " FZF for fuzzy find/open
  Plug 'junegunn/fzf'
  " Some nice default FZF wrappers
  Plug 'junegunn/fzf.vim'
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
  " A secure modeline alternative
  Plug 'ciaranm/securemodelines'
  " A Tag Viewer
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  " Auto add some matching ends
  Plug 'tpope/vim-endwise'
  " Nerd tree for file browsing
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle'] }

  " Plugins only for vim 8+ or neovim
  if has('nvim') || v:version >= 800
    " Live Markdown Preview
    function! BuildComposer(info)
      if !executable('cargo')
        echoerr 'Could not find cargo executable'
      endif

      if a:info.status !=# 'unchanged' || a:info.force
        if has('nvim')
          !cargo build --release
        else
          !cargo build --release --no-default-features --features json-rpc
        endif
      endif
    endfunction

    Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer'),
          \ 'on': ['ComposerStart', 'ComposerOpen', 'ComposerUpdate'],
          \ 'for': 'markdown' }

    " Easy asynchronous execution
    Plug 'skywind3000/asyncrun.vim', { 'on': 'AsyncRun' }

    " Asynchronous linting
    Plug 'w0rp/ale'

    " Fancy vim start page
    Plug 'mhinz/vim-startify'
  endif

  " -- Neovim specific plugins --
  if has('nvim')
    " A yankring to share yanks across neovim instances
    Plug 'bfredl/nvim-miniyank'
  endif

  " -- Tmux integration plugins --
  if $TMUX !=# ''
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
