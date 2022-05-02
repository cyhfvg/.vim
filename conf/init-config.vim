"================================================================================
" init-config.vim
"================================================================================

set langmenu=en_US.UTF-8
language en

" backup
set backup
" backup when save action
set writebackup
" backup directory
let s:backupdir = g:vimfilehome .'/'.'dirs/backupdir'
if !isdirectory(s:backupdir)
  silent! call mkdir(expand(s:backupdir), "p", 0755)
endif
let &backupdir=s:backupdir
set backupext=.bak

" swap
set swapfile
" swap directory
let s:swapdir = g:vimfilehome .'/'.'dirs/swapdir'
if !isdirectory(s:swapdir)
  silent! call mkdir(expand(s:swapdir), "p", 0755)
endif
let &directory=s:swapdir .','.&directory

" undo
if has("persistent_undo")
  let s:undo_path = expand(g:vimfilehome .'/'.'dirs/undodir')
  if !isdirectory(s:undo_path)
    call mkdir(s:undo_path, "p", 0755)
  endif
  let &undodir=s:undo_path
  set undofile
endif

" recovery cursor's position when reopen a file
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" diff what changed without saved
if !exists(":DiffChanged")
  command DiffChanged vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif
