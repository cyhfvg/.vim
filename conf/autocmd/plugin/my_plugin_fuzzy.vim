" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

packadd fzf
packadd fzf.vim

"-------------------------------------------------------------------------------
"
let g:fzf_preview_window = ['up:50%', 'ctrl-/']
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" Ctrl+p 打开文件模糊匹配
noremap <c-p> :Files<cr>

" Alt+p 打开最近访问过的文件的匹配
noremap <m-p> :History<cr>

"Ctrl+n匹配 Buffer
noremap <c-n> :Buffers<cr>

" Alt+l 匹配文本行
noremap <m-l> :Lines<cr>
"-------------------------------------------------------------------------------
