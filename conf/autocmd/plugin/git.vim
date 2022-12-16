vim9script
if get(s:, 'loaded', v:false)
    finish
else
    var loaded = v:true
endif

packadd vim-fugitive
