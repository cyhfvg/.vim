if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
" Ack [options] {pattern} [{directories}]

if executable('rg')
  " ripgrep

  let g:ackprg = 'rg --vimgrep --smart-case'

elseif executable('ag')
  " silversearcher-ag

  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" alias Ack! : do not autojump first matched
cnoreabbrev Ack Ack!

let g:ackhighlight = 1

let g:ack_use_cword_for_empty_search = 1

"-------------------------------------------------------------------------------
packadd ack.vim
"-------------------------------------------------------------------------------
