"================================================================================
" init-tabsize.vim
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
  au FileType python setlocal shiftwidth=4 tabstop=4 expandtab
augroup End

augroup VimLTab
  au!
  au FileType vim setlocal shiftwidth=2 tabstop=2 expandtab
augroup End

augroup JsTab
  au!
  au FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
augroup End
