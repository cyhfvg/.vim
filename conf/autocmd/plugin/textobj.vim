if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"----------------------------------------------------------------------
" base plugin for other `textobj-plugin`
packadd vim-textobj-user

" indent textobj：ii / ai
packadd vim-textobj-indent
" argument textobj：i, / a,
packadd vim-textobj-parameter
