" Configuration for standalone vim
" This config file will work even if no plugins are loaded

" Custom leader
nnoremap <Space> <Nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = "\\"

" Enable filetype detection and auto-indentation
filetype plugin indent on

" Disable the mouse except in normal mode
set mouse=n

" Netrw config
let g:netrw_bufsettings = 'nomodifiable nomodified nowrap readonly number relativenumber nobuflisted'

" Set GUI cursor preferences
set guicursor=n-v-c:block,i-ci:ver5,r-cr:hor5,sm:block,a:blinkon0

" Automatically indent
set autoindent

" Don't show the splash screen
set shortmess+=I

" Highlight searches, and highlight while you type
set hlsearch
set incsearch

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

" Add the system dictionary for word completion
set dictionary+=/usr/share/dict/words

" Set the spell language
set spelllang=en_ca,en_us

" Infer case for autocompletion
set infercase

" Try to have at least 3 lines of vertical room surrounding the cursor
set scrolloff=3

" Enable syntax highlighting
syntax enable

" Disable modeline due to security concerns
set nomodeline

" Show the currently executing command
set showcmd

" Set history to max
set history=10000

" Allow executable RC files but don't allow them to set autocmds, write, or
" run shell commands
set exrc
set secure

" Enable ttyfast
set ttyfast

" Backup to temp directories instead of cwd
set backup
set writebackup
set undofile
set backupdir=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp//
set backupskip=/tmp/*//,/private/tmp/*//
set undodir=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp//
set directory=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp//

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
set backspace=indent,eol,start

" Natural split placement
set splitbelow
set splitright

" Set user highlights for status line
highlight User1 guifg=DarkGrey guibg=Blue ctermfg=DarkGrey ctermbg=Blue gui=bold cterm=bold
highlight User2 guifg=DarkGrey guibg=Green ctermfg=DarkGrey ctermbg=Green gui=bold cterm=bold
highlight User3 guifg=DarkGrey guibg=Magenta ctermfg=DarkGrey ctermbg=Magenta gui=bold cterm=bold
highlight User4 guifg=DarkGrey guibg=Red ctermfg=DarkGrey ctermbg=Red gui=bold cterm=bold

" Don't show mode, status line handles htis
set noshowmode

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
  set breakindent
endif

" Vim specific settings
if !has('nvim')
  " Enable the built in manual viewer
  runtime ftplugin/man.vim

  " Store larger things in registers
  set viminfo=!,'100,<200,s50,h

  " For some reason vim doesn't like screen and colors
  if &term ==# 'screen' || &term ==# 'screen-256color'
    set term=xterm-256color
  endif
endif

" Neovim specific settings
if has('nvim')
  " Store larger things in registers
  set shada=!,'100,<200,s50,h

  " Set python provider
  let g:python_host_prog = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif
