" Vundle prereqs
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins go here
Plugin 'scrooloose/nerdcommenter' " The NERD Commenter
Plugin 'scrooloose/nerdtree' " The NERD Tree
Plugin 'valloric/youcompleteme' " youcompleteme Autocompletion Plugin

" Vindle Post reqs
call vundle#end()
filetype plugin indent on

" For youcompleteme
set shortmess+=c

" For NERDTree
inoremap <Leader>- <Esc>:NERDTreeToggle<CR>
vnoremap <Leader>- <Esc>:NERDTreeToggle<CR>
nnoremap <Leader>- :NERDTreeToggle<CR>
set modifiable

" Basic sets
set number
set autoindent
set hlsearch
set incsearch
syntax enable

" Set tab to 2 spaces
set ts=2
set sw=2
set expandtab

" Toggle highlight with <Leader>h
let hlstate=0
nnoremap <Leader>h :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<CR>

" Bash-style tab from http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildmenu

" Always show the status line
set laststatus=2

" Custom escape from insert mode remap
inoremap jk <Esc>

" For quick command-writing
inoremap <Leader>; <Esc>:
vnoremap <Leader>; <Esc>:
nnoremap <Leader>; :

" Backspace fixes
set backspace=indent,eol,start

" Fast write
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <Esc>:w<CR>
vnoremap <Leader>w <Esc>:w<CR>

" Custom leader
let mapleader=","

" Syntax specific indentation
au FileType python setl sw=4 ts=4 et " 4 Space for python
au FileType java setl sw=4 ts=4 et " 4 Space for java

" Shift-tab binding to unindent for insert mode
inoremap <S-Tab> <C-D>

" Insert enter without entering insert mode using <Leader>nl
nnoremap <Leader>nl o<Esc>

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
    normal o
    startinsert
  end
endfunction

" Use <Leader>p to toggle paste mode
nnoremap <Leader>p :call TogglePasteMode() <CR>

" Mapping for temporarily disabling line numbers for copy/paste
nnoremap <Leader>nn :set nu!<CR>

" Tab/split stuff:
" Natural split appearance
set splitbelow
set splitright
" Better tab navigation, ctrl + left/right for change tab, ctrl + up/down for moving tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <C-Down> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-Up> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" Better split navigation, ctrl + normal navigation keys for navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
