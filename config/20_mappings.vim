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
noremap <Leader>R :%s/

" Explore current directory
noremap <Leader>e :e %%<CR>

" Toggle showing whitespace with <Leader>sw, <Leader>ss to show spaces, too
noremap <Leader>sw :set list! <bar> set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<<CR>
noremap <Leader>ss :set list! <bar> set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<,space:%<CR>

" Temporarily disable all line numbers with <Leader>nn
noremap <Leader>nn :set nu! <bar> set rnu!<CR>

" Close quickfix and location list
noremap <Leader>c :ccl <bar> lcl<CR>

" Fast write
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <Esc>:w<CR>
vnoremap <Leader>w <Esc>:w<CR>

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
noremap <C-w>+ :winc =<CR>
noremap <C-w>. :vertical resize +10<CR>
noremap <C-w>, :vertical resize -10<CR>

" Create a window with <C-w>c and close a window with <C-w>x
" This lines up nicer with tmux binds
noremap <C-w>c :tabnew<CR>
noremap <C-w>x :close<CR>

" Split navigation
if (has("unix") && system("uname -s") == "Darwin\n") || $SSH_FROM_MAC
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
