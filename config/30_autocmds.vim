" My autocommands live here
augroup gitconfigEruby
  autocmd!

  " Set the subtype correctly
  autocmd BufRead,BufNewFile *gitconfig.erb let b:eruby_subtype = 'gitconfig'
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
