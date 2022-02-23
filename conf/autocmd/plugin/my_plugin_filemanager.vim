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
"-------------------------------------------------------------------------------
