" My autocommands live here

" Group them all in an autocmd group so we don't end up with duplicates
" I might change this later and make them into separate groups
augroup myAutoCmds
  " First clear the group of any old autocmd's
  autocmd!

  " Syntax specific indentation
  " Use 4 space tabs for python
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
  " Use 4 space tabs for java
  autocmd FileType java setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
  " Use 78 text width for markdown files
  autocmd FileType markdown setlocal textwidth=78

  " Jump to last known cursor position unless it's invalid or inside an event
  " handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
augroup END