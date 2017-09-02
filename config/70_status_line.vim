" This file has to be loaded after plugins so that it knows whether or not to
" try and add plugin specific information to the status line
set statusline=        " Clear the old status line

" Left
set statusline+=[%n]\  " Buffer number
set statusline+=%<     " Truncate here
set statusline+=%f\    " Path to current file

if exists('g:loading_plugins')               " Plugin specifics
  set statusline+=%((%{fugitive#head()})\ %) " Current git branch via fugitive
endif

set statusline+=%(%{StatusPasteMode()}\ %) " Paste mode flag
set statusline+=%([%R%M]%)                 " Modified and read only group
set statusline+=%h                         " Help buffer flag
set statusline+=%w                         " Preview flag
set statusline+=%q                         " Quickfix or location list

set statusline+=%= " End first alignment group

" Center
set statusline+=%{StatusWhitespaceCheck()} " Whitespace checks

" We can only have more than two alignment groups if we're using neovim
if has('nvim')
  set statusline+=%= " End second alignment group
else
  set statusline+=\  " If we're using normal vim, just use a space
endif

" Right
set statusline+=%-(%y%)                                  " Left justified filetype
set statusline+=%25(%l/%L\ :\ %c%V%{StatusTextWidth()}%) " Line/TotalLines : Column/TextWidth
set statusline+=%6(\ \ %p%%%)                            " Percent position in file
