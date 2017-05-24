" My autocommands live here
"
augroup fileSpecifics
  autocmd!

  " Syntax specific indentation
  " Use 4 space tabs for python
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
  " Use 4 space tabs for java
  autocmd FileType java setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4
  " Use 78 text width for markdown files
  autocmd FileType markdown setlocal textwidth=78
augroup END

augroup restoreBufferPosition
  autocmd!

  " Jump to last known cursor position unless it's invalid or inside an event
  " handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
augroup END

augroup netrwMappings
  autocmd!

  " Custom mappings for netrw
  autocmd FileType netrw call NetrwMappings()
augroup END

augroup rustyTags
  autocmd!

  " Rusty-tags
  autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
  autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&"
augroup END

augroup whitespace
  autocmd!

  " Autocommand to refresh my whitespace checker
  autocmd VimEnter,CursorHold,BufWritePost * unlet! b:whitespace_check
augroup END
