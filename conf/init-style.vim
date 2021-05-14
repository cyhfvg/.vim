"================================================================================
" init-style.vim - 显示样式设置
"================================================================================

"--------------------------------------------------------------------------------
" 显示设置 {{{1
"--------------------------------------------------------------------------------

" 总是显示状态栏
set laststatus=2

" 显示行号
set number

" 显示侧边栏 (显示 mark/gitdiff/诊断信息)
set signcolumn=yes

" 显示标签栏
set showtabline=2

" 显示制表符等非打印字符
set list

" 右下角显示命令
set showcmd

" 设置高亮显示光标行
set cursorline

" 设置高亮显示第 80 列
set colorcolumn=80

" 水平切割窗口时，默认在右边显示新窗口
set splitright

" 设置 gvim 不显示标题栏、工具栏
set guioptions-=m
set guioptions-=T

" 设置打开vim时显示更少的提示
set shortmess=atI

" 1}}}

"--------------------------------------------------------------------------------
" 颜色主题: 色彩文件位于 colors 目录中 {{{1
"--------------------------------------------------------------------------------

" 允许 256 色
set t_Co=256

" 设置主题
color solarized8_light_high

" 1}}}

"----------------------------------------------------------------------
" 状态栏设置 {{{1
"----------------------------------------------------------------------
set statusline=                                 " 清空状态栏
set statusline+=\ %F                            " 文件名
set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
set statusline+=%=                              " 向右对齐
set statusline+=\ %y                            " 文件类型

" 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)

" 1}}}

"----------------------------------------------------------------------
" 更改样式 {{{1
"----------------------------------------------------------------------

" 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" 只显示红色或者蓝色下划线或者波浪线
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal
if has('gui_running')
  hi! SpellBad gui=undercurl guisp=red
  hi! SpellCap gui=undercurl guisp=blue
  hi! SpellRare gui=undercurl guisp=magenta
  hi! SpellRare gui=undercurl guisp=cyan
else
  hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
  hi! SpellCap term=underline cterm=underline
  hi! SpellRare term=underline cterm=underline
  hi! SpellLocal term=underline cterm=underline
endif

" 去掉 sign column 的白色背景
hi! SignColumn guibg=NONE ctermbg=NONE

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
  \ gui=NONE guifg=DarkGrey guibg=NONE

" 修正补全目录的色彩：默认太难看
hi! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
hi! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray
" 1}}}

"----------------------------------------------------------------------
" 终端设置，隐藏行号和侧边栏 {{{1
"----------------------------------------------------------------------
if has('terminal') && exists(':terminal') == 2
  if exists('##TerminalOpen')
    augroup VimUnixTerminalGroup
      au!
      au TerminalOpen * setlocal nonumber signcolumn=no
    augroup END
  endif
endif

" 1}}}

"----------------------------------------------------------------------
" quickfix 设置，隐藏行号 {{{1
"----------------------------------------------------------------------
augroup VimInitStyle
  au!
  au FileType qf setlocal nonumber
augroup END

" 1}}}

"----------------------------------------------------------------------
" 标签栏文字风格 {{{1
" 默认为零，GUI 模式下空间大，按风格 3显示
" 0: filename.txt
" 2: 1 - filename.txt
" 3: [1] filename.txt
"----------------------------------------------------------------------
if has('gui_running')
  let g:config_vim_tab_style = 3
endif

" 1}}}

"----------------------------------------------------------------------
" 终端下的 tabline {{{1
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

" 1}}}

"----------------------------------------------------------------------
" 需要显示到标签上的文件名 {{{1
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

" 1}}}

"----------------------------------------------------------------------
" 标签栏文字，使用 [1] filename 的模式 {{{1
"----------------------------------------------------------------------
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

" 1}}}

"----------------------------------------------------------------------
" GUI 下的标签文字，使用 [1] filename 的模式 {{{1
"----------------------------------------------------------------------
function! Vim_NeatGuiTabLabel()
  let l:num = v:lnum
  let l:buflist = tabpagebuflist(l:num)
  let l:winnr = tabpagewinnr(l:num)
  let l:bufnr = l:buflist[l:winnr - 1]
  let l:fname = Vim_NeatBuffer(l:bufnr, 0)
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

" 1}}}

"----------------------------------------------------------------------
" 设置 GUI 标签的 tips: 显示当前标签有哪些窗口 {{{1
"----------------------------------------------------------------------
function! Vim_NeatGuiTabTip()
  let tip = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  for bufnr in bufnrlist
    " separate buffer entries
    if tip != ''
      let tip .= " \n"
    endif
    " Add name of buffer
    let name = Vim_NeatBuffer(bufnr, 1)
    let tip .= name
    " add modified/modifiable flags
    if getbufvar(bufnr, "&modified")
      let tip .= ' [+]'
    endif
    if getbufvar(bufnr, "&modifiable")==0
      let tip .= ' [-]'
    endif
  endfor
  return tip
endfunc

" 1}}}

"----------------------------------------------------------------------
" 标签栏最终设置 {{{1
"----------------------------------------------------------------------
set tabline=%!Vim_NeatTabLine()
set guitablabel=%{Vim_NeatGuiTabLabel()}
set guitabtooltip=%{Vim_NeatGuiTabTip()}

" 1}}}

"----------------------------------------------------------------------
" 字体 font {{{1
"----------------------------------------------------------------------

" 设置字体为 Fira Code
set guifont=Fira_Code:h16
" 修正Fira Code 在gvim下不生效 https://github.com/tonsky/FiraCode/issues/462
set renderoptions=type:directx

" 1}}}
