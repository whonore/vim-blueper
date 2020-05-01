let s:p = blueper#Palette()

function! s:mk_color(fg, bg, opt) abort
  return {
    \ 'guifg': a:fg.gui,
    \ 'guibg': a:bg.gui,
    \ 'gui': a:opt,
    \ 'ctermfg': a:fg.term,
    \ 'ctermbg': a:bg.term,
    \ 'cterm': a:opt,
    \ 'font': 'NONE'
  \}
endfunction

let s:palette = {
  \ 'stlName': s:mk_color(s:p.black, s:p.teal, 'bold'),
  \ 'stlCategory': s:mk_color(s:p.black, s:p.purple, 'NONE'),
  \ 'stlNameOnlyMode': s:mk_color(s:p.palepink, s:p.darkgreen, 'NONE'),
  \ 'stlFullPathMode': s:mk_color(s:p.ice, s:p.darkblue, 'NONE'),
  \ 'stlFuzzyMode': s:mk_color(s:p.green, s:p.darkpurple, 'NONE'),
  \ 'stlRegexMode': s:mk_color(s:p.yellow, s:p.darkpink, 'NONE'),
  \ 'stlCwd': s:mk_color(s:p.teal, s:p.black, 'NONE'),
  \ 'stlBlank': s:mk_color(s:p.teal, s:p.black, 'NONE'),
  \ 'stlLineInfo': s:mk_color(s:p.ice, s:p.darkblue, 'NONE'),
  \ 'stlTotal': s:mk_color(s:p.ice, s:p.darkblue, 'NONE'),
\}

let g:leaderf#colorscheme#blueper#palette = leaderf#colorscheme#mergePalette(s:palette)
