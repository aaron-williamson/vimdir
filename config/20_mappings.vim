" This contains all of my mappings

" Preserve comma behaviour with ,,
noremap <Leader><Leader> ,

" Expands to directory of current file from Gary Bernhardt
cnoremap <expr> %% expand('%:h').'/'

" Quick <Leader>t remapping
nnoremap <Leader>t :noremap <Leader>t :

" Mapping for going to the last window
noremap <Leader>l <C-^>

" For quick replace
noremap <Leader>R :%substitute/

" Explore current directory
map <Leader>e :edit %%<CR>

" Toggle showing whitespace with <Leader>sw, <Leader>ss to show spaces, too
noremap <Leader>sw :set list! <bar> set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<<CR>
noremap <Leader>ss :set list! <bar> set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<,space:%<CR>

" Temporarily disable all line numbers with <Leader>nn
noremap <Leader>nn :set number! <bar> set relativenumber!<CR>

" Close quickfix, preview, and location list
noremap <Leader>c :cclose <bar> pclose <bar> lclose<CR>

" Fast write
nnoremap <Leader>w :write<CR>
inoremap <Leader>w <Esc>:write<CR>
vnoremap <Leader>w <Esc>:write<CR>

" Insert newline without entering insert mode with <Leader>nm
nnoremap <Leader>nm o<Esc>

" Use <Leader>p[letter] with a letter to toggle paste mode
" the letter determines the mode after toggling paste:
"   i: insert mode
"   o: insert mode on newline
"   p: no change
nnoremap <Leader>pi :call TogglePasteMode("i")<CR>
nnoremap <Leader>po :call TogglePasteMode("o")<CR>
nnoremap <Leader>pp :call TogglePasteMode("")<CR>

" Toggle highlight with <Leader>h
noremap <Leader>h :call ToggleHighlightSearch()<CR>

" More sensible resizing amounts
noremap <C-w>- :resize -10<CR>
noremap <C-w>= :resize +10<CR>
noremap <C-w>+ :wincmd =<CR>
noremap <C-w>. :vertical resize +10<CR>
noremap <C-w>, :vertical resize -10<CR>

" Create a window with <C-w>c and close a window with <C-w>x
" This lines up nicer with tmux binds
noremap <C-w>c :tabnew<CR>
noremap <C-w>x :close<CR>

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
nnoremap <C-h> :call TabOrBufferPrevious()<CR>
nnoremap <C-l> :call TabOrBufferNext()<CR>
nnoremap <silent> <C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-k> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
