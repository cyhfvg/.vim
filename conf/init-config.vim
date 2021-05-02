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
if !isdirectory('~/.vim/dirs/backupdir')
  silent! call mkdir(expand('~/.vim/dirs/backupdir'), "p", 0755)
endif

" 备份文件地址 统一管理
set backupdir=~/.vim/dirs/backupdir

" 备份文件扩展名
set backupext=.bak

" 禁用交换文件
set swapfile

" 确保交换文件夹存在
if !isdirectory('~/.vim/dirs/swapdir')
  silent! call mkdir(expand('~/.vim/dirs/swapdir'), "p", 0755)
endif

" 设置交换文件地址
set directory^=~/.vim/dirs/swapdir

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
