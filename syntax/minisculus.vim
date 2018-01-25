if exists("b:current_syntax")
  finish
endif

syn match miniIdentifier "\a[a-zA-Z0-9]*\ze\s*:="
syn keyword miniKeyword begin end while do
syn keyword miniCond if then else
syn match miniOperator "[+-\*/]\|:="
syn match miniDelim "[();]"
syn match miniNum "\<\d\+\>"
syn region miniMultiLineComment start="/\*" end="\*/" contains=miniMultiLineComment,miniComment
syn match miniComment /\s*%.*/

highlight def link miniComment Comment
highlight def link miniMultiLineComment Comment
highlight def link miniIdentifier Identifier
highlight def link miniNum Number
highlight def link miniOperator Operator
highlight def link miniDelim Delimiter
highlight def link miniKeyword Keyword
highlight def link miniCond Conditional

let b:current_syntax="minisculus"
