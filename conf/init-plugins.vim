"==============================================================================
" init-plugins.vim - 插件
"==============================================================================
"
"

" plugin group 分组
if !exists('g:plugin_group')
  let g:plugin_group = []
  let g:plugin_group += ['complete']
  let g:plugin_group += ['debug']
  let g:plugin_group += ['enhance']
  let g:plugin_group += ['filemanager']
  let g:plugin_group += ['filetype']
  let g:plugin_group += ['fuzzy']
  let g:plugin_group += ['git']
  let g:plugin_group += ['lib']
  let g:plugin_group += ['markdown']
  let g:plugin_group += ['marks']
  let g:plugin_group += ['style']
  let g:plugin_group += ['tags']
  let g:plugin_group += ['textobj']
endif

"==============================================================================
if index(g:plugin_group, 'fuzzy') >= 0

  if executable('fzf')
    LoadConfig conf/autocmd/plugin/my_plugin_fuzzy.vim
  endif

  augroup my_plugin_ack
    autocmd!
    autocmd CmdUndefined Ack LoadConfig conf/autocmd/plugin/my_plugin_ack.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'filemanager') >= 0

  augroup my_plugin_filemanager
    autocmd!
    autocmd CmdUndefined NERDTree* LoadConfig conf/autocmd/plugin/my_plugin_filemanager.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'complete') >= 0

  augroup my_plugin_complete
    autocmd!
    autocmd InsertEnter * LoadConfig conf/autocmd/plugin/my_plugin_complete.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'enhance') >= 0

  augroup my_plugin_enhance
    autocmd!
    autocmd CmdUndefined Tab* packadd tabular
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/my_plugin_diff.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'lib') >= 0

  augroup my_plugin_lib
    autocmd!
    autocmd FuncUndefined xolox#* LoadConfig conf/autocmd/plugin/my_plugin_lib.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'filetype') >= 0

  augroup my_plugin_filetype
    autocmd!
    autocmd FileType csv packadd vim-polyglot
    autocmd FileType java packadd vim-polyglot
    autocmd FileType javascript packadd vim-polyglot
    autocmd FileType markdown packadd vim-polyglot
    autocmd FileType python packadd vim-polyglot
    autocmd FileType shell packadd vim-polyglot
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'git') >= 0
      \&& executable('git')

  augroup my_plugin_git
    autocmd!
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/my_plugin_git.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'markdown') >= 0

  augroup my_plugin_markdown
    autocmd!
    autocmd FileType markdown LoadConfig conf/autocmd/plugin/my_plugin_markdown.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'marks') >= 0

  augroup my_plugin_marks
    autocmd!
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/my_plugin_marks.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'style') >= 0

  LoadConfig conf/autocmd/plugin/my_plugin_style.vim

endif
"==============================================================================
if index(g:plugin_group, 'tags') >= 0
      \ && executable('ctags')

  augroup my_plugin_tags
    autocmd!
    autocmd CmdUndefined Vista* LoadConfig conf/autocmd/plugin/my_plugin_tags.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'textobj') >= 0

  augroup my_plugin_textobj
    autocmd!
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/my_plugin_textobj.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'debug') >= 0

  augroup my_plugin_debug
    autocmd!
    autocmd FileType python LoadConfig conf/autocmd/plugin/my_plugin_debug.vim
  augroup End

endif
"==============================================================================
