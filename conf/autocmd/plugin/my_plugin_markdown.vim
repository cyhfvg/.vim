"
"
"mzlogin/vim-markdown-toc
"plasticboy/vim-markdown
"markdown-preview.nvim
"
"

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
"vim-markdown-toc 取消存储时自动更新目录
let g:vmt_auto_update_on_save = 0
"markdown-preview.nvim {{{1
" 指定浏览器路径
let g:mkdp_path_to_chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
" 打开/关闭预览
" 1}}}
nnoremap <silent> <leader>mv :MarkdownPreviewToggle<cr>
"-------------------------------------------------------------------------------
"markdown 高亮,语法
"依赖于tabular 确保tabular启动于vim-markdown之前
packadd tabular
packadd vim-markdown
"生成markdown目录
" 在当前光标后生成目录
" :GenTocMarked
" 更新目录
" :UpdateToc
packadd vim-markdown-toc
" 手动至markdown-preview.nvim/app目录下安装nodejs依赖`yarn install`
packadd markdown-preview.nvim
"-------------------------------------------------------------------------------
