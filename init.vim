" ==============================================================================
"
" init.vim - initialize config
"
" ==============================================================================

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

" 取得当前目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadConfig exec 'source '.s:home .'/'.'<args>'

" 将目录加入 runtimepath
exec 'set runtimepath+=' .s:home

" 确保 ~/.vim 目录加入 runtimepath
set runtimepath+=~/.vim

" ==============================================================================
"
" 划分 Config 模块 {{{1
"
" ==============================================================================

"* 加载基础配置
LoadConfig init/init-basic.vim

" 加载扩展配置
LoadConfig init/init-config.vim

" 设置 tabsize
LoadConfig init/init-tabsize.vim

"* 插件加载
LoadConfig init/init-plugins.vim

" 界面样式
 LoadConfig init/init-style.vim

"* 自定义按键
LoadConfig init/init-keymaps.vim

" 宏定义
LoadConfig init/init-macros.vim

" 1}}}
