"
"
"ludovicchabant/vim-gutentags
"skywind3000/gutentags_plus
"skywind3000/vim-preview
"vim-scripts/taglist.vim
"
"

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"----------------------------------------------------------------------
"ludovicchabant/vim-gutentags {{{2
"debug
"let g:gutentags_trace = 1
" 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 设定所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 默认生成的数据文件集中到 vimfilehome/dirs/tag 避免污染项目目录，好清理
let s:tag_path = expand(g:vimfilehome .'/'.'dirs/tagdir')
if !isdirectory(s:tag_path)
  call mkdir(s:tag_path, "p", 0755)
endif
let g:gutentags_cache_dir = expand(s:tag_path)
" 默认禁用自动生成
let g:gutentags_modules = []
" 如果有 ctags 可执行就允许动态生成 ctags 文件
let g:gutentags_modules += ['ctags']
" 如果有 gtags 可执行就允许动态生成 gtags 数据库
if executable('gtags') && executable('gtags-cscope')
  let g:gutentags_modules += ['gtags_cscope']
endif
" 设置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 禁止 gutentags 自动链接 gtags 数据库
let g:gutentags_auto_add_gtags_cscope = 0
" 2}}}
"-------------------------------------------------------------------------------
packadd vim-gutentags
" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
packadd gutentags_plus
"skywind3000/vim-preview
" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
packadd vim-preview
"liuchengxu/vista.vim
packadd vista.vim
"-------------------------------------------------------------------------------
