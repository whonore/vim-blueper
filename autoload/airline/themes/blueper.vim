" Author: Wolf Honore

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

function! s:mk_color(fg, bg) abort
  let l:bg = type(a:bg) == type('') ? {'gui': '', 'term': ''} : a:bg
  return [a:fg.gui, l:bg.gui, a:fg.term, l:bg.term, 'NONE']
endfunction

function! s:build_palette() abort
  let l:p = {}

  let l:p.normal = airline#themes#generate_color_map(
    \ s:mk_color(s:black, s:teal),
    \ s:mk_color(s:ice, s:darkblue),
    \ s:mk_color(s:teal, s:black)
  \)
  let l:p.normal_modified = {
    \ 'airline_a': l:p.normal.airline_y
  \}

  let l:p.insert = airline#themes#generate_color_map(
    \ s:mk_color(s:black, s:purple),
    \ s:mk_color(s:green, s:darkpurple),
    \ s:mk_color(s:purple, s:black)
  \)
  let l:p.insert_modified = {
    \ 'airline_a': l:p.insert.airline_y
  \}

  let l:p.replace = airline#themes#generate_color_map(
    \ s:mk_color(s:black, s:pink),
    \ s:mk_color(s:yellow, s:darkpink),
    \ s:mk_color(s:pink, s:black)
  \)
  let l:p.replace_modified = {
    \ 'airline_a': l:p.replace.airline_y
  \}

  let l:p.visual = airline#themes#generate_color_map(
    \ s:mk_color(s:black, s:green),
    \ s:mk_color(s:palepink, s:darkgreen),
    \ s:mk_color(s:green, s:black)
  \)
  let l:p.visual_modified = {
    \ 'airline_a': l:p.visual.airline_y
  \}

  let l:p.inactive = airline#themes#generate_color_map(
    \ s:mk_color(s:grey, s:darkgrey),
    \ s:mk_color(s:grey, s:darkgrey),
    \ s:mk_color(s:grey, s:darkgrey)
  \)

  let l:p.accents = {
    \ 'red': s:mk_color(s:red, ''),
    \ 'green': s:mk_color(s:green, ''),
    \ 'blue': s:mk_color(s:blue, ''),
    \ 'yellow': s:mk_color(s:yellow, ''),
    \ 'orange': s:mk_color(s:darkred, ''),
    \ 'purple': s:mk_color(s:purple, '')
  \}

  return l:p
endfunction

let g:airline#themes#blueper#palette = s:build_palette()
