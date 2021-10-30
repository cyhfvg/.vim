if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

"-------------------------------------------------------------------------------
"markdown-preview.nvim {{{1
" 指定浏览器路径
let g:mkdp_path_to_chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
" 打开/关闭预览
nnoremap <silent> <leader>mv :MarkdownPreviewToggle<cr>
" 手动至markdown-preview.nvim/app目录下安装nodejs依赖`yarn install`
packadd markdown-preview.nvim
" 1}}}
"-------------------------------------------------------------------------------
"markdown 高亮,语法
"依赖于tabular 确保tabular启动于vim-markdown之前
packadd tabular
packadd vim-markdown

" 表格模式 {{{1
packadd vim-table-mode
" | toggle table mode  | <leader>tm      |
" | 表格重新对齐       | <leader>tr      |
" | 删除一行           | <leader>tdd     |
" | 删除一列           | <leader>tdc     |
" | 左侧增加一列       | <leader>tiC     |
" | 右侧增加一列       | <leader>tic     |
" | 高亮单元格         | <leader>t?      |
" | 转换选中内容为表格 | <leader>tt      |
" | 表格移动 行        | {<Bar> / }<Bar> |
" | 表格移动 列        | [<Bar> / ]<Bar> |
" | 标识对齐方式字符   | :               |
"1}}}
"-------------------------------------------------------------------------------
