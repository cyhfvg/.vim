if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

packadd fzf
packadd fzf.vim

let $FZF_DEFAULT_OPTS = '--layout=reverse'
let g:fzf_preview_window = ['up:50%', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" BLines    fuzzy lines in cur buffer
" Lines    fuzzy lines in all buffer
" Rg       fuzzy strings in all files in cur dirs
" History  fuzzy edit history files
" History:    fuzzy history commands

noremap <c-p> :Files<cr>
noremap <m-p> :Buffers<cr>
noremap <m-m> :Marks<cr>
