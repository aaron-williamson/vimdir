" My custom defined commands live here
command! -count=0 -nargs=0 PullToNewTab call PullToNewTab(<count>)

command! -count=0 -nargs=0 TabOrBufferNext call TabOrBufferNext(<count>)
command! -count=0 -nargs=0 TabOrBufferPrevious call TabOrBufferPrevious(<count>)

command! -count=100 -nargs=0 Center call Center(<count>)

command! -nargs=0 ToggleSpelling call ToggleSpelling()
command! -nargs=0 WritingMode call WritingMode()
