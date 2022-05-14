"================================================================================
" init-config.vim
"================================================================================

set langmenu=en_US.UTF-8

" {{{1
" `F` key timeout check
if $TMUX != ''
  set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
  set ttimeoutlen=80
endif

" ALT in terminal
" require to set : ttimeout & ttimeoutlen
if has('nvim') == 0 && has('gui_running') == 0
  function! s:metacode(key)
    exec "set <M-".a:key.">=\e".a:key
  endfunc
  for i in range(10)
    call s:metacode(nr2char(char2nr('0') + i))
  endfor
  for i in range(26)
    call s:metacode(nr2char(char2nr('a') + i))
    call s:metacode(nr2char(char2nr('A') + i))
  endfor
  for c in [',', '.', '/', ';', '{', '}']
    call s:metacode(c)
  endfor
  for c in ['?', ':', '-', '_', '+', '=', "'"]
    call s:metacode(c)
  endfor
endif

" `F` key remap
function! s:key_escape(name, code)
  if has('nvim') == 0 && has('gui_running') == 0
    exec "set ".a:name."=\e".a:code
  endif
endfunc

" fix `F` key code
call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')

" fix background colorscheme error in $TMUX
if &term =~ '256color' && $TMUX != ''
  set t_ut=
endif
" }}}

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
