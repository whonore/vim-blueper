function! Fish(p, themedir) abort
  let l:tgt = a:themedir . '/blueper_colors.fish'
  let l:txt = ['function blueper_colors']
  for [l:name, l:color] in items(a:p)
    if l:name ==# 'none'
      continue
    endif
    let l:txt = add(l:txt, printf('    set -g blueper_%s %s', l:name, l:color.gui[1:]))
  endfor
  let l:txt = add(l:txt, 'end')
  return [l:tgt, l:txt]
endfunction
