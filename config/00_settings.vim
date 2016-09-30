" Configuration for standalone vim
" This config file will work even if no plugins are loaded

" Disable Vi compatibility
set nocompatible

" Custom leader
let mapleader = ","

" Netrw (file browser) config
" use tree view and show line numbers in netrw
let g:netrw_liststyle   = 3
let g:netrw_bufsettings = "nu rnu"

" Enable the built-in manual viewer
runtime ftplugin/man.vim

" Dark background
set background=dark

" Default colorscheme
colorscheme elflord

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

" Set folds to indents and open all folds
set foldmethod=indent
set foldlevelstart=20

" Bash-style tab from http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=list:longest,full
set wildmenu

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
au FileType python setl sw=4 ts=4 et sts=4 " 4 Space for python
au FileType java setl sw=4 ts=4 et sts=4 " 4 Space for java

" ~~~ Conditional Settings ~~~

" Use system clipboard for yanks
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Use True Color if it's available
if has("termguicolors")
  set termguicolors
endif

" Enable breakindent if it's available
if has("linebreak")
  set breakindent
endif
