" My autocommands live here

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

  " Custom mappings for netrw
  autocmd FileType netrw call NetrwMappings()

  " Rusty-tags
  autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
  autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
augroup END

" Autocommand to refresh my whitespace checker
augroup whitespace
  autocmd!
  autocmd VimEnter,CursorHold,BufWritePost * unlet! b:whitespace_check
augroup END
