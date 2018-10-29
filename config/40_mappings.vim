" This contains all of my mappings
scriptencoding UTF-8

" Expands to current directory
cnoremap <expr> %% expand('%:p:h') . '/'

" Quick <Leader>t remapping
nnoremap <Leader>t :nnoremap <Leader>t :

" Mapping for going to the last window
nnoremap <Leader>l <C-^>

" Toggle showing whitespace with <Leader>sw, <Leader>ss to show spaces, too
nnoremap <Leader>sw :call ToggleShowWhitespace(0)<CR>
nnoremap <Leader>ss :call ToggleShowWhitespace(1)<CR>

" Refresh whitespace checker with <Leader>sc
nnoremap <Leader>sc :unlet! b:whitespace_check<CR>

" Toggle whitespace checker with <Leader>sn
nnoremap <Leader>sn :call ToggleWhitespaceCheck() <Bar>
      \ unlet! b:whitespace_check<CR>

" Search for trailing whitespace with <Leader>st
nnoremap <Leader>st /\v\s+$<CR>

" Remove trailing whitespace with <Leader>sf
nnoremap <Leader>sf :%substitute/\v\s+$//g <Bar>
      \ unlet! b:whitespace_check <Bar> set nohlsearch<CR>

" Temporarily disable all line numbers with <Leader>nn
nnoremap <Leader>nn :set number! <Bar> set relativenumber!<CR>

" Close quickfix, preview, and location list
nnoremap <Leader>c :cclose <Bar> pclose <Bar> lclose<CR>

" Fast write
nnoremap <Leader>w :write<CR>

" Toggle paste mode with <Leader>PM
nnoremap <Leader>PM :set paste!<CR>

" Toggle highlight with <Leader>h
nnoremap <Leader>h :set hlsearch!<CR>

" Quick escape (For when capslock can't be remapped)
imap jk <Esc>

" Toggle column highlight with <Leader>C
nnoremap <Leader>C :set cursorcolumn!<CR>

" Toggle fold methods with <Leader>z
nnoremap <Leader>z :call ToggleFoldMethod()<CR>

" Add a binding for new tab
nnoremap <C-w>t :tabnew<CR>

" Quick tab navigation
nnoremap <Leader>1 :tabnext 1<CR>
nnoremap <Leader>2 :tabnext 2<CR>
nnoremap <Leader>3 :tabnext 3<CR>
nnoremap <Leader>4 :tabnext 4<CR>
nnoremap <Leader>5 :tabnext 5<CR>
nnoremap <Leader>6 :tabnext 6<CR>
nnoremap <Leader>7 :tabnext 7<CR>
nnoremap <Leader>8 :tabnext 8<CR>
nnoremap <Leader>9 :tabnext 9<CR>

" Use <C-w>T to pull to a new tab, even if it's the only window
nnoremap <C-w>T :PullToNewTab<CR>

" Split navigation
if g:on_macos || $SSH_FROM_MAC
  nnoremap <silent> ˙ <C-w>h
  nnoremap <silent> ∆ <C-w>j
  nnoremap <silent> ˚ <C-w>k
  nnoremap <silent> ¬ <C-w>l
else
  nnoremap <silent> <A-h> <C-w>h
  nnoremap <silent> <A-j> <C-w>j
  nnoremap <silent> <A-k> <C-w>k
  nnoremap <silent> <A-l> <C-w>l
endif

" Ctrl + h/l for changing tabs, ctrl + k/j for moving tabs
nnoremap <C-h> :TabOrBufferPrevious<CR>
nnoremap <C-l> :TabOrBufferNext<CR>
nnoremap <silent> <C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-k> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Neovim specific mappings
if has('nvim')
  " Enter terminal emulator quickly
  nnoremap <Leader>T :terminal<CR>

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
