" This file has to be loaded after plugins so that it knows whether or not to
" try and add plugin specific information to the status line
function! MyStatusLine()
  " Left
  let l:statusline = '[%n] '                 " Buffer number
  let l:statusline .= StatusMode() . ' %0* ' " Current mode
  let l:statusline .= '%<'                   " Truncate here
  let l:statusline .= '%f '                  " Path to current file

  if exists('g:loading_plugins')                    " Plugin specifics
    let l:statusline .= '%((%{fugitive#head()}) %)' " Current git branch via fugitive

    if exists('g:autocomplete_enabled')
      " Coc autocompletion information in status line
      let l:statusline .= "%(%{coc#status()}%{get(b:,'coc_current_function','')} %)"
    endif
  endif

  let l:statusline .= '%(%{StatusPasteMode()} %)'   " Paste mode flag
  let l:statusline .= '%(%{StatusWritingMode()} %)' " Writing mode flag
  let l:statusline .= '%(%{StatusFoldMethod()} %)'  " Fold method flag
  let l:statusline .= '%([%R%M]%)'                  " Modified and read only group
  let l:statusline .= '%h'                          " Help buffer flag
  let l:statusline .= '%w'                          " Preview flag
  let l:statusline .= '%q'                          " Quickfix or location list

  let l:statusline .= '%=' " End first alignment group

  " Center
  let l:statusline .= '%{StatusWhitespaceCheck()}' " Whitespace checks

  " We can only have more than two alignment groups if we're using neovim
  if has('nvim')
    let l:statusline .= '%=' " End second alignment group
  else
    let l:statusline .= ' '  " If we're using normal vim, just use a space
  endif

  " Right
  let l:statusline .= '%-(%y%)'                                " Left justified filetype
  let l:statusline .= '%25(%l/%L : %c%V%{StatusTextWidth()}%)' " Line/TotalLines : Column/TextWidth
  let l:statusline .= '%6(  %p%%%)'                            " Percent position in file

  return l:statusline
endfunction

set statusline=%!MyStatusLine()
