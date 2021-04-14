" Author: Wolf Honore

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'blueper'

let s:p = blueper#Palette()

function! s:hi(group, fg, bg, attr) abort
  let l:attr = type(a:attr) == type('') ? {'gui': a:attr, 'term': a:attr} : a:attr
  execute printf('hi %s guifg=%s guibg=%s gui=%s ctermfg=%s ctermbg=%s cterm=%s',
                 \ a:group,
                 \ a:fg.gui, a:bg.gui, l:attr.gui,
                 \ a:fg.term, a:bg.term, l:attr.term)
endfunction

" Programming
call s:hi('Normal', s:p.ice, s:p.black, s:p.none)
call s:hi('Comment', s:p.palepink, s:p.none, s:p.none)
call s:hi('Todo', s:p.palepink, s:p.none, 'reverse')
call s:hi('Error', s:p.grey, s:p.darkred, s:p.none)
call s:hi('Constant', s:p.teal, s:p.none, 'bold')
hi! link PreProc Constant
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreConduit PreProc
call s:hi('String', s:p.green, s:p.none, s:p.none)
hi! link Character String
call s:hi('Number', s:p.yellow, s:p.none, s:p.none)
hi! link Boolean Number
hi! link Float Number
call s:hi('Identifier', s:p.ice, s:p.none, s:p.none)
hi! link Function Identifier
call s:hi('Statement', s:p.blue, s:p.none, 'bold')
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Keyword Statement
hi! link Exception Statement
call s:hi('Operator', s:p.blue, s:p.none, s:p.none)
call s:hi('Type', s:p.purple, s:p.none, s:p.none)
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type
call s:hi('Special', s:p.pink, s:p.none, s:p.none)
hi! link SpecialChar Special
hi! link Delimiter Special
hi! link SpecialComment Special
hi! link Debug Special

" Borders
call s:hi('LineNr', s:p.blue, s:p.black, s:p.none)
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CursorLineNr LineNr
hi! link EndOfBuffer LineNr
hi! link NonText LineNr
call s:hi('MatchParen', s:p.none, s:p.darkpurple, 'bold')
call s:hi('VertSplit', s:p.ice, s:p.ice, s:p.none)
call s:hi('StatusLine', s:p.black, s:p.ice, 'bold')
call s:hi('StatusLineNC', s:p.black, s:p.ice, s:p.none)
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
call s:hi('TabLine', s:p.ice, s:p.black, 'reverse')
call s:hi('TabLineSel', s:p.ice, s:p.black, 'bold')
hi! link TabLineFill StatusLine

" Cursor/Selection
call s:hi('Cursor', s:p.grey, s:p.none, s:p.none)
call s:hi('CursorLine', s:p.none, s:p.darkblue, s:p.none)
" call s:hi('CursorColumn', '', '', '')
hi! link Visual CursorLine
hi! link VisualNOS Visual
call s:hi('Search', s:p.black, s:p.teal, 'bold')
hi! link IncSearch Search
hi! link QuickFixLine Search
hi! link WildMenu Search

" Diffs
call s:hi('DiffAdd', s:p.none, s:p.darkgreen, s:p.none)
call s:hi('DiffChange', s:p.none, s:p.darkblue, s:p.none)
call s:hi('DiffDelete', s:p.none, s:p.darkred, s:p.none)
call s:hi('DiffText', s:p.none, s:p.darkpurple, s:p.none)

" Folds
" call s:hi('Folded', '', '', '')
" call s:hi('FoldColumn', '', '', '')

" Popup
call s:hi('Pmenu', s:p.black, s:p.blue, s:p.none)
call s:hi('PmenuSel', s:p.black, s:p.ice, s:p.none)
call s:hi('PmenuSbar', s:p.none, s:p.purple, s:p.none)
call s:hi('PmenuThumb', s:p.none, s:p.palepink, s:p.none)
" call s:hi('Question', '', '', '')

" Messages
hi! link ErrorMsg Error
hi! link WarningMsg Error
call s:hi('ModeMsg', s:p.blue, s:p.none, 'bold')
hi! link MoreMsg ModeMsg

" Spelling
call s:hi('SpellBad', s:p.yellow, s:p.darkpurple, 'underline')
call s:hi('SpellCap', s:p.blue, s:p.darkpurple, 'underline')
call s:hi('SpellLocal', s:p.ice, s:p.darkpurple, 'underline')
call s:hi('SpellRare', s:p.pink, s:p.darkpurple, 'underline')

" Misc
call s:hi('Conceal', s:p.palepink, s:p.darkpurple, s:p.none)
hi! link ColorColumn WarningMsg
" call s:hi('SignColumn', '', '', '')
hi! link SpecialKey Special
call s:hi('Directory', s:p.teal, s:p.none, s:p.none)
hi! link Title ModeMsg
