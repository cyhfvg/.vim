"
"
"chrisbra/vim-diff-enhanced
"
"

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
" git 仓库使用 histogram 算法进行 diff
let g:signify_vcs_cmds = {
    \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
    \}

if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif
"-------------------------------------------------------------------------------
" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
packadd vim-diff-enhanced
"-------------------------------------------------------------------------------
