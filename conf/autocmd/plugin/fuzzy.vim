if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

packadd fzf
packadd fzf.vim

let g:fzf_preview_window = ['up:50%', 'ctrl-/']

noremap <c-p> :Files<cr>
noremap <m-p> :Buffers<cr>
noremap <m-m> :Marks<cr>