if exists('g:loaded_blueper')
  finish
endif
let g:loaded_blueper = 1

let s:root = expand('<sfile>:p:h:h') . '/themes'

function! s:write_theme(tgt, txt) abort
  let l:dir = fnamemodify(a:tgt, ':h')
  if !isdirectory(l:dir)
    if !mkdir(l:dir)
      return ''
    endif
  endif
  return writefile(a:txt, a:tgt) == 0
endfunction

function! s:str(x) abort
  return type(a:x) == type('') ? a:x : string(a:x)
endfunction

function! s:qfentry(theme, tgt, ok)
  return {
      \ 'filename': a:tgt,
      \ 'module': a:theme,
      \ 'text': a:ok ? 'Ok' : 'Fail',
      \ 'lnum': 1
  \}
endfunction

function! s:mk_tmpl(p, tmpl) abort
  let l:p = a:tmpl =~# '_rgb$' ? blueper#PaletteRGB(a:p) : a:p
  let l:tgt = fnamemodify(a:tmpl, ':r')
  let l:txt = join(readfile(a:tmpl), "\n")
  let l:txt = substitute(l:txt, '{{\(\w*\)}}', '\=s:str(l:p[submatch(1)].gui)', 'g')
  return [l:tgt, split(l:txt, "\n")]
endfunction

function! s:mk_themes() abort
  let l:p = blueper#Palette()
  let l:res = []
  for l:theme in readdir(s:root, 'isdirectory(s:root . "/" . v:val)')
    let l:themedir = s:root . '/' . l:theme
    let l:themefunc = substitute(l:theme, '.', '\U\0', '')
    execute 'silent! source ' . l:themedir . '/' . l:theme . '.vim'
    if exists('*' . l:themefunc)
      let [l:tgt, l:txt] = call(l:themefunc, [l:p, l:themedir])
      let l:ok = s:write_theme(l:tgt, l:txt)
      let l:res = add(l:res, s:qfentry(l:theme, l:tgt, l:ok))
    else
      " Default to s:mk_tmpl for all .tmpl files
      let l:tmpls = glob(l:themedir . '/*.tmpl*', 0, 1)
      if l:tmpls == []
        let l:res = add(l:res, s:qfentry(l:theme, l:themedir, 0))
      else
        for l:tmpl in l:tmpls
          let [l:tgt, l:txt] = s:mk_tmpl(l:p, l:tmpl)
          let l:ok = s:write_theme(l:tgt, l:txt)
          let l:res = add(l:res, s:qfentry(l:theme, l:tgt, l:ok))
        endfor
      endif
    endif
  endfor
  return l:res
endfunction

command! Blueper call setqflist(s:mk_themes()) | cwindow
