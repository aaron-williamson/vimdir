" Custom leader
let mapleader=","

" Vundle prereqs
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins go here
Plugin 'scrooloose/nerdtree'              " The NERD Tree
Plugin 'valloric/youcompleteme'           " youcompleteme Autocompletion Plugin
Plugin 'terryma/vim-multiple-cursors'     " Sublime-text style multiple cursors
Plugin 'altercation/vim-colors-solarized' " Solarized color scheme
Plugin 'ctrlpvim/ctrlp.vim'               " CtrlP for fuzzy find/open
Plugin 'tpope/vim-fugitive'               " Fugitive for git integration
Plugin 'rust-lang/rust.vim'               " Syntax highlighting for rust
Plugin 'tpope/vim-rails'                  " Extra functions for rails
Plugin 'vim-airline/vim-airline'          " Airline for better statusbar
Plugin 'vim-airline/vim-airline-themes'   " Themes for Airline

" Vundle Post reqs
call vundle#end()
filetype plugin indent on

" For NERDTree
inoremap <Leader>- <Esc>:NERDTreeToggle<CR>
vnoremap <Leader>- <Esc>:NERDTreeToggle<CR>
nnoremap <Leader>- :NERDTreeToggle<CR>
set modifiable
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1

" Airline config
let g:airline_theme='solarized'
let g:airline_left_sep='»'
let g:airline_right_sep='«'

" Fugitive binds
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

" CtrlP configuration
let g:ctrlp_open_new_file = 't'

" Basic sets
set number
set autoindent
set hlsearch
set incsearch
set ruler
set relativenumber
set cursorline
set cmdheight=1
set hidden
set autoread
set nojoinspaces
set ignorecase
set smartcase
set scrolloff=5
syntax enable

" Backup to different directories
set backup
set writebackup
set backupdir=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp//
set backupskip=/tmp/*//,/private/tmp/*//
set directory=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp//

" Solarized color scheme
set t_Co=256
colorscheme solarized
set background=dark
hi Normal ctermbg=none
hi NoText ctermbg=None

" Set tab to 2 spaces
set ts=2
set sw=2
set et
set sts=2

" Set folds to indents and open all folds
set foldmethod=indent
set foldlevelstart=20

" Cool directory of current file from Gary Bernhardt
cnoremap <expr> %% expand('%:h').'/'

" Open nerdtree in current directory
map <Leader>e :NERDTreeToggle %%<CR>

" Toggle highlight with <Leader>h
let hlstate=0
nnoremap <Leader>h :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<CR>

" Quick <Leader>t remapping
nnoremap <Leader>t :noremap <Leader>t :

" Bash-style tab from http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=list:longest,full
set wildmenu

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

" Backspace fixes
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

" Insert enter without entering insert mode using <Leader>nm
nnoremap <Leader>nm o<Esc>

" Tab/shift+tab bindings for normal and visual mode
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
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

" Mapping for temporarily disabling line numbers for copy/paste
nnoremap <Leader>nn :set nu! <bar> set rnu!<CR>

" Tab/split stuff:
" Natural split appearance
set splitbelow
set splitright
" Better tab navigation, ctrl + left/right for change tab, ctrl + up/down for moving tabs
nnoremap <C-H> :tabprevious<CR>
nnoremap <C-L> :tabnext<CR>
nnoremap <silent> <C-J> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-K> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" Better split navigation, alt + normal navigation keys for navigation
nnoremap ∆ <C-W><C-J>
nnoremap ˚ <C-W><C-K>
nnoremap ¬ <C-W><C-L>
nnoremap ˙ <C-W><C-H>
