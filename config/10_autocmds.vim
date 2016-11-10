" My autocommands live here

" Group them all in an autocmd group so we don't end up with duplicates
" I might change this later and make them into separate groups
augroup myAutoCmds
  " First clear the group of any old autocmd's
  autocmd!

  " Syntax specific indentation
  autocmd FileType python setl shiftwidth=4 tabstop=4 expandtab softtabstop=4 " 4 Space for python
  autocmd FileType java setl shiftwidth=4 tabstop=4 expandtab softtabstop=4   " 4 Space for java

  " Jump to last known cursor position unless it's invalid or inside an event
  " handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
augroup END
