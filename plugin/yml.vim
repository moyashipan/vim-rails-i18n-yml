function! yml#search(pos)
  let indent = indent(a:pos)

  let keys = [s:get_key(getline(a:pos))]
  for n in range(line(a:pos), 1, -1)
    if indent(n) == (indent - &tabstop)
      call insert(keys, s:get_key(getline(n)))
      let indent = indent - &tabstop
    endif
  endfor

  echo join(keys, '.')
endfunction

function! yml#jump(path) range
  let indent = 0
  let min_line = 1
  let max_line = line("$")

  for key in split(a:path, '\.')
    call cursor(min_line, 0)
    let space = repeat(" ", indent)

    call search('^' . space . key . ':', 'W', max_line)
    let min_line = line('.')

    call search('^' . space . '[^ ]\+:', 'W', max_line)
    if line('.') != min_line
      let max_line = line('.')
    endif

    let indent = indent + &tabstop
  endfor

  call cursor(min_line, indent - 1)
endfunction

function! s:get_key(line_str)
  let space_with_key = matchstr(a:line_str, '^[^:]\+')
  return substitute(space_with_key, '[ :]*', '', 'g')
endfunction
