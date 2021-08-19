if exists('g:loaded_blueper')
  finish
endif
let g:loaded_blueper = 1

let s:root = expand('<sfile>:p:h:h') . '/themes'

function! s:str(x) abort
  return type(a:x) == type('') ? a:x : string(a:x)
endfunction

function! s:qfentry(theme, tgt, ok, reason) abort
  return {
    \ 'filename': a:tgt,
    \ 'module': a:theme,
    \ 'text': a:ok ? 'Ok' : 'Fail - ' . a:reason,
    \ 'lnum': 1
  \}
endfunction

function! s:write_theme(tgt, txt) abort
  let l:dir = fnamemodify(a:tgt, ':h')
  if !isdirectory(l:dir)
    if !mkdir(l:dir)
      return [0, 'Could not create ' . l:dir]
    endif
  endif
  return [writefile(a:txt, a:tgt) == 0, 'Could not create ' . a:tgt]
endfunction

function! s:mk_tmpl(p, tmpl) abort
  let l:p = a:tmpl =~# '_rgb$' ? blueper#PaletteRGB(a:p) : a:p
  let l:tgt = fnamemodify(a:tmpl, ':r')
  let l:txt = join(readfile(a:tmpl), "\n")
  try
    let l:txt = substitute(l:txt, '{{\(\w*\)}}', '\=s:str(l:p[submatch(1)].gui)', 'g')
    return [1, l:tgt, split(l:txt, "\n")]
  catch /^Vim\%((\a\+)\)\=:E716:/
    return [0, l:tgt, 'Invalid color: ' . split(v:exception, ': ')[-1]]
  endtry
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
      let [l:ok, l:reason] = s:write_theme(l:tgt, l:txt)
      let l:res = add(l:res, s:qfentry(l:theme, l:tgt, l:ok, l:reason))
    endif

    " Default to s:mk_tmpl for all .tmpl files
    let l:tmpls = glob(l:themedir . '/**/*.tmpl*', 0, 1)
    if l:tmpls == [] && l:res == []
      let l:res = add(
        \ l:res,
        \ s:qfentry(l:theme, l:themedir, 0, 'Could not find .tmpl file'))
    else
      for l:tmpl in l:tmpls
        let [l:ok, l:tgt, l:txt] = s:mk_tmpl(l:p, l:tmpl)
        let l:reason = l:txt
        if l:ok
          let [l:ok, l:reason] = s:write_theme(l:tgt, l:txt)
        endif
        let l:res = add(l:res, s:qfentry(l:theme, l:tgt, l:ok, l:reason))
      endfor
    endif
  endfor
  return l:res
endfunction

command! Blueper call setqflist(s:mk_themes()) | cwindow
