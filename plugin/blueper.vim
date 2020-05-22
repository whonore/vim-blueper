if exists('g:loaded_blueper')
  finish
endif
let g:loaded_blueper = 1

let s:root = expand('<sfile>:p:h:h')

function! s:mk_tmTheme(p) abort
  let l:tgt = s:root . '/tmTheme/Blueper.tmTheme'
  let l:txt = join(readfile(l:tgt . '.tmpl'), "\n")
  let l:txt = substitute(l:txt, '{{\(\w*\)}}', '\=a:p[submatch(1)].gui', 'g')
  call writefile(split(l:txt, "\n"), l:tgt)
endfunction

function! s:mk_themes() abort
  let l:p = blueper#Palette()
  call s:mk_tmTheme(l:p)
endfunction

command! Blueper call s:mk_themes()
