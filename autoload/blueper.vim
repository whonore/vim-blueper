" Author: Wolf Honore

function! s:defColor(gui, term) abort
  return {'gui': a:gui, 'term': a:term}
endfunction

function! blueper#hex2rgb(hex) abort
  return map([a:hex[1:2], a:hex[3:4], a:hex[5:6]], 'str2nr(v:val, 16)')
endfunction

let s:palette = {
  \ 'black': s:defColor('#000000', 16),
  \ 'red': s:defColor('#ff0000', 196),
  \ 'darkred': s:defColor('#870000', 88),
  \ 'blue': s:defColor('#0087ff', 33),
  \ 'darkblue': s:defColor('#00005f', 17),
  \ 'green': s:defColor('#00ff5f', 47),
  \ 'darkgreen': s:defColor('#005f00', 22),
  \ 'grey': s:defColor('#ffffff', 15),
  \ 'darkgrey': s:defColor('#121212', 233),
  \ 'yellow': s:defColor('#ffff00', 226),
  \ 'purple': s:defColor('#af87ff', 141),
  \ 'darkpurple': s:defColor('#5f005f', 53),
  \ 'pink': s:defColor('#ff87ff', 213),
  \ 'palepink': s:defColor('#ffd7ff', 225),
  \ 'darkpink': s:defColor('#d700ff', 165),
  \ 'teal': s:defColor('#00ffff', 51),
  \ 'ice': s:defColor('#afffff', 159),
  \ 'none': s:defColor('NONE', 'NONE')
\}

function! blueper#Palette() abort
  return s:palette
endfunction

function! blueper#PaletteRGB(p) abort
  let l:rgb = deepcopy(a:p)
  for [l:name, l:color] in items(a:p)
    let l:rgb[l:name].gui = blueper#hex2rgb(l:color.gui)
  endfor
  return l:rgb
endfunction
