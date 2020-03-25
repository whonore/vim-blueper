" Author: Wolf Honore

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'blueper'

let s:palette = blueper#Palette()
let s:black = s:palette.black
let s:red = s:palette.red
let s:darkred = s:palette.darkred
let s:blue = s:palette.blue
let s:darkblue = s:palette.darkblue
let s:green = s:palette.green
let s:darkgreen = s:palette.darkgreen
let s:grey = s:palette.grey
let s:darkgrey = s:palette.darkgrey
let s:yellow = s:palette.yellow
let s:purple = s:palette.purple
let s:darkpurple = s:palette.darkpurple
let s:pink = s:palette.pink
let s:palepink = s:palette.palepink
let s:darkpink = s:palette.darkpink
let s:teal = s:palette.teal
let s:ice = s:palette.ice

let s:none = {'gui': 'NONE', 'term': 'NONE'}

function! s:hi(group, fg, bg, attr) abort
  let l:attr = type(a:attr) == type('') ? {'gui': a:attr, 'term': a:attr} : a:attr
  execute printf('hi %s guifg=%s guibg=%s gui=%s ctermfg=%s ctermbg=%s cterm=%s',
                 \ a:group,
                 \ a:fg.gui, a:bg.gui, l:attr.gui,
                 \ a:fg.term, a:bg.term, l:attr.term)
endfunction

" Programming
call s:hi('Normal', s:ice, s:black, s:none)
call s:hi('Comment', s:palepink, s:none, s:none)
call s:hi('Todo', s:palepink, s:none, 'reverse')
call s:hi('Error', s:grey, s:darkred, s:none)
call s:hi('Constant', s:teal, s:none, 'bold')
hi! link PreProc Constant
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreConduit PreProc
call s:hi('String', s:green, s:none, s:none)
hi! link Character String
call s:hi('Number', s:yellow, s:none, s:none)
hi! link Boolean Number
hi! link Float Number
call s:hi('Identifier', s:ice, s:none, s:none)
hi! link Function Identifier
call s:hi('Statement', s:blue, s:none, 'bold')
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Keyword Statement
hi! link Exception Statement
call s:hi('Operator', s:blue, s:none, s:none)
call s:hi('Type', s:purple, s:none, s:none)
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
call s:hi('Special', s:pink, s:none, s:none)
hi! link SpecialChar Special
hi! link Delimiter Special
hi! link SpecialComment Special
hi! link Debug Special

" Borders
call s:hi('LineNr', s:blue, s:black, s:none)
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CursorLineNr LineNr
hi! link EndOfBuffer LineNr
hi! link NonText LineNr
call s:hi('MatchParen', s:none, s:darkpurple, 'bold')
call s:hi('VertSplit', s:ice, s:ice, s:none)
call s:hi('StatusLine', s:black, s:ice, 'bold')
call s:hi('StatusLineNC', s:black, s:ice, s:none)
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
call s:hi('TabLine', s:ice, s:black, 'reverse')
call s:hi('TabLineSel', s:ice, s:black, 'bold')
hi! link TabLineFill StatusLine

" Cursor/Selection
call s:hi('Cursor', s:grey, s:none, s:none)
call s:hi('CursorLine', s:none, s:darkblue, s:none)
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
call s:hi('ModeMsg', s:blue, s:none, 'bold')
hi! link MoreMsg ModeMsg

" Spelling
call s:hi('SpellBad', s:yellow, s:darkpurple, 'underline')
call s:hi('SpellCap', s:blue, s:darkpurple, 'underline')
call s:hi('SpellLocal', s:ice, s:darkpurple, 'underline')
call s:hi('SpellRare', s:pink, s:darkpurple, 'underline')

" Misc
call s:hi('ColorColumn', s:red, s:none, 'reverse')
" call s:hi('SignColumn', '', '', '')
hi! link SpecialKey Special
call s:hi('Directory', s:teal, s:none, s:none)
hi! link Title ModeMsg
