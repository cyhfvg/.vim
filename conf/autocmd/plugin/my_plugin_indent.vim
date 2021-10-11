"
"
"Yggdroot/indentLine
"
"
" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"----------------------------------------------------------------------
" 禁用颜色=>使用主题的配色
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['¦', '┆', '┊']
nnoremap <silent> <leader>i :IndentLinesToggle<cr>
"----------------------------------------------------------------------
packadd indentLine
"----------------------------------------------------------------------
