" Configuration for standalone vim
" This config file will work even if no plugins are loaded

" Disable Vi compatibility
set nocompatible

" Custom leader
let mapleader = ","

" Netrw (file browser) config
" use tree view and show line numbers in netrw
let g:netrw_liststyle   = 3
let g:netrw_banner      = 0
let g:netrw_altfile     = 1
let g:netrw_bufsettings = "nomodifiable nomodified nowrap readonly number relativenumber nobuflisted"

" Enable filetype detection and auto-indentation
filetype plugin indent on

" Disable the mouse
set mouse=

" Set GUI cursor preferences
set guicursor=n-v-c:block,i-ci:ver5,r-cr:hor5,sm:block,a:blinkon0

" Automatically indent
set autoindent

" Don't show the splash screen
set shortmess+=I

" Highlight searches, and highlight while you type
set hlsearch
set incsearch

" Show the current line and column numbers on the statusline
set ruler

" Use relative line numbers for all but current line
set number
set relativenumber

" Highlight the line with the cursor
set cursorline

" Don't prompt for closing a file when you're opening a new file in the
" current buffer
set hidden

" Auto reload file when it's been changed outside of vim without prompting
set autoread

" Show as much of a line as we can instead of @ symbols
set display=lastline

" Only add one space when joining lines ending with '.', '!', or '?'
set nojoinspaces

" Enable smartcase searches (ignore case unless upper case is typed)
set ignorecase
set smartcase

" Set a dictionaries for word completion
set dictionary+=/usr/share/dict/words

" Infer case for autocompletion
set infercase

" Try to have at least 5 lines of vertical room surrounding the cursor
set scrolloff=5

" Enable syntax highlighting
syntax enable

" Disable modeline due to security concerns
set nomodeline

" Show the currently executing command
set showcmd

" Set history to max
set history=10000

" Enable ttyfast
set ttyfast

" Backup to temp directories instead of cwd
set backup
set writebackup
set backupdir=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp//
set backupskip=/tmp/*//,/private/tmp/*//
set directory=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp//

" Set tab to 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

" Set fold mode to manual and have all folds open by default
set foldmethod=manual
set foldlevel=20

" Zsh style command tab completion
set wildmenu
set wildmode=list:longest,full

" Wait less time between key presses (specifically nice for multiple cursors)
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0

" Always show the status line
set laststatus=2

" Backspace can delete indents and newlines
set backspace=2

" Natural split placement
set splitbelow
set splitright

" Automatic split sizing
set winheight=30
set winwidth=85
silent! set winminheight=5
set winminwidth=15

" ~~~ Conditional Settings ~~~

" Enable termguicolors if we have it, otherwise set background to light, for
" better base16 compatibility if we aren't using a theme
if has('termguicolors')
  set termguicolors
  set background=dark
else
  set background=light
endif

" Enable breakindent and linebreak if they're available
if has('linebreak')
  set linebreak
  " breakindent not introduced until patch 338
  if has('patch338')
    set breakindent
  endif
endif

" Vim specific settings
if !has('nvim')
  " Enable the built in manual viewer
  runtime ftplugin/man.vim

  " Store larger things in registers
  set viminfo=!,'100,<200,s50,h

  " For some reason vim doesn't like screen and colors
  if &term == 'screen' || &term == 'screen-256color'
    set term=xterm-256color
  endif
endif

" Unix specific settings
if has('unix')
  " Need to manually reset path for compatibility with zsh
  set path=".,/usr/include,,"
endif

" Neovim specific settings
if has('nvim')
  " Store larger things in registers
  set shada=!,'100,<200,s50,h
endif
