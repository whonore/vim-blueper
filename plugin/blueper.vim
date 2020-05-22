if exists('g:loaded_blueper')
  finish
endif
let g:loaded_blueper = 1

let s:root = expand('<sfile>:p:h:h') . '/themes'
let s:themes = ['tmTheme', 'fish']

function! s:write_theme(tgt, txt) abort
  let l:dir = fnamemodify(a:tgt, ':h')
  if !isdirectory(l:dir)
    if !mkdir(l:dir)
      return ''
    endif
  endif
  return writefile(a:txt, a:tgt) == 0 ? a:tgt : ''
endfunction

function! s:mk_tmTheme(p) abort
  let l:tgt = s:root . '/tmTheme/Blueper.tmTheme'
  let l:txt = join(readfile(l:tgt . '.tmpl'), "\n")
  let l:txt = substitute(l:txt, '{{\(\w*\)}}', '\=a:p[submatch(1)].gui', 'g')
  return s:write_theme(l:tgt, split(l:txt, "\n"))
endfunction

function! s:mk_fish(p) abort
  let l:tgt = s:root . '/fish/blueper_colors.fish'
  let l:txt = ['function blueper_colors']
  for [l:name, l:color] in items(a:p)
    if l:name ==# 'none'
      continue
    endif
    let l:txt = add(l:txt, printf('    set -g blueper_%s %s', l:name, l:color.gui[1:]))
  endfor
  let l:txt = add(l:txt, 'end')
  return s:write_theme(l:tgt, l:txt)
endfunction

function! s:mk_themes() abort
  let l:p = blueper#Palette()
  for l:theme in s:themes
    let l:Func = function('s:mk_' . l:theme)
    let l:ok = l:Func(l:p)
    echom printf('%s: %s', l:theme, !empty(l:ok) ? l:ok : 'Fail')
  endfor
endfunction

command! Blueper call s:mk_themes()
