" ==============================================================================
" init.vim - initialize config
" ==============================================================================

if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

" config file's home directory(init.vim's parent directory)
let g:vimfilehome = fnamemodify(resolve(expand('<sfile>:p')), ':h')

command! -nargs=1 LoadConfig exec 'source '.g:vimfilehome .'/'.'<args>'

" add config home directory into runtimepath
exec 'set runtimepath+=' .g:vimfilehome
" add config home directory into packpath
exec 'set packpath+=' .g:vimfilehome

" ensure `~/.vim` added into runtimepath
set runtimepath+=~/.vim

" load config modules
LoadConfig conf/init-basic.vim
" extension
LoadConfig conf/init-config.vim
LoadConfig conf/init-tabsize.vim
LoadConfig conf/init-plugins.vim
LoadConfig conf/init-style.vim
LoadConfig conf/init-keymaps.vim
LoadConfig conf/init-macros.vim
