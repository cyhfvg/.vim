"================================================================================
" init-plugins.vim - 插件
"================================================================================

"plugin enable/disable {{{1
" packadd
packadd vim-easymotion
packadd tabular
packadd vim-diff-enhanced
packadd vim-misc
packadd vim-signature
packadd vim-signify
packadd vim-fugitive
packadd vim-dict
packadd vim-textobj-user
packadd vim-textobj-indent
packadd vim-textobj-syntax
packadd vim-textobj-parameter
packadd vim-textobj-uri
packadd vim-polyglot
packadd vim-airline
packadd vim-airline-themes
packadd nerdtree
packadd vim-nerdtree-syntax-highlight
packadd echodoc.vim
packadd vim-colorschemes
packadd ctrlp.vim
packadd ctrlp-funky
packadd undotree
packadd coc.nvim
"packadd fzf
packadd indentLine
" 1}}}

"easymotion/vim-easymotion {{{2
" 全文快速移动，<leader><leader>f{char} 即可触发
map <Leader><Leader> <Plug>(easymotion-prefix)
" 2}}}

"godlygeek/tabular {{{2
"对齐插件，:'<,'>Tabularize /{pattern}
" 2}}}

"chrisbra/vim-diff-enhanced {{{2
" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif
" git 仓库使用 histogram 算法进行 diff
let g:signify_vcs_cmds = {
    \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
    \}
" 2}}}

"xolox/vim-misc {{{2
" 支持库，给其他插件用的函数库
" 2}}}

"kshenoy/vim-signature {{{2
" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
" 2}}}

"mhinz/vim-signify {{{2
" 用于在侧边符号栏显示 git/svn 的 diff
" signify 调优
let g:signify_vcs_list = ['git', 'svn']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change
" 2}}}

"tpope/vim-fugitive {{{2
" Git 支持
" 2}}}

"asins/vim-dict {{{2
" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
" 2}}}

"文本对象textobj {{{2
"kana/vim-textobj-user
" 基础插件：提供让用户方便的自定义文本对象的接口

"kana/vim-textobj-indent
" indent 文本对象：ii / ai 表示当前缩进，vii 选中当缩进，cii 改写缩进

"kana/vim-textobj-syntax
" 语法文本对象：iy / ay 基于语法的文本对象

"sgur/vim-textobj-parameter
" 参数文本对象：i, / a, 包括参数或者列表元素

"jceb/vim-textobj-uri
" 提供 uri/url 的文本对象，iu / au 表示
" 2}}}

"sheerun/vim-polyglot {{{2
" 支持各种语法高亮
" 2}}}

"airline {{{2
"vim-airline/vim-airline
"vim-airline/vim-airline-themes
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 0
let g:airline_exclude_preview = 1
let g:airline_section_b = '%n'
let g:airline_theme='solarized'
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#vimagit#enabled = 0
" 2}}}

" NERDTree {{{2
"scrooloose/nerdtree
"tiagofumo/vim-nerdtree-syntax-highlight
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 0
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <leader>nf :NERDTreeFind<cr>
" 2}}}

"Shougo/echodoc.vim {{{2
" echodoc：在底部显示函数参数
set noshowmode
let g:echodoc#enable_at_startup = 1
" 2}}}

"flazz/vim-colorschemes {{{2
" 一次性安装一大堆 colorscheme
" 2}}}

"ctrlpvim/ctrlp.vim tacahiroy/ctrlp-funky{{{2
" 使用 CtrlP 代替
"tacahiroy/ctrlp-funky
" 显示函数列表的扩展插件
" ==================================
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

" CTRL+p 打开文件模糊匹配
noremap <c-p> :CtrlP<cr>

" CTRL+n 打开最近访问过的文件的匹配
"    noremap <c-n> :CtrlPMRUFiles<cr>

" ALT+p 显示当前文件的函数列表
noremap <m-p> :CtrlPFunky<cr>

" ALT+n 匹配 buffer
noremap <m-n> :CtrlPBuffer<cr>

" 2}}}

"mbbill/undotree {{{2
"undotree
" set hotkey => \u
nnoremap <silent> <leader>u :UndotreeToggle<cr>
" persistent_undo
if has("persistent_undo")
  let target_path = expand(g:vimfilehome .'/'.'dirs/undodir')
  " create the directory and any parent directories
  " if the location does not exist.
  if !isdirectory(target_path)
    call mkdir(target_path, "p", 0755)
  endif
  let &undodir=target_path
  set undofile
endif
" 2}}}

"neoclide/coc.nvim {{{2
" coc

" 设置提示延迟时间为300ms, 默认为4000ms = 4s
set updatetime=300

" 自动完成提示框中不跳过信息
set shortmess+=c

" 一段时间(updatetime)内光标不移动，高亮光标下的变量及其引用
"autocmd CursorHold * silent call CocActionAsync('highlight')

" 状态栏
" NOTE: Please see `:h coc-status` for integrations with external plugins that
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" keymaps {{{3

" 使用 K 显示帮助信息
nnoremap <silent> K :call <SID>show_documentation()<CR>

" GOTO code navigation {{{3
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"}}}3

" 重命名变量
nmap <leader>rn <Plug>(coc-rename)

" 自动排列选中的代码行 {{{3
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"}}}3

" function 文本对象 {{{3
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
"}}}3

" Remap <C-f> and <C-b> for 滚动提示窗口
if has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for 选中范围
" NOTE: Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" CocList 快捷键 {{{4
" Show all diagnostics.
nnoremap <silent><nowait> <Leader><Leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <Leader><Leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <Leader><Leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader><Leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <Leader><Leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <Leader><Leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <Leader><Leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <Leader><Leader>p  :<C-u>CocListResume<CR>
"}}}4

"}}}3

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 2}}}

"junegunn/fzf {{{2
"快速文件搜索
" 2}}}

"Yggdroot/indentLine {{{2
"缩进线指示
" 禁用颜色=>使用主题的配色
"let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nnoremap <silent> <leader>i :IndentLinesToggle<cr>
" 2}}}
