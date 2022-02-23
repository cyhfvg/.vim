"================================================================================
" init-config.vim - 正常模式下的配置 在init-basic.vim 后调用
"================================================================================

"--------------------------------------------------------------------------------
" 语言配置 {{{1
"--------------------------------------------------------------------------------
  " 设置显示语言为英语
  let $LANG='en'
  set langmenu=en

" 1}}}

"--------------------------------------------------------------------------------
" 备份文件、交换文件设置 {{{1
"--------------------------------------------------------------------------------

" 允许备份
set backup

" 保存时备份
set writebackup

" 确保备份文件夹存在
let s:backupdir = g:vimfilehome .'/'.'dirs/backupdir'
if !isdirectory(s:backupdir)
  silent! call mkdir(expand(s:backupdir), "p", 0755)
endif

" 备份文件地址 统一管理
let &backupdir=s:backupdir

" 备份文件扩展名
set backupext=.bak

" 启用交换文件
set swapfile

" 确保交换文件夹存在
let s:swapdir = g:vimfilehome .'/'.'dirs/swapdir'
if !isdirectory(s:swapdir)
  silent! call mkdir(expand(s:swapdir), "p", 0755)
endif

" 设置交换文件地址
let &directory=s:swapdir .','.&directory

" 1}}}

"--------------------------------------------------------------------------------
" undo 设置 {{{1
"--------------------------------------------------------------------------------
"
" persistent_undo
if has("persistent_undo")
  let s:undo_path = expand(g:vimfilehome .'/'.'dirs/undodir')
  " create the directory and any parent directories
  " if the location does not exist.
  if !isdirectory(s:undo_path)
    call mkdir(s:undo_path, "p", 0755)
  endif
  let &undodir=s:undo_path
  set undofile
endif
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
