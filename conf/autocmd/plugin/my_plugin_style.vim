if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

  let g:lightline = {
        \    'colorscheme': 'one',
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

" git repository: buffer's changed line numbers
function! LightlineBufGitStatus() abort
  let bGitStatus = get(b:, 'coc_git_status', '')
  return winwidth(0) > 120 ? bGitStatus : ''
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

packadd lightline.vim
