if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

let g:signify_vcs_list = ['git', 'svn']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change

packadd vim-signify
packadd vim-fugitive
