"==============================================================================
" init-plugins.vim
"==============================================================================
"

" plugin group
if !exists('g:plugin_group')
  let g:plugin_group = []
  let g:plugin_group += ['complete']
  let g:plugin_group += ['debug']
  let g:plugin_group += ['enhance']
  let g:plugin_group += ['filemanager']
  let g:plugin_group += ['fuzzy']
  let g:plugin_group += ['git']
  let g:plugin_group += ['markdown']
  let g:plugin_group += ['tags']
  let g:plugin_group += ['textobj']
endif

"==============================================================================
if index(g:plugin_group, 'fuzzy') >= 0

  if executable('fzf')
    LoadConfig conf/autocmd/plugin/fuzzy.vim
  endif

  augroup my_plugin_ack
    autocmd!
    autocmd CmdUndefined Ack*,LAck* LoadConfig conf/autocmd/plugin/ack.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'filemanager') >= 0

  augroup my_plugin_filemanager
    autocmd!
    autocmd CmdUndefined NERDTree* LoadConfig conf/autocmd/plugin/filemanager.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'complete') >= 0

  " add dictionary for complete
  set complete+=k

endif
"==============================================================================
if index(g:plugin_group, 'enhance') >= 0

  augroup my_plugin_enhance
    autocmd!
    autocmd VimEnter * packadd vim-abolish
    " ys<operator><desired>    ==> add surround
    " cs<existing><desired>    ==> change surround, <existing> to <desired>
    " ds<existing>             ==> delete surround, <existing>
    " S<desired>               ==> visual mode: surround selected content
    autocmd VimEnter * packadd vim-surround
    " enhanced %
    autocmd VimEnter * packadd vim-matchup
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/diff.vim
    autocmd VimEnter * packadd vim-commentary
    autocmd CmdUndefined Preview* LoadConfig conf/autocmd/plugin/preview.vim
    autocmd CmdUndefined Tab* packadd tabular
    " Asyncrun: quickfix window height: 10
    autocmd CmdUndefined AsyncRun packadd asyncrun.vim \
                                  let g:asyncrun_open = 10

  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'git') >= 0
      \&& executable('git')

  augroup my_plugin_git
    autocmd!
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/git.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'markdown') >= 0

  augroup my_plugin_markdown
    autocmd!
    autocmd FileType markdown LoadConfig conf/autocmd/plugin/markdown.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'tags') >= 0
      \ && executable('ctags')

  augroup my_plugin_tags
    autocmd!
    autocmd CmdUndefined Vista* LoadConfig conf/autocmd/plugin/tags.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'textobj') >= 0

  augroup my_plugin_textobj
    autocmd!
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/textobj.vim
  augroup End

endif
"==============================================================================
if index(g:plugin_group, 'debug') >= 0

  augroup my_plugin_debug
    autocmd!
    autocmd FileType python LoadConfig conf/autocmd/plugin/debug.vim
  augroup End

endif
"==============================================================================
