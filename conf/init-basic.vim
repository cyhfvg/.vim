"================================================================================
"
" init-basic.vim - 基础配置 兼容 vim tiny 模式 的配置项
"
" 最基础的配置项 不含个人喜好的配置项
"
"================================================================================

"================================================================================
" 基础配置项 {{{1
"================================================================================

" 禁用 vi 兼容模式
set nocompatible

" 设置 Backspace 键的行为 <== 插入后不可删除前面的字符
set backspace=eol,start,indent

" 自动缩进
set autoindent

" Windows 禁用 ALT 操作菜单 
" 使得可以自定义 ALT 的快捷键而不会与 Windows快捷键冲突
set winaltkeys=no

" 关闭自动换行
"set nowrap

" 打开功能键超时检测 终端下功能键为一串 Esc 开头的字符串
set ttimeout

" 功能键超时检测50毫秒
set ttimeoutlen=50

" 显示光标位置
set ruler

" 关闭发生错误时的铃声
set belloff=all

" 1}}}

"----------------------------------------------------------------------
" 设置 <leader> 为 <space>键 {{{1
"----------------------------------------------------------------------
let mapleader="\<Space>"
" 1}}}

"================================================================================
" 搜索配置项
"================================================================================

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断
" 默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时预览第一个匹配项
set incsearch


"================================================================================
" 编码配置项
"================================================================================

if has('multi_byte')
  " 内部工作编码
  set encoding=utf-8
  
  " 文件默认编码
  set fileencoding=utf-8

  " 打开文件时自动尝试下面顺序的编码
  set fileencodings=utf-8,gbk,ucs-bom,gb18030,big5,euc-jp,latin1
endif

"================================================================================
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"================================================================================

if has('autocmd')
  filetype plugin indent on
endif


"================================================================================
" 语法高亮设置
"================================================================================

if has('syntax')
  syntax enable
  syntax on
endif

"================================================================================
" 其他设置
"================================================================================

" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=2

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 延迟绘制 ==> 提升性能
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
set ffs=unix,dos,mac

"================================================================================
" 设置代码折叠
"================================================================================

if has('folding')

  " 允许代码折叠
  set foldenable

  " 代码折叠默认使用缩进
  set fdm=indent

  " 默认打开所有缩进
  set foldlevel=99

endif

"================================================================================
" 文件搜索和补全时忽略下面扩展名
"================================================================================

set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
