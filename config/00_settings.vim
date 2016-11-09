" Configuration for standalone vim
" This config file will work even if no plugins are loaded

" Disable Vi compatibility
set nocompatible

" Custom leader
let mapleader = ","

" Netrw (file browser) config
" use tree view and show line numbers in netrw
let g:netrw_liststyle   = 3
let g:netrw_bufsettings = "number relativenumber nobuflisted"

" Enable the built-in manual viewer
runtime ftplugin/man.vim

" Enable filetype detection and auto-indentation
filetype plugin indent on

" Set background to light by default for better
" compatibility with base16 terminal themes
set background=light

" Automatically indent
set autoindent

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

" Enable smartcase searches (foo matches foo FOO fOo etc, Foo matches only Foo)
set ignorecase
set smartcase

" Try to have at least 5 lines of vertical room surrounding the cursor
set scrolloff=5

" Enable syntax highlighting
syntax enable

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
set wildmode=list:full,full

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

" Syntax specific indentation
au FileType python setl shiftwidth=4 tabstop=4 expandtab softtabstop=4 " 4 Space for python
au FileType java setl shiftwidth=4 tabstop=4 expandtab softtabstop=4 " 4 Space for java

" ~~~ Conditional Settings ~~~

" Use system clipboard for yanks
" But not if we're root on macos or windows
if has('clipboard') && !($USER == 'root' && g:on_macos)
  if g:on_macos || g:on_windows
    set clipboard=unnamed
  else
    set clipboard=unnamedplus
  endif
endif

" Enable breakindent and linebreak if they're available
if has("linebreak")
  set linebreak
  " breakindent not introduced until patch 338
  if has('patch338')
    set breakindent
  endif
endif

" For some reason vim doesn't like screen-256color
if !has('nvim') && &term == 'screen' && $TMUX != ""
  set term=xterm-256color
endif

" Neovim specific settings
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
endif
