" My custom defined commands live here
command! -nargs=0 PullToNewTab call PullToNewTab(v:count)

command! -nargs=0 TabOrBufferNext call ChangeTabOrBuffer(v:count, 'next')
command! -nargs=0 TabOrBufferPrevious call ChangeTabOrBuffer(v:count, 'prev')

command! -nargs=? Center call Center(<f-args>)

command! -nargs=0 WritingMode call WritingMode()
