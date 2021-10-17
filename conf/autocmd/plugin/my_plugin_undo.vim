"
"
"mbbill/undotree
"
"

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
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
"-------------------------------------------------------------------------------
packadd undotree
"-------------------------------------------------------------------------------
