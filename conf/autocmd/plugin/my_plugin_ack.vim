if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------

if executable('ag')
  " silversearcher-ag
  let g:ackprg = 'ag --vimgrep'
endif

"-------------------------------------------------------------------------------
packadd ack.vim
"-------------------------------------------------------------------------------
