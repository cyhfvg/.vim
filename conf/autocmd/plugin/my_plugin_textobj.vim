" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"----------------------------------------------------------------------
" 基础插件：提供让用户方便的自定义文本对象的接口
packadd vim-textobj-user

" indent 文本对象：ii / ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
packadd vim-textobj-indent
" 参数文本对象：i, / a, 包括参数或者列表元素
packadd vim-textobj-parameter

" 提供 环绕模式操作 {{{1
" ys<operator><desired>    ==> add surround
" cs<existing><desired>    ==> change surround, <existing> to <desired>
" ds<existing>             ==> delete surround, <existing>
" S<desired>               ==> visual mode: surround selected content
packadd vim-surround

" 提供 增强的 %
packadd vim-matchup
"}}}
"----------------------------------------------------------------------
