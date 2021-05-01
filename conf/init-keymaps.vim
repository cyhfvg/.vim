"================================================================================
" init-keymaps.vim - 快捷键设置
"================================================================================


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标 {{{1
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
" 1}}}

"----------------------------------------------------------------------
" 命令模式的快速移动 {{{1
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>

" 1}}}

"----------------------------------------------------------------------
" <leader>+数字键 切换tab {{{1
"----------------------------------------------------------------------
noremap <silent><leader>1 1gt<cr>
noremap <silent><leader>2 2gt<cr>
noremap <silent><leader>3 3gt<cr>
noremap <silent><leader>4 4gt<cr>
noremap <silent><leader>5 5gt<cr>
noremap <silent><leader>6 6gt<cr>
noremap <silent><leader>7 7gt<cr>
noremap <silent><leader>8 8gt<cr>
noremap <silent><leader>9 9gt<cr>
noremap <silent><leader>0 10gt<cr>

" 1}}}

"----------------------------------------------------------------------
" ALT+N 切换 tab {{{1
"----------------------------------------------------------------------
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>

" 1}}}

"----------------------------------------------------------------------
" 缓存：插件 unimpaired 中定义了 [b, ]b 来切换缓存 {{{1
"----------------------------------------------------------------------
noremap <silent> <leader>bn :bn<cr>
noremap <silent> <leader>bp :bp<cr>

" 1}}}


"----------------------------------------------------------------------
" TAB {{{1
" 创建，关闭，上一个，下一个，左移，右移
" 其实还可以用原生的 CTRL+PageUp, CTRL+PageDown 来切换标签
"----------------------------------------------------------------------

noremap <silent> <leader>tc :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>
noremap <silent> <leader>to :tabonly<cr>

" 左移 tab
function! Tab_MoveLeft()
  let l:tabnr = tabpagenr() - 2
  if l:tabnr >= 0
    exec 'tabmove '.l:tabnr
  endif
endfunc

" 右移 tab
function! Tab_MoveRight()
  let l:tabnr = tabpagenr() + 1
  if l:tabnr <= tabpagenr('$')
    exec 'tabmove '.l:tabnr
  endif
endfunc

noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
noremap <silent><leader>tr :call Tab_MoveRight()<cr>
noremap <silent><m-left> :call Tab_MoveLeft()<cr>
noremap <silent><m-right> :call Tab_MoveRight()<cr>

" 1}}}

"----------------------------------------------------------------------
" ALT 键移动增强 {{{1
"----------------------------------------------------------------------

" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转） 
noremap <m-j> gj
noremap <m-k> gk
inoremap <m-j> <c-\><c-o>gj
inoremap <m-k> <c-\><c-o>gk

" 1}}}

"----------------------------------------------------------------------
" 窗口切换：ALT+SHIFT+hjkl {{{1
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------
noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc><c-w>h
inoremap <m-L> <esc><c-w>l
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
  " vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
  " 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
  " 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
  set termwinkey=<c-_>
  tnoremap <m-H> <c-_>h
  tnoremap <m-L> <c-_>l
  tnoremap <m-J> <c-_>j
  tnoremap <m-K> <c-_>k
  tnoremap <m-q> <c-\><c-n>
elseif has('nvim')
  " neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
  tnoremap <m-H> <c-\><c-n><c-w>h
  tnoremap <m-L> <c-\><c-n><c-w>l
  tnoremap <m-J> <c-\><c-n><c-w>j
  tnoremap <m-K> <c-\><c-n><c-w>k
  tnoremap <m-q> <c-\><c-n>
endif

" 1}}}

"----------------------------------------------------------------------
" F5 运行当前文件 {{{1
" 根据文件类型判断方法，并且输出到 quickfix 窗口
"----------------------------------------------------------------------
function! ExecuteFile()
  let cmd = ''
  if index(['c', 'cpp', 'rs', 'go'], &ft) >= 0
    " native 语言，把当前文件名去掉扩展名后作为可执行运行
    " 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
    " 加双引号是为了避免路径中包含空格
    let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
  elseif &ft == 'python'
    let $PYTHONUNBUFFERED=1 " 关闭 python 缓存，实时看到输出
    let cmd = 'python "$(VIM_FILEPATH)"'
  elseif &ft == 'javascript'
    let cmd = 'node "$(VIM_FILEPATH)"'
  elseif &ft == 'perl'
    let cmd = 'perl "$(VIM_FILEPATH)"'
  elseif &ft == 'ruby'
    let cmd = 'ruby "$(VIM_FILEPATH)"'
  elseif &ft == 'php'
    let cmd = 'php "$(VIM_FILEPATH)"'
  elseif &ft == 'lua'
    let cmd = 'lua "$(VIM_FILEPATH)"'
  elseif &ft == 'zsh'
    let cmd = 'zsh "$(VIM_FILEPATH)"'
  elseif &ft == 'ps1'
    let cmd = 'powershell -file "$(VIM_FILEPATH)"'
  elseif &ft == 'vbs'
    let cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
  elseif &ft == 'sh'
    let cmd = 'bash "$(VIM_FILEPATH)"'
  else
    return
  endif
  " Windows 下打开新的窗口 (-mode=4) 运行程序，其他系统在 quickfix 运行
  " -raw: 输出内容直接显示到 quickfix window 不匹配 errorformat
  " -save=2: 保存所有改动过的文件
  " -cwd=$(VIM_FILEDIR): 运行初始化目录为文件所在目录
  if has('win32') || has('win64')
    exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=4 '. cmd
  else
    exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=0 '. cmd
  endif
endfunc

" 1}}}


"----------------------------------------------------------------------
" F2 在项目目录下 Grep 光标下单词 {{{1
" 默认 C/C++/Py/Js ，扩展名自己扩充
" 支持 rg/grep/findstr ，其他类型可以自己扩充
" 不是在当前目录 grep，而是会去到当前文件所属的项目目录 project root
" 下面进行 grep，这样能方便的对相关项目进行搜索
"----------------------------------------------------------------------
if executable('rg')
  noremap <silent><F2> :AsyncRun! -cwd=<root> rg -n --no-heading 
        \ --color never -g *.h -g *.c* -g *.py -g *.js -g *.vim 
        \ <C-R><C-W> "<root>" <cr>
elseif has('win32') || has('win64')
  noremap <silent><F2> :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>" 
        \ "\%CD\%\*.h" "\%CD\%\*.c*" "\%CD\%\*.py" "\%CD\%\*.js"
        \ "\%CD\%\*.vim"
        \ <cr>
else
  noremap <silent><F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W> 
        \ --include='*.h' --include='*.c*' --include='*.py' 
        \ --include='*.js' --include='*.vim'
        \ '<root>' <cr>
endif
" 1}}}
