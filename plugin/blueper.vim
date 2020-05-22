if exists('g:loaded_blueper')
  finish
endif
let g:loaded_blueper = 1

let s:root = expand('<sfile>:p:h:h')

function! s:mk_tmTheme(p) abort
  let l:tgt = s:root . '/tmTheme/Blueper.tmTheme'
  let l:txt = join(readfile(l:tgt . '.tmpl'), "\n")
  let l:txt = substitute(l:txt, '{{\(\w*\)}}', '\=a:p[submatch(1)].gui', 'g')
  return writefile(split(l:txt, "\n"), l:tgt) == 0
endfunction

function! s:mk_themes() abort
  let l:p = blueper#Palette()
  for l:theme in ['tmTheme']
    let l:Func = function('s:mk_' . l:theme)
    let l:ok = l:Func(l:p)
    echom printf('%s: %s', l:theme, l:ok ? 'Ok' : 'Fail')
  endfor
endfunction

command! Blueper call s:mk_themes()
