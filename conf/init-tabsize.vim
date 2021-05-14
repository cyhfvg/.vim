"================================================================================
" init-tabsize.vim - 大部分人对 tabsize 都有自己的设置
"================================================================================

"--------------------------------------------------------------------------------
" 默认缩进模式
"--------------------------------------------------------------------------------

" 设置缩进宽度
set sw=4

" 设置 TAB 宽度
set tabstop=4

" 展开tab , 使用 空格替代tab符
set expandtab

" expandtab 设置 tab 使用 几个空格替代
set softtabstop=4

augroup PythonTab
  au!
  " 需要在python中使用tab缩进时 使用下面的设置
  au FileType python setlocal shiftwidth=2 tabstop=2 expandtab
augroup End

augroup VimLTab
  au!
  " 需要在vimscript中使用tab缩进时 使用下面的设置
  au FileType vim setlocal shiftwidth=2 tabstop=2 expandtab
augroup End

augroup JsTab
  au!
  " 需要在javascript中使用tab缩进时 使用下面的设置
  au FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
augroup End
