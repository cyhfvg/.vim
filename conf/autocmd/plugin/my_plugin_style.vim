if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

let g:lightline = {}
let g:lightline.colorscheme = 'one'
let g:lightline.active = {'left':[], 'right':[]}
let g:lightline.active.left = [
      \          ['mode', 'paste'],
      \          ['gitBufStatus', 'filename', 'method'],
      \          ['coc-status']
      \        ]
let g:lightline.active.right = [
      \          ['filetype', 'fileencoding', 'lineinfo', 'percent'],
      \        ]
let g:lightline.component_function = {
      \        'gitBufStatus': 'LightlineBufGitStatus',
      \        'method': 'NearestMethodOrFunction',
      \        'coc-status': 'coc#status',
      \      }
let g:lightline.mode_map = {
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
      \      }

" git repository: buffer's changed line numbers
function! LightlineBufGitStatus() abort
  let bGitStatus = get(b:, 'coc_git_status', '')
  return winwidth(0) > 120 ? bGitStatus : ''
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

packadd lightline.vim

" reload lightline config
call lightline#init()
call lightline#colorscheme()
call lightline#update()
