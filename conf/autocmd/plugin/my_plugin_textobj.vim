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

" ys<operator><desired>    ==> add surround
" cs<existing><desired>    ==> change surround, <existing> to <desired>
" ds<existing>             ==> delete surround, <existing>
" S<desired>               ==> visual mode: surround selected content
packadd vim-surround

" enhanced %
packadd vim-matchup
