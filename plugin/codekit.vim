" plugin/codekit.vim - CodeKit 2 support for Vim
" Maintainer: Noah Frederick

""
" @section Introduction, intro
" @stylized CodeKit.vim
" Support for controlling CodeKit 2 from Vim. @plugin(stylized) uses
" CodeKit's AppleScript interface to provide the following features:
"
" * Add the current project to CodeKit
" * Switch to the current file's project
" * Preview the current project in a browser
" * Pause and unpause CodeKit's watching of project files
"
" This plug-in is only available if 'compatible' is not set.

""
" @section About, about
" @plugin(stylized) is distributed under the same terms as Vim itself (see
" |license|)
"
" You can find the latest version of this plug-in on GitHub:
" https://github.com/noahfrederick/vim-@plugin(name)
"
" Please report issues on GitHub as well:
" https://github.com/noahfrederick/vim-@plugin(name)/issues

if (exists('g:loaded_codekit') && g:loaded_codekit) || &cp
  finish
endif
let g:loaded_codekit = 1

""
" Add the current working directory as a project to CodeKit. If [directory] is
" supplied, use it as the project root instead.
command! -bar -nargs=? -complete=dir CKadd call codekit#add(<q-args>)

""
" Focus the project to which the current buffer's file belongs. Focusing a
" project makes it active in CodeKit. If [path] is supplied, focus that file
" or directory instead.
command! -bar -nargs=? -complete=file CKfocus call codekit#focus(<q-args>)

""
" Focus the project to which the current buffer's file belongs and preview it
" in the default browser. If [browser] is supplied, use that browser instead.
" See the provided completion for supported browser names.
command! -bar -nargs=? -complete=customlist,codekit#complete_browser CKpreview call codekit#preview(<q-args>)

""
" Pause CodeKit's watching of project files (has no effect if already paused).
command! -bar -nargs=0 CKpause call codekit#pause()

""
" Resume CodeKit's watching of project files (has no effect if already
" unpaused).
command! -bar -nargs=0 CKunpause call codekit#unpause()

" vim: fdm=marker:sw=2:sts=2:et
