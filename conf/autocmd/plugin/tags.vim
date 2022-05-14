if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" set tags files' name
let g:gutentags_ctags_tagfile = '.tags'

" set tags directory
let s:tag_path = expand(g:vimfilehome .'/'.'dirs/tagdir')
if !isdirectory(s:tag_path)
  call mkdir(s:tag_path, "p", 0755)
endif
let g:gutentags_cache_dir = expand(s:tag_path)

let g:gutentags_modules = []
" catgs
let g:gutentags_modules += ['ctags']
" gtags
if executable('gtags') && executable('gtags-cscope')
  let g:gutentags_modules += ['gtags_cscope']
endif

" ctags parameters
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" disable gutentags autolink gtags database
let g:gutentags_auto_add_gtags_cscope = 0

packadd vim-gutentags
packadd vista.vim
"-------------------------------------------------------------------------------
