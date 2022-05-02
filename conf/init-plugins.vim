"==============================================================================
" init-plugins.vim
"==============================================================================
"
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
  let g:plugin_group += ['writer']
endif

"==============================================================================
if index(g:plugin_group, 'fuzzy') >= 0

  if executable('fzf')
    LoadConfig conf/autocmd/plugin/my_plugin_fuzzy.vim
  endif

  augroup my_plugin_ack
    autocmd!
    autocmd CmdUndefined Ack*,LAck* LoadConfig conf/autocmd/plugin/my_plugin_ack.vim
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

  " add dictionary for complete
  set complete+=k

endif
"==============================================================================
if index(g:plugin_group, 'enhance') >= 0

  augroup my_plugin_enhance
    autocmd!
    autocmd CmdUndefined Tab* packadd tabular
    autocmd CmdUndefined Subvert packadd vim-abolish
    " ys<operator><desired>    ==> add surround
    " cs<existing><desired>    ==> change surround, <existing> to <desired>
    " ds<existing>             ==> delete surround, <existing>
    " S<desired>               ==> visual mode: surround selected content
    autocmd VimEnter * packadd vim-surround
    " enhanced %
    autocmd VimEnter * packadd vim-matchup
    autocmd VimEnter * LoadConfig conf/autocmd/plugin/my_plugin_diff.vim
    autocmd VimEnter * packadd vim-commentary
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
if index(g:plugin_group, 'writer') >= 0

  augroup my_plugin_pencil
    autocmd!
    autocmd FileType markdown,text packadd vim-pencil
                            \ | call pencil#init({'wrap': 'hard', 'textwidth': 120, 'autoformat': 0})
                            \ | setl spell spelllang=en_us,cjk foldlevel=4 noruler nonumber norelativenumber
                            \ | setl foldopen+=search
  augroup End

endif
"==============================================================================
