" Configuration for standalone vim
" This config file will work even if no plugins are loaded

" Custom leader
let mapleader=","

" Netrw (file browser) config
" use tree view
let g:netrw_liststyle=3
" show line numbers in netrw
let g:netrw_bufsettings="nu rnu"

" Enable the built-in manual viewer
runtime ftplugin/man.vim

" Dark background
set background=dark

" Default colorscheme
colorscheme elflord

" Use True Color
if v:version > 704 || v:version == 704 && has("patch1799")
  set termguicolors
endif

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

" Only use 1 height for the command-line, helps to avoid hit-enter prompts
set cmdheight=1

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

" Try to have at least 5 lines of room before the cursor
set scrolloff=5

" Enable syntax highlighting
syntax enable

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
set ts=2
set sw=2
set et
set sts=2

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
set backspace=indent,eol,start

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

" Expands to directory of current file from Gary Bernhardt
cnoremap <expr> %% expand('%:h').'/'

" Quick <Leader>t remapping
nnoremap <Leader>t :noremap <Leader>t :

" Mapping for going to the last window
nnoremap <Leader>L <C-^>

" For quick command-writing
inoremap <Leader>; <Esc>:
vnoremap <Leader>; <Esc>:
nnoremap <Leader>; :

" For quick replace
nnoremap <Leader>r :%s/

" Quick copy/paste with system clipboard
nnoremap <Leader>cC "+Y
nnoremap <Leader>cc "+y
vnoremap <Leader>cc "+y
nnoremap <Leader>cp "+p
nnoremap <Leader>cP "+P
vnoremap <Leader>cp "+p

" Explore current directory
map <Leader>e :e %%<CR>

" Toggle showing whitespace with <Leader>sw, <Leader>ss to show spaces, too
nnoremap <Leader>sw :set list! <bar> set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<<CR>
nnoremap <Leader>ss :set list! <bar> set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<,space:%<CR>

" Temporarily disable all line numbers with <Leader>nn
nnoremap <Leader>nn :set nu! <bar> set rnu!<CR>

" Fast write
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <Esc>:w<CR>
vnoremap <Leader>w <Esc>:w<CR>

" Insert newline without entering insert mode with <Leader>nm
nnoremap <Leader>nm o<Esc>

" Tab/shift+tab bindings for normal and visual mode
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Toggle paste function
function! TogglePasteMode(after_mode)
  if &paste
    set nopaste
    echo "Disabled paste mode"
  else
    set paste
    if a:after_mode == "i"
      startinsert
    elseif a:after_mode == "o"
      normal o
    end
  end
endfunction

" Use <Leader>p[letter] with a letter to toggle paste mode
" the letter determines the mode after toggling paste:
"   i: insert mode
"   o: insert mode on newline
"   p: no change
nnoremap <Leader>pi :call TogglePasteMode("i")<CR>
nnoremap <Leader>po :call TogglePasteMode("o")<CR>
nnoremap <Leader>pp :call TogglePasteMode("")<CR>

" Toggle highlight function
function! ToggleHighlightSearch()
  if &hlsearch
    set nohlsearch
    echo "Disabled search highlighting"
  else
    set hlsearch
    echo "Enabled search highlighting"
  end
endfunction

" Toggle highlight with <Leader>h
nnoremap <Leader>h :call ToggleHighlightSearch()<CR>

" More sensible resizing amounts
nnoremap <C-w>- :resize -10<CR>
nnoremap <C-w>= :resize +10<CR>
nnoremap <C-w>+ :winc =<CR>
nnoremap <C-w>. :vertical resize +10<CR>
nnoremap <C-w>, :vertical resize -10<CR>

" Ctrl + left/right for changing tabs, ctrl + up/down for moving tabs
nnoremap <C-H> :tabprevious<CR>
nnoremap <C-L> :tabnext<CR>
nnoremap <silent> <C-J> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-K> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Alt + normal navigation keys to navigate splits
nnoremap ∆ <C-W><C-J>
nnoremap ˚ <C-W><C-K>
nnoremap ¬ <C-W><C-L>
nnoremap ˙ <C-W><C-H>
