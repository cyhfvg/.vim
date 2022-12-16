vim9script
if get(s:, 'loaded', v:false)
    finish
else
    var loaded = v:true
endif

g:NERDTreeMinimalUI = 1
g:NERDTreeDirArrows = 1
g:NERDTreeHijackNetrw = 0

packadd nerdtree
