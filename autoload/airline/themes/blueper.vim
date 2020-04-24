" Author: Wolf Honore

let s:p = blueper#Palette()

function! s:mk_color(fg, bg) abort
  let l:bg = type(a:bg) == type('') ? {'gui': '', 'term': ''} : a:bg
  return [a:fg.gui, l:bg.gui, a:fg.term, l:bg.term, 'NONE']
endfunction

function! s:build_palette() abort
  let l:p = {}

  let l:p.normal = airline#themes#generate_color_map(
    \ s:mk_color(s:p.black, s:p.teal),
    \ s:mk_color(s:p.ice, s:p.darkblue),
    \ s:mk_color(s:p.teal, s:p.black)
  \)
  let l:p.normal_modified = {
    \ 'airline_a': l:p.normal.airline_y
  \}

  let l:p.insert = airline#themes#generate_color_map(
    \ s:mk_color(s:p.black, s:p.purple),
    \ s:mk_color(s:p.green, s:p.darkpurple),
    \ s:mk_color(s:p.purple, s:p.black)
  \)
  let l:p.insert_modified = {
    \ 'airline_a': l:p.insert.airline_y
  \}

  let l:p.replace = airline#themes#generate_color_map(
    \ s:mk_color(s:p.black, s:p.pink),
    \ s:mk_color(s:p.yellow, s:p.darkpink),
    \ s:mk_color(s:p.pink, s:p.black)
  \)
  let l:p.replace_modified = {
    \ 'airline_a': l:p.replace.airline_y
  \}

  let l:p.visual = airline#themes#generate_color_map(
    \ s:mk_color(s:p.black, s:p.green),
    \ s:mk_color(s:p.palepink, s:p.darkgreen),
    \ s:mk_color(s:p.green, s:p.black)
  \)
  let l:p.visual_modified = {
    \ 'airline_a': l:p.visual.airline_y
  \}

  let l:p.inactive = airline#themes#generate_color_map(
    \ s:mk_color(s:p.grey, s:p.darkgrey),
    \ s:mk_color(s:p.grey, s:p.darkgrey),
    \ s:mk_color(s:p.grey, s:p.darkgrey)
  \)

  let l:p.accents = {
    \ 'red': s:mk_color(s:p.red, ''),
    \ 'green': s:mk_color(s:p.green, ''),
    \ 'blue': s:mk_color(s:p.blue, ''),
    \ 'yellow': s:mk_color(s:p.yellow, ''),
    \ 'orange': s:mk_color(s:p.darkred, ''),
    \ 'purple': s:mk_color(s:p.purple, '')
  \}

  return l:p
endfunction

let g:airline#themes#blueper#palette = s:build_palette()
