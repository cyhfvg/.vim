"
"
"ctrlpvim/ctrlp.vim
"tacahiroy/ctrlp-funky
"
"

" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
" 忽略默认键位
let g:ctrlp_map = ''
" 模糊匹配忽略
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" 项目标志
let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
let g:ctrlp_working_path = 0
"-------------------------------------------------------------------------------
"tacahiroy/ctrlp-funky
" 显示函数列表的扩展插件
" ==================================
packadd ctrlp.vim
packadd ctrlp-funky
"junegunn/fzf {{{2
"快速文件搜索
"packadd fzf
"-------------------------------------------------------------------------------
