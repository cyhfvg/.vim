"
"
"kana/vim-textobj-user
"kana/vim-textobj-indent
"kana/vim-textobj-syntax
"sgur/vim-textobj-parameter
"jceb/vim-textobj-uri
"
"

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"----------------------------------------------------------------------
"----------------------------------------------------------------------
" 基础插件：提供让用户方便的自定义文本对象的接口
packadd vim-textobj-user
" indent 文本对象：ii / ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
packadd vim-textobj-indent
" 语法文本对象：iy / ay 基于语法的文本对象
packadd vim-textobj-syntax
" 参数文本对象：i, / a, 包括参数或者列表元素
packadd vim-textobj-parameter
" 提供 uri/url 的文本对象，iu / au 表示
packadd vim-textobj-uri

" 提供 环绕模式操作 {{{1
" Add 环绕: sa  例 saiw(
" Delete 环绕: sd 例 sd"
" Replace 环绕: sr 例 sr"'
" 支持visual模式: line Visual 例 Vsa(
packadd vim-sandwich
" 由于 vim-sandwich 依赖快捷键前缀 s, 取消当前 s 键配置
nmap s <Nop>
xmap s <Nop>

" 提供 增强的 % 
packadd vim-matchup
"}}}
"----------------------------------------------------------------------
