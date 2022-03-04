if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

" prepare for `xolox`
packadd vim-misc
