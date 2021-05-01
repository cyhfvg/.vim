"================================================================================
" init-config.vim - 正常模式下的配置 在init-basic.vim 后调用
"================================================================================

"--------------------------------------------------------------------------------
" 语言配置 {{{1
"--------------------------------------------------------------------------------
  " 设置显示语言为英语
  let $LANG='en'
  set langmenu=en

  " 设置中文帮助语言
  set helplang=cn
" 1}}}

"--------------------------------------------------------------------------------
" 备份文件、交换文件设置 {{{1
"--------------------------------------------------------------------------------

" 允许备份
set backup

" 保存时备份
set writebackup

" 确保备份文件夹存在
if !isdirectory('~/.vim/backupdir')
  silent! call mkdir(expand('~/.vim/backupdir'), "p", 0755)
endif

" 备份文件地址 统一管理
set backupdir=~/.vim/backupdir

" 备份文件扩展名
set backupext=.bak


" 禁用交换文件
set swapfile

" 确保备份文件夹存在
if !isdirectory('~/.vim/swapdir')
  silent! call mkdir(expand('~/.vim/swapdir'), "p", 0755)
endif

" 设置交换文件地址
set directory^=~/.vim/swapdir

" 1}}}

"--------------------------------------------------------------------------------
" 配置微调 {{{1
"--------------------------------------------------------------------------------

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") | 
  \   exe "normal! g`\"" | 
  \ endif

if !exists(":DiffChanged")
  command DiffChanged vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

" 1}}}


"--------------------------------------------------------------------------------
" 文件类型微调 {{{1
"--------------------------------------------------------------------------------
augroup InitFileTypesGroup
  " 清除同组的历史 autocommand
  au!

  " C/C++ 文件使用 // 作为注释
  au FileType c,cpp setlocal commentstring=//\ %s

  " markdown 允许自动换行
  au FileType markdown setlocal wrap

  " lisp 进行微调
  au FileType lisp setlocal ts=8 sts=2 sw=2 et

  " scala 微调
  au FileType scala setlocal sts=4 sw=4 noet

  " haskell 进行微调
  au FileType haskell setlocal et

  " quickfix 隐藏行号
  au FileType qf setlocal nonumber

  " 强制对某些扩展名的 filetype 进行纠正
  au BufNewFile,BufRead *.as setlocal filetype=actionscript
  au BufNewFile,BufRead *.pro setlocal filetype=prolog
  au BufNewFile,BufRead *.es setlocal filetype=erlang
  au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
  au BufNewFile,BufRead *.vl setlocal filetype=verilog

augroup END

" 1}}}
