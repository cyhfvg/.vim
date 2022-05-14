if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"===============================================================================

packadd vim-preview
