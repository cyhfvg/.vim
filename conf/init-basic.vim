"================================================================================
"
" init-basic.vim
"
"================================================================================

" <leader>
let mapleader="\<Space>"

set nocompatible

set backspace=eol,start,indent

set autoindent

" disable alt keys in windows
set winaltkeys=no

" 打开功能键超时检测 终端下功能键为一串 Esc 开头的字符串
set ttimeout

" 功能键超时检测50毫秒
set ttimeoutlen=50

" highlight cursor line
set ruler

set belloff=all

" search
set ignorecase
set smartcase
set hlsearch
" preview first match
set incsearch

" encoding
if has('multi_byte')
  set encoding=utf-8
  set fileencoding=utf-8
  set fileencodings=utf-8,gbk,ucs-bom,gb18030,big5,euc-jp,latin1
endif

" autoIndent by filetype
if has('autocmd')
  filetype plugin indent on
endif

" syntax
if has('syntax')
  syntax enable
  syntax on
endif

" show matched quotes
set showmatch
set matchtime=2

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 延迟绘制
set lazyredraw

" 错误格式
set errorformat+=[%f:%1]\ ->\ %m,[%f:%1]:%m

" 设置分隔符可视
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

" 设置 tags: 当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" 如遇 Unicode 值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set fileformats=unix,dos,mac

" fold
if has('folding')
  set foldenable
  set foldmethod=indent
  set foldlevel=99
endif
