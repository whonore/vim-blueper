function! Fish(p, themedir) abort
  let l:tgt = a:themedir . '/blueper_colors.fish'
  let l:txt = []
  for [l:name, l:color] in items(a:p)
    if l:name ==# 'none'
      continue
    endif
    let l:txt = add(l:txt, printf('set -x blueper_%s %s', l:name, l:color.gui[1:]))
  endfor
  return [l:tgt, l:txt]
endfunction
