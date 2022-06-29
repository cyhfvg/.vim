if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

" Fzf prefix
let g:fzf_command_prefix = 'Fzf'

let $FZF_DEFAULT_OPTS = '--layout=reverse'

let g:fzf_preview_window = ['right:60%', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" BLines    fuzzy lines in cur buffer
" Lines    fuzzy lines in all buffer
" Rg       fuzzy strings in all files in cur dirs
" History  fuzzy edit history files
" History:    fuzzy history commands

" return tracked files when a git repo
function! FzfOmniFiles()
  let is_git = system('git rev-parse --git-dir')
  if v:shell_error
    :FzfFiles
  else
    :FzfGFiles --exclude-standard
  endif
endfunction

noremap <silent> <c-p> :call FzfOmniFiles()<cr>
noremap <m-p> :FzfBuffers<cr>
noremap <m-m> :FzfMarks<cr>

"==========
packadd fzf
packadd fzf.vim
