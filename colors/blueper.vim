" Author: Wolf Honore

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'blueper'

let s:black = 16
let s:red = 196
let s:darkred = 88
let s:blue = 33
let s:darkblue = 17
let s:green = 47
let s:grey = 15
let s:yellow = 226
let s:purple = 141
let s:darkpurple = 53
let s:pink = 213
let s:palepink = 225
let s:teal = 51
let s:ice = 159

function! s:hi(group, fg, bg, term) abort
  execute printf('hi %s ctermfg=%s ctermbg=%s cterm=%s',
  \              a:group, a:fg, a:bg, a:term)
endfunction

" Programming
call s:hi('Normal', s:ice, s:black, 'NONE')
call s:hi('Comment', s:palepink, 'NONE', 'NONE')
call s:hi('Todo', s:palepink, 'NONE', 'reverse')
call s:hi('Error', s:grey, s:darkred, 'NONE')
call s:hi('Constant', s:teal, 'NONE', 'bold')
hi! link PreProc Constant
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreConduit PreProc
call s:hi('String', s:green, 'NONE', 'NONE')
hi! link Character String
call s:hi('Number', s:yellow, 'NONE', 'NONE')
hi! link Boolean Number
hi! link Float Number
call s:hi('Identifier', s:ice, 'NONE', 'NONE')
hi! link Function Identifier
call s:hi('Statement', s:blue, 'NONE', 'bold')
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Keyword Statement
hi! link Exception Statement
call s:hi('Operator', s:blue, 'NONE', 'NONE')
call s:hi('Type', s:purple, 'NONE', 'NONE')
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
call s:hi('Special', s:pink, 'NONE', 'NONE')
hi! link SpecialChar Special
hi! link Delimiter Special
hi! link SpecialComment Special
hi! link Debug Special

" Borders
call s:hi('LineNr', s:blue, s:black, 'NONE')
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CursorLineNr LineNr
hi! link EndOfBuffer LineNr
hi! link NonText LineNr
call s:hi('MatchParen', 'NONE', s:darkpurple, 'bold')
call s:hi('VertSplit', s:ice, s:ice, 'NONE')
call s:hi('StatusLine', s:black, s:ice, 'bold')
call s:hi('StatusLineNC', s:black, s:ice, 'NONE')
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
call s:hi('TabLine', s:ice, s:black, 'reverse')
call s:hi('TabLineSel', s:ice, s:black, 'bold')
hi! link TabLineFill StatusLine

" Cursor/Selection
call s:hi('Cursor', s:grey, 'NONE', 'NONE')
call s:hi('CursorLine', 'NONE', s:darkblue, 'NONE')
" call s:hi('CursorColumn', '', '', '')
hi! link Visual CursorLine
hi! link VisualNOS Visual
call s:hi('Search', s:black, s:teal, 'bold')
hi! link IncSearch Search
hi! link QuickFixLine Search
hi! link WildMenu Search

" Diffs
" call s:hi('DiffAdd', '', '', '')
" call s:hi('DiffChange', '', '', '')
" call s:hi('DiffDelete', '', '', '')
" call s:hi('DiffText', '', '', '')

" Folds
" call s:hi('Folded', '', '', '')
" call s:hi('FoldColumn', '', '', '')

" Popup
" call s:hi('Pmenu', '', '', '')
" call s:hi('PmenuSel', '', '', '')
" call s:hi('PmenuSbar', '', '', '')
" call s:hi('PmenuThumb', '', '', '')
" call s:hi('Question', '', '', '')

" Messages
hi! link ErrorMsg Error
hi! link WarningMsg Error
call s:hi('ModeMsg', s:blue, 'NONE', 'bold')
hi! link MoreMsg ModeMsg

" Spelling
call s:hi('SpellBad', s:yellow, s:darkpurple, 'underline')
call s:hi('SpellCap', s:blue, s:darkpurple, 'underline')
call s:hi('SpellLocal', s:ice, s:darkpurple, 'underline')
call s:hi('SpellRare', s:pink, s:darkpurple, 'underline')

" Misc
call s:hi('ColorColumn', s:red, 'NONE', 'reverse')
" call s:hi('SignColumn', '', '', '')
hi! link SpecialKey Special
call s:hi('Directory', s:teal, 'NONE', 'NONE')
hi! link Title ModeMsg
