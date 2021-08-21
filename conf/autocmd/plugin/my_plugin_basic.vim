"
"
"easymotion/vim-easymotion
"
"

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
" 全文快速移动，<leader><leader>f{char} 即可触发
packadd vim-easymotion
map <Leader><Leader> <Plug>(easymotion-prefix)
"-------------------------------------------------------------------------------
