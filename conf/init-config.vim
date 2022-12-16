vim9script
#================================================================================
# init-config.vim
#================================================================================

$LANG = "en"
set langmenu=en_US.UTF-8

# {{{1
# `F` key timeout check
if $TMUX != ''
  set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
  set ttimeoutlen=80
endif

# ALT in terminal
# require to set : ttimeout & ttimeoutlen
if has('nvim') == 0 && has('gui_running') == 0
  def Metacode(key: string)
    exec "set <M-" .. key .. ">=\e" .. key
  enddef

  for i in range(10)
    Metacode(nr2char(char2nr('0') + i))
  endfor
  for i in range(26)
    Metacode(nr2char(char2nr('a') + i))
    Metacode(nr2char(char2nr('A') + i))
  endfor
  for c in [',', '.', '/', ';', '{', '}']
    Metacode(c)
  endfor
  for c in ['?', ':', '-', '_', '+', '=', "'"]
    Metacode(c)
  endfor
endif

# `F` key remap
def Key_escape(name: string, code: string)
  if has('nvim') == 0 && has('gui_running') == 0
    exec "set " .. name .. "=\e" .. code
  endif
enddef

# fix `F` key code
Key_escape('<F1>', 'OP')
Key_escape('<F2>', 'OQ')
Key_escape('<F3>', 'OR')
Key_escape('<F4>', 'OS')
Key_escape('<S-F1>', '[1;2P')
Key_escape('<S-F2>', '[1;2Q')
Key_escape('<S-F3>', '[1;2R')
Key_escape('<S-F4>', '[1;2S')
Key_escape('<S-F5>', '[15;2~')
Key_escape('<S-F6>', '[17;2~')
Key_escape('<S-F7>', '[18;2~')
Key_escape('<S-F8>', '[19;2~')
Key_escape('<S-F9>', '[20;2~')
Key_escape('<S-F10>', '[21;2~')
Key_escape('<S-F11>', '[23;2~')
Key_escape('<S-F12>', '[24;2~')

# fix background colorscheme error in $TMUX
if &term =~ '256color' && $TMUX != ''
  set t_ut=
endif
# }}}

# backup
set backup
# backup when save action
set writebackup
# backup directory
var backupdir = g:vimfilehome .. '/' .. 'dirs/backupdir'
if !isdirectory(backupdir)
  silent! call mkdir(expand(backupdir), "p", 0755)
endif
&backupdir = backupdir
set backupext=.bak

# swap
set swapfile
# swap directory
var swapdir = g:vimfilehome .. '/' .. 'dirs/swapdir'
if !isdirectory(swapdir)
  silent! call mkdir(expand(swapdir), "p", 0755)
endif
&directory = swapdir .. ',' .. &directory

# undo
if has("persistent_undo")
  var undo_path = expand(g:vimfilehome .. '/' .. 'dirs/undodir')
  if !isdirectory(undo_path)
    call mkdir(undo_path, "p", 0755)
  endif
  &undodir = undo_path
  set undofile
endif

## recovery cursor's position when reopen a file
autocmd BufReadPost * {
  if line("'\"") > 1 && line("'\"") <= line("$")
    :exec "normal! g`\""
  endif
  }


# diff what changed without saved
if !exists(":DiffChanged")
  command DiffChanged vert new | set bt=nofile
      | r ++edit `=getreg('#')` | :0d _
      | diffthis | wincmd p | diffthis
endif
