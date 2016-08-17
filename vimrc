" Aaron Williamson's Vimrc
" Custom leader
let mapleader=","

" Vundle plugins
source $HOME/.vim/plugins.vim

" ~~~~~~~~ Plugin Config ~~~~~~~~

" Airline config
let g:airline_left_sep='»'
let g:airline_right_sep='«'

" Fugitive mappings (matches my git aliases)
nnoremap <Leader>gst :Gstatus<CR>
nnoremap <Leader>glg :Gvsplit! log --graph --oneline<CR>
nnoremap <Leader>glp :Gvsplit! log --graph --oneline -p<CR>
nnoremap <Leader>gdi :Gvsplit! diff<CR>
nnoremap <Leader>gdc :Gvsplit! diff --cached<CR>
nnoremap <Leader>gdt :Gvdiff<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gaa :Gpedit! add --all<CR>
nnoremap <Leader>gfa :Gpedit! fetch --all<CR>
nnoremap <Leader>gpu :Gpush<Space>
nnoremap <Leader>gpd :Gpull --ff-only<CR>

" Multiple cursors configuration
map <Leader>mf :MultipleCursorsFind<Space>
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" Color Schemes, solarized in windows
" base16-tomorrow elsewhere
if hostname() == "OCTAVIAN"
  colorscheme solarized
  let g:airline_theme='solarized'
else
  let base16colorspace=256
  colorscheme base16-tomorrow-night
  let g:airline_theme='base16_tomorrow'
endif

" CtrlP Config, nicer behaviour of jumping
let g:ctrlp_switch_buffer = 't'

" Dark background
set background=dark

" ~~~~~~~~ Plugin config ends ~~~~~~~~

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

" Expands to directory of current file from Gary Bernhardt
cnoremap <expr> %% expand('%:h').'/'

" Toggle highlight with <Leader>h
let hlstate=0
nnoremap <Leader>h :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<CR>

" Quick <Leader>t remapping
nnoremap <Leader>t :noremap <Leader>t :

" Bash-style tab from http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=list:longest,full
set wildmenu

" Wait less time between key presses (specifically nice for multiple cursors)
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0

" Always show the status line
set laststatus=2

" Leave insert mode quickly
noremap! jk <Esc>
noremap! <Leader>a <Esc>

" Mapping for going to the last window
nnoremap <Leader>L <C-^>

" For quick command-writing
inoremap <Leader>; <Esc>:
vnoremap <Leader>; <Esc>:
nnoremap <Leader>; :

" For quick replace
nnoremap <Leader>r :%s/

" Netrw (file browser) config
" use tree view
let g:netrw_liststyle=3
" show line numbers in netrw
let g:netrw_bufsettings="nu rnu"

" Explore current directory
map <Leader>e :e %%<CR>

" Backspace can delete indents and newlines
set backspace=indent,eol,start

" Toggle showing whitespace with <Leader>sw, <Leader>ss to show spaces, too
nnoremap <Leader>sw :set list! <bar> set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<<CR>
nnoremap <Leader>ss :set list! <bar> set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<,space:%<CR>

" Fast write
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <Esc>:w<CR>
vnoremap <Leader>w <Esc>:w<CR>

" Syntax specific indentation
au FileType python setl sw=4 ts=4 et sts=4 " 4 Space for python
au FileType java setl sw=4 ts=4 et sts=4 " 4 Space for java

" Insert newline without entering insert mode using return
nnoremap <CR> o<Esc>

" Tab/shift+tab bindings for normal and visual mode
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Toggle paste function
function! TogglePasteMode()
  if &paste
    set nopaste
    echo "Disabled paste mode"
  else
    set paste
    startinsert
  end
endfunction

" Use <Leader>p to toggle paste mode
nnoremap <Leader>p :call TogglePasteMode() <CR>

" Temporarily disable all line numbers with <Leader>nn
nnoremap <Leader>nn :set nu! <bar> set rnu!<CR>

" Natural split placement
set splitbelow
set splitright

" Automatic split sizing
set winheight=30
set winwidth=85
set winminheight=5
set winminwidth=15

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
