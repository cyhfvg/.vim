"==============================================================================
" init-plugins.vim - 插件
"==============================================================================
"
"

" plugin group 分组
if !exists('g:plugin_group')
  let g:plugin_group = []
  let g:plugin_group += ['basic']
  let g:plugin_group += ['complete']
  let g:plugin_group += ['debug']
  let g:plugin_group += ['diff']
  let g:plugin_group += ['enhanced']
  let g:plugin_group += ['filemanager']
  let g:plugin_group += ['filetype']
  let g:plugin_group += ['format']
  let g:plugin_group += ['fuzzy']
  let g:plugin_group += ['git']
  let g:plugin_group += ['lib']
  let g:plugin_group += ['markdown']
  let g:plugin_group += ['marks']
  let g:plugin_group += ['style']
  let g:plugin_group += ['tags']
  let g:plugin_group += ['textobj']
  let g:plugin_group += ['undo']
endif
"==============================================================================
if index(g:plugin_group, 'fuzzy') >= 0
  augroup my_plugin_fuzzy
    autocmd!
    autocmd CmdUndefined CtrlP* LoadConfig conf/autocmd/plugin/my_plugin_fuzzy.vim
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
if index(g:plugin_group, 'undo') >= 0

  LoadConfig conf/autocmd/plugin/my_plugin_undo.vim

endif
"==============================================================================
if index(g:plugin_group, 'basic') >= 0

  LoadConfig conf/autocmd/plugin/my_plugin_basic.vim

endif
"==============================================================================
if index(g:plugin_group, 'complete') >= 0

  augroup my_plugin_complete
    autocmd!
    autocmd InsertEnter * LoadConfig conf/autocmd/plugin/my_plugin_complete.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'diff') >= 0

  augroup my_plugin_diff
    autocmd!
    "TODO: does vim have DiffEnter event?"
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
if index(g:plugin_group, 'enhanced') >= 0

  augroup my_plugin_enhanced
    autocmd!
    "TODO: i don't know when the plugin works
"    autocmd VimEnter * LoadConfig conf/autocmd/plugin/my_plugin_enhanced.vim
  augroup End


endif
"==============================================================================
if index(g:plugin_group, 'filetype') >= 0

  augroup my_plugin_filetype
    autocmd!
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/my_plugin_filetype.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'format') >= 0

  augroup my_plugin_format
    autocmd!
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/my_plugin_format.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'git') >= 0
      \&& executable('git')

  augroup my_plugin_format
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

  "init before vim open
  LoadConfig conf/autocmd/plugin/my_plugin_style.vim

  augroup my_plugin_indent
    autocmd!
    autocmd FileType python LoadConfig conf/autocmd/plugin/my_plugin_indent.vim
  augroup End

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
