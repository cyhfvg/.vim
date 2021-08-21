"mhinz/vim-signify
"tpope/vim-fugitive
"
" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
"mhinz/vim-signify {{{1
let g:signify_vcs_list = ['git', 'svn']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change
" 1}}}
"-------------------------------------------------------------------------------
" 用于在侧边符号栏显示 git/svn 的 diff
packadd vim-signify
packadd vim-fugitive
"-------------------------------------------------------------------------------
