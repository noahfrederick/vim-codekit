" autoload/codekit.vim - CodeKit 2 support for Vim
" Maintainer: Noah Frederick

function! s:osascript(cmds) abort
  let cmds = join(a:cmds, '" -e "')
  silent execute '!osascript -e "' . cmds . '" &>/dev/null &'
  redraw!
endfunction

function! s:tell_codekit_to(cmd)
  let cmds = [
        \ 'ignoring application responses',
        \   'tell application \"CodeKit\"',
        \     a:cmd,
        \   'end tell',
        \ 'end ignoring',
        \ ]
  call s:osascript(cmds)
endfunction

function! codekit#add(dir)
  if a:dir ==# ''
    let dir = getcwd()
  else
    let dir = fnamemodify(a:dir, ':p')
  endif

  call s:tell_codekit_to('add project at path \"' . dir . '\"')
endfunction

function! codekit#focus(path)
  if a:path ==# ''
    let path = expand('%:p')
  else
    let path = a:path
  endif

  call s:tell_codekit_to('select project containing path \"' . path . '\"')
endfunction

function! codekit#preview(browser)
  call codekit#focus('')

  if a:browser ==# ''
    call s:tell_codekit_to('preview in browser')
  else
    call s:tell_codekit_to('preview in browser ' . a:browser)
  endif
endfunction

function! codekit#pause()
  call s:tell_codekit_to('pause file watching')
endfunction

function! codekit#unpause()
  call s:tell_codekit_to('unpause file watching')
endfunction

function! codekit#complete_browser(A, L, P)
  return [
        \ 'Safari',
        \ 'Chrome',
        \ 'Firefox',
        \ 'Opera',
        \ 'Webkit Nightly',
        \ 'Chrome Canary',
        \ 'Chromium',
        \ ]
endfunction

" vim: fdm=marker:sw=2:sts=2:et
