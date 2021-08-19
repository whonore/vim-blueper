" Author: Wolf Honore

function! s:defColor(gui) abort
  return a:gui !=# 'NONE'
    \ ? {'gui': a:gui, 'term': blueper#hexterm#hex2term(a:gui)}
    \ : {'gui': 'NONE', 'term': 'NONE'}
endfunction

let s:palette = {
  \ 'black': s:defColor('#000000'),
  \ 'red': s:defColor('#ff0000'),
  \ 'darkred': s:defColor('#870000'),
  \ 'blue': s:defColor('#0087ff'),
  \ 'darkblue': s:defColor('#00005f'),
  \ 'green': s:defColor('#00ff5f'),
  \ 'darkgreen': s:defColor('#005f00'),
  \ 'grey': s:defColor('#ffffff'),
  \ 'darkgrey': s:defColor('#121212'),
  \ 'yellow': s:defColor('#ffff00'),
  \ 'purple': s:defColor('#af87ff'),
  \ 'darkpurple': s:defColor('#5f005f'),
  \ 'pink': s:defColor('#ff87ff'),
  \ 'palepink': s:defColor('#ffd7ff'),
  \ 'darkpink': s:defColor('#d700ff'),
  \ 'teal': s:defColor('#00ffff'),
  \ 'ice': s:defColor('#afffff'),
  \ 'none': s:defColor('NONE'),
  \ 'TODO': s:defColor('#ff6800'),
\}

function! blueper#Palette() abort
  return s:palette
endfunction

function! blueper#gui(p, type) abort
  return
    \ a:type ==# 'rgb' ? {name -> blueper#hexterm#hex2term(a:p[name].gui)}
    \ : a:type ==# 'barehex' ? {name -> trim(a:p[name].gui, '#', 1)}
    \ : {name -> a:p[name].gui}
endfunction
