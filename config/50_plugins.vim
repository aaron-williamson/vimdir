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

  call plug#begin(g:vim_dir . '/plugged')

  " Polyglot for language support
  Plug 'sheerun/vim-polyglot'

  " LaTeX editing in vim
  Plug 'lervag/vimtex'

  " Fugitive for git integration
  Plug 'tpope/vim-fugitive'

  " Indent-based text object
  Plug 'michaeljsmith/vim-indent-object'

  " More handy text objects
  Plug 'wellle/targets.vim'

  " Ack plugin for quick multi file search
  Plug 'mileszs/ack.vim', { 'on': 'Ack' }

  " FZF for fuzzy find/open
  Plug 'junegunn/fzf'

  " Some nice default FZF wrappers
  Plug 'junegunn/fzf.vim'

  " Focused writing in vim
  Plug 'junegunn/goyo.vim'

  " Extra focus for writing
  Plug 'junegunn/limelight.vim'

  " Auto detect editor config
  Plug 'editorconfig/editorconfig-vim'

  " Sleuth for auto detecting indent settings
  Plug 'tpope/vim-sleuth'

  " Surround for quoting/brackets/html
  Plug 'tpope/vim-surround'

  " Some handy bracket mappings
  Plug 'tpope/vim-unimpaired'

  " Allow repeating supported plugins
  Plug 'tpope/vim-repeat'

  " Auto add some matching ends
  Plug 'tpope/vim-endwise'

  " NetRW inprovements
  Plug 'tpope/vim-vinegar'

  " A useful commenting plugin
  Plug 'tpope/vim-commentary'

  " abolish.vim for enhanced substituion
  Plug 'tpope/vim-abolish'

  " Automatic alignment
  Plug 'godlygeek/tabular', { 'on': ['Tabularize', 'TableFormat'] }

  " Allow * and # searching from visual mode
  Plug 'bronson/vim-visual-star-search'

  " A secure modeline alternative
  Plug 'ciaranm/securemodelines'

  " Plugins only for vim 8+ or neovim
  if has('nvim') || v:version >= 800
    " Easy asynchronous execution
    Plug 'skywind3000/asyncrun.vim', { 'on': 'AsyncRun' }

    " Asynchronous linting
    Plug 'w0rp/ale'

    " Fancy vim start page
    Plug 'mhinz/vim-startify'

    " Live Markdown Preview
    function! BuildComposer(info)
      if !executable('cargo')
        echom 'Could not find cargo executable - aborting composer build'
        return
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
