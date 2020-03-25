" Author: Wolf Honore

function! s:defColor(gui, term) abort
  return {'gui': a:gui, 'term': a:term}
endfunction

let s:palette = {
  \ 'black': s:defColor('NONE', 16),
  \ 'red': s:defColor('NONE', 196),
  \ 'darkred': s:defColor('NONE', 88),
  \ 'blue': s:defColor('NONE', 33),
  \ 'darkblue': s:defColor('NONE', 17),
  \ 'green': s:defColor('NONE', 47),
  \ 'darkgreen': s:defColor('NONE', 22),
  \ 'grey': s:defColor('NONE', 15),
  \ 'darkgrey': s:defColor('NONE', 233),
  \ 'yellow': s:defColor('NONE', 226),
  \ 'purple': s:defColor('NONE', 141),
  \ 'darkpurple': s:defColor('NONE', 53),
  \ 'pink': s:defColor('NONE', 213),
  \ 'palepink': s:defColor('NONE', 225),
  \ 'darkpink': s:defColor('NONE', 165),
  \ 'teal': s:defColor('NONE', 51),
  \ 'ice': s:defColor('NONE', 159)
\}

function! blueper#Palette() abort
  return s:palette
endfunction
