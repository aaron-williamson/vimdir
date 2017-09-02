" This contains all of my mappings

" Set scriptencoding for the special characters for MacOS
scriptencoding UTF-8

" Also change the old leader to work as comma as well
noremap \ ,

" Expands to current directory
cnoremap <expr> %% expand('%:p:h') . '/'

" Quick <Leader>t remapping
nnoremap <Leader>t :noremap <Leader>t :

" Mapping for going to the last window
noremap <Leader>l <C-^>

" For quick substitute
noremap <Leader>S :%substitute/

" Toggle showing whitespace with <Leader>sw, <Leader>ss to show spaces, too
noremap <Leader>sw :call ToggleShowWhitespace(0)<CR>
noremap <Leader>ss :call ToggleShowWhitespace(1)<CR>

" Refresh whitespace checker with <Leader>sc
noremap <Leader>sc :unlet! b:whitespace_check<CR>

" Toggle whitespace checker with <Leader>sn
noremap <Leader>sn :call ToggleWhitespaceCheck() <bar>
      \ unlet! b:whitespace_check<CR>

" Search for trailing whitespace with <Leader>st
noremap <Leader>st /\v\s+$<CR>

" Remove trailing whitespace with <Leader>sd
noremap <Leader>sd :%substitute/\v\s+$//g <bar>
      \ unlet! b:whitespace_check<CR>

" Temporarily disable all line numbers with <Leader>nn
noremap <Leader>nn :set number! <bar> set relativenumber!<CR>

" Close quickfix, preview, and location list
noremap <Leader>c :cclose <bar> pclose <bar> lclose<CR>

" Fast write
nnoremap <Leader>w :write<CR>
inoremap <Leader>w <Esc>:write<CR>
vnoremap <Leader>w <Esc>:write<CR>

" Toggle paste mode with <Leader>PM
nnoremap <Leader>PM :set paste!<CR>

" Toggle highlight with <Leader>h
noremap <Leader>h :set hlsearch!<CR>

" Quick escape (For when we can't use caps)
imap jk <Esc>

" Toggle column highlight with <Leader>C
noremap <Leader>C :set cursorcolumn!<CR>

" Toggle fold method between manual and indent with <Leader>z
noremap <Leader>z :call ToggleFoldMethod()<CR>

" More sensible resizing amounts/binds
noremap <C-w>- :resize -10<CR>
noremap <C-w>= :resize +10<CR>
noremap <C-w>+ :wincmd =<CR>
noremap <C-w>. :vertical resize +10<CR>
noremap <C-w>, :vertical resize -10<CR>

" Add a binding for new tab
noremap <C-w>t :tabnew<CR>

" Quick tab navigation
noremap <Leader>1 :tabnext 1<CR>
noremap <Leader>2 :tabnext 2<CR>
noremap <Leader>3 :tabnext 3<CR>
noremap <Leader>4 :tabnext 4<CR>
noremap <Leader>5 :tabnext 5<CR>
noremap <Leader>6 :tabnext 6<CR>
noremap <Leader>7 :tabnext 7<CR>
noremap <Leader>8 :tabnext 8<CR>
noremap <Leader>9 :tabnext 9<CR>

" Use <C-w>T to pull to a new tab, even if it's the only window
noremap <C-w>T :PullToNewTab<CR>

" Split navigation
if g:on_macos || $SSH_FROM_MAC
  noremap <silent> ˙ <C-w>h
  noremap <silent> ∆ <C-w>j
  noremap <silent> ˚ <C-w>k
  noremap <silent> ¬ <C-w>l
else
  noremap <silent> <A-h> <C-w>h
  noremap <silent> <A-j> <C-w>j
  noremap <silent> <A-k> <C-w>k
  noremap <silent> <A-l> <C-w>l
endif

" Ctrl + h/l for changing tabs, ctrl + k/j for moving tabs
nnoremap <C-h> :TabOrBufferPrevious<CR>
nnoremap <C-l> :TabOrBufferNext<CR>
nnoremap <silent> <C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-k> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Neovim specific mappings
if has('nvim')
  " Enter terminal emulator quickly
  noremap <Leader>T :terminal<CR>

  " Leave terminal emulator insert mode easily
  tnoremap <C-g> <C-\><C-n>

  " Navigate out of spit terminal emulator easily
  if g:on_macos || $SSH_FROM_MAC
    tmap ˙ <C-\><C-n>˙
    tmap ∆ <C-\><C-n>∆
    tmap ˚ <C-\><C-n>˚
    tmap ¬ <C-\><C-n>¬
  else
    tmap <A-h> <C-\><C-n><A-h>
    tmap <A-j> <C-\><C-n><A-j>
    tmap <A-k> <C-\><C-n><A-k>
    tmap <A-l> <C-\><C-n><A-l>
  endif
endif
