"
"
"scrooloose/nerdtree
"tiagofumo/vim-nerdtree-syntax-highlight
"Xuyuanp/nerdtree-git-plugin
"
"

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 0
"-------------------------------------------------------------------------------
packadd nerdtree
packadd nerdtree-git-plugin
packadd vim-nerdtree-syntax-highlight
"-------------------------------------------------------------------------------
