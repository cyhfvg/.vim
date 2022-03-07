"================================================================================
" init-style.vim
"================================================================================

" statusline always=2
set laststatus=2
set number
set signcolumn=yes
" tabline always=2
set showtabline=2
" show special chars
set list
set showcmd
set cursorline
set colorcolumn=80
" show new window in right
set splitright

" no title bar
set guioptions-=m
" no tool bar
set guioptions-=T
" no left scrollbar
set guioptions-=l
" no right scrollbar
set guioptions-=r
" no bottom scrollbar
set guioptions-=b
" set shortmessage
set shortmess=atI
set noshowmode

" true color
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if has("termguicolors")
  " true color
  set termguicolors
else
  set t_Co=256
endif

" theme
color one
set background=dark
let g:one_allow_italics = 1
" lightline
LoadConfig conf/autocmd/plugin/my_plugin_style.vim

" terminal window style
if has('terminal') && exists(':terminal') == 2
  if exists('##TerminalOpen')
    augroup VimUnixTerminalGroup
      au!
      au TerminalOpen * setlocal nonumber signcolumn=no
    augroup END
  endif
endif

" quickfix window style
augroup VimInitStyle
  au!
  au FileType qf setlocal nonumber
augroup END

"----------------------------------------------------------------------
" TabLine style
"----------------------------------------------------------------------
function! Vim_NeatTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{Vim_NeatTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif

  return s
endfunc

"----------------------------------------------------------------------
" set filename show into tab
"----------------------------------------------------------------------
function! Vim_NeatBuffer(bufnr, fullname)
  let l:name = bufname(a:bufnr)
  if getbufvar(a:bufnr, '&modifiable')
    if l:name == ''
      return '[No Name]'
    else
      if a:fullname
        return fnamemodify(l:name, ':p')
      else
        let aname = fnamemodify(l:name, ':p')
        let sname = fnamemodify(aname, ':t')
        if sname == ''
          let test = fnamemodify(aname, ':h:t')
          if test != ''
            return '<'. test . '>'
          endif
        endif
        return sname
      endif
    endif
  else
    let l:buftype = getbufvar(a:bufnr, '&buftype')
    if l:buftype == 'quickfix'
      return '[Quickfix]'
    elseif l:name != ''
      if a:fullname
        return '-'.fnamemodify(l:name, ':p')
      else
        return '-'.fnamemodify(l:name, ':t')
      endif
    else
    endif
    return '[No Name]'
  endif
endfunc

"----------------------------------------------------------------------
" get tabline style by n
"----------------------------------------------------------------------
"
" let g:config_vim_tab_style = n
"
" 0: filename.txt
" 2: 1 - filename.txt
" 3: [1] filename.txt
"
function! Vim_NeatTabLabel(n)
  let l:buflist = tabpagebuflist(a:n)
  let l:winnr = tabpagewinnr(a:n)
  let l:bufnr = l:buflist[l:winnr - 1]
  let l:fname = Vim_NeatBuffer(l:bufnr, 0)
  let l:num = a:n
  let style = get(g:, 'config_vim_tab_style', 0)
  if style == 0
    return l:fname
  elseif style == 1
    return "[".l:num."] ".l:fname
  elseif style == 2
    return "".l:num." - ".l:fname
  endif
  if getbufvar(l:bufnr, '&modified')
    return "[".l:num."] ".l:fname." +"
  endif
  return "[".l:num."] ".l:fname
endfunc

set tabline=%!Vim_NeatTabLine()
set guitablabel=%!Vim_NeatTabLine()

" font
set guifont=Fira_Code:h18
