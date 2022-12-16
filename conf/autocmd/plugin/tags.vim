vim9script
if get(s:, 'loaded', v:false)
    finish
else
    var loaded = v:true
endif

g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

# set tags files' name
g:gutentags_ctags_tagfile = '.tags'

# set tags directory
var tag_path = expand(g:vimfilehome .. '/' .. 'dirs/tagdir')
if !isdirectory(tag_path)
  call mkdir(tag_path, "p", 0755)
endif
g:gutentags_cache_dir = expand(tag_path)

g:gutentags_modules = []
# catgs
g:gutentags_modules += ['ctags']
# gtags
if executable('gtags') && executable('gtags-cscope')
    g:gutentags_modules += ['gtags_cscope']
endif

# ctags parameters
g:gutentags_ctags_extra_args = []
g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
g:gutentags_ctags_extra_args += ['--c-kinds=+px']

# disable gutentags autolink gtags database
g:gutentags_auto_add_gtags_cscope = 0

packadd vim-gutentags
packadd vista.vim
#-------------------------------------------------------------------------------
