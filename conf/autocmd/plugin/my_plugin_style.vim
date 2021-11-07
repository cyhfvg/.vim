"
"
"flazz/vim-colorschemes
"lightline
"
"

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"----------------------------------------------------------------------
  let g:lightline = {
        \    'colorscheme': 'deus',
        \    'active': {
        \      'left': [
        \          ['mode', 'paste'],
        \          ['gitBufStatus', 'filename', 'method'],
        \          ['coc-status']
        \        ],
        \      'right': [
        \          ['filetype', 'fileencoding', 'lineinfo', 'percent'],
        \        ]
        \      },
        \    'component_function': {
        \        'gitBufStatus': 'LightlineBufGitStatus',
        \        'method': 'NearestMethodOrFunction',
        \        'coc-status': 'coc#status',
        \      },
        \    'mode_map': {
        \        'n' : 'N',
        \        'i' : 'I',
        \        'R' : 'R',
        \        'v' : 'V',
        \        'V' : 'VL',
        \        "\<C-v>" : 'VB',
        \        'c' : 'C',
        \        's' : 'S',
        \        'S' : 'SL',
        \        "\<C-s>" : 'SB',
        \        't': 'T',
        \      },
        \    }
"----------------------------------------------------------------------
"当前buf在变更行数信息
function! LightlineBufGitStatus() abort
"  echomsg "LightlineGitBlame"
  let bGitStatus = get(b:, 'coc_git_status', '')
  " return blame
  return winwidth(0) > 120 ? bGitStatus : ''
endfunction

"当前project的分支信息
"fu! LightlineGlobalGitStatus() abort
"  let gGitStatus = get(g:, 'coc_git_status', '')
"  return winwidth(0) > 120 ? gGitStatus : ''
"endfu

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

"----------------------------------------------------------------------
packadd lightline.vim
"----------------------------------------------------------------------
