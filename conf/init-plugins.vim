"==============================================================================
" init-plugins.vim - 插件
"==============================================================================

" plugin group 分组
if !exists('g:plugin_group')
  let g:plugin_group = []
  let g:plugin_group += ['backup']
  let g:plugin_group += ['basic']
  let g:plugin_group += ['complete']
  let g:plugin_group += ['enhanced']
  let g:plugin_group += ['filetype']
  let g:plugin_group += ['format']
  let g:plugin_group += ['fuzzy']
  let g:plugin_group += ['git']
  let g:plugin_group += ['markdown']
  let g:plugin_group += ['marks']
  let g:plugin_group += ['style']
  let g:plugin_group += ['tags']
  let g:plugin_group += ['textobj']
  let g:plugin_group += ['debug']
endif
"==============================================================================
if index(g:plugin_group, 'fuzzy') >= 0
  "ctrlpvim/ctrlp.vim tacahiroy/ctrlp-funky{{{2
  "tacahiroy/ctrlp-funky
  " 显示函数列表的扩展插件
  " ==================================
  packadd ctrlp.vim
  packadd ctrlp-funky
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

  "junegunn/fzf {{{2
  "快速文件搜索
  "packadd fzf
  " 2}}}
endif
"==============================================================================
if index(g:plugin_group, 'backup') >= 0
  "scrooloose/nerdtree {{{2
  "tiagofumo/vim-nerdtree-syntax-highlight
  packadd nerdtree
  packadd vim-nerdtree-syntax-highlight

  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeDirArrows = 1
  let g:NERDTreeHijackNetrw = 0
  nnoremap <silent> <leader>e :NERDTreeToggle<cr>
  nnoremap <silent> <leader>nf :NERDTreeFind<cr>
  " 2}}}

  "mbbill/undotree {{{2
  packadd undotree
  " set hotkey => \u
  nnoremap <silent> <leader>u :UndotreeToggle<cr>
  " persistent_undo
  if has("persistent_undo")
    let s:undo_path = expand(g:vimfilehome .'/'.'dirs/undodir')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(s:undo_path)
      call mkdir(s:undo_path, "p", 0755)
    endif
    let &undodir=s:undo_path
    set undofile
  endif
  " 2}}}
endif
"==============================================================================
if index(g:plugin_group, 'basic') >= 0
  "easymotion/vim-easymotion {{{2
  " 全文快速移动，<leader><leader>f{char} 即可触发
  packadd vim-easymotion
  map <Leader><Leader> <Plug>(easymotion-prefix)
  " 2}}}
endif
"==============================================================================
if index(g:plugin_group, 'complete') >= 0
  "asins/vim-dict {{{2
  " 给不同语言提供字典补全，插入模式下 c-x c-k 触发
  packadd vim-dict
  " 2}}}

  if executable('node')
    "neoclide/coc.nvim {{{2
    packadd coc.nvim

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
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server
    "xmap if <Plug>(coc-funcobj-i)
    "omap if <Plug>(coc-funcobj-i)
    "xmap af <Plug>(coc-funcobj-a)
    "omap af <Plug>(coc-funcobj-a)
    "xmap ic <Plug>(coc-classobj-i)
    "omap ic <Plug>(coc-classobj-i)
    "xmap ac <Plug>(coc-classobj-a)
    "omap ac <Plug>(coc-classobj-a)
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
  endif

endif
"==============================================================================
if index(g:plugin_group, 'enhanced') >= 0
  "chrisbra/vim-diff-enhanced {{{2
  " Diff 增强，支持 histogram / patience 等更科学的 diff 算法
  packadd vim-diff-enhanced
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
  packadd vim-misc
  " 2}}}

  "Shougo/echodoc.vim {{{2
  " echodoc：在底部显示函数参数
  packadd echodoc.vim
  set noshowmode
  let g:echodoc#enable_at_startup = 1
  " 2}}}

endif
"==============================================================================
if index(g:plugin_group, 'filetype') >= 0
  "sheerun/vim-polyglot {{{2
  " 支持各种语法高亮
  packadd vim-polyglot
  " 2}}}
endif
"==============================================================================
if index(g:plugin_group, 'format') >= 0
  "godlygeek/tabular {{{2
  "对齐插件，:'<,'>Tabularize /{pattern}
  packadd tabular
  " 2}}}
endif
"==============================================================================
if index(g:plugin_group, 'git') >= 0
      \&& executable('git')
  "mhinz/vim-signify {{{2
  " 用于在侧边符号栏显示 git/svn 的 diff
  " signify 调优
  packadd vim-signify
  let g:signify_vcs_list = ['git', 'svn']
  let g:signify_sign_add               = '+'
  let g:signify_sign_delete            = '_'
  let g:signify_sign_delete_first_line = '‾'
  let g:signify_sign_change            = '~'
  let g:signify_sign_changedelete      = g:signify_sign_change
  " 2}}}

  "tpope/vim-fugitive {{{2
  " Git 支持
  packadd vim-fugitive
  " 2}}}
endif
"==============================================================================
if index(g:plugin_group, 'markdown') >= 0
  "plasticboy/vim-markdown {{{2
  "markdown 高亮,语法
  "依赖于tabular 确保tabular启动于vim-markdown之前
  packadd tabular
  packadd vim-markdown
  " 2}}}

  "mzlogin/vim-markdown-toc {{{2
  "生成markdown目录
  packadd vim-markdown-toc
  " 使用命令 {{{3
  " 在当前光标后生成目录
  " :GenTocMarked
  " 更新目录
  " :UpdateToc
  "  3}}}
  "取消存储时自动更新目录
  let g:vmt_auto_update_on_save = 0
  " 2}}}
  "iamcco/markdown-preview.nvim {{{2
  " 手动至markdown-preview.nvim/app目录下安装nodejs依赖`yarn install`
  packadd markdown-preview.nvim
  " 指定浏览器路径
  let g:mkdp_path_to_chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
  " 打开/关闭预览
  nnoremap <silent> <leader>mv :MarkdownPreviewToggle<cr>
  " 2}}}
endif
"==============================================================================
if index(g:plugin_group, 'marks') >= 0
  "kshenoy/vim-signature {{{2
  " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
  packadd vim-signature
  " 2}}}
endif
"==============================================================================
if index(g:plugin_group, 'style') >= 0

  "flazz/vim-colorschemes {{{2
  " 一次性安装一大堆 colorscheme
  packadd vim-colorschemes
  " 2}}}

  "airline {{{2
  "vim-airline/vim-airline
  "vim-airline/vim-airline-themes
  packadd vim-airline
  packadd vim-airline-themes

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

  "Yggdroot/indentLine {{{2
  "缩进线指示
"  packadd indentLine
  " 禁用颜色=>使用主题的配色
"  let g:indentLine_setColors = 0
"  let g:indentLine_char_list = ['¦', '┆', '┊']
"  nnoremap <silent> <leader>i :IndentLinesToggle<cr>
  " 2}}}
endif
"==============================================================================
if index(g:plugin_group, 'tags') >= 0
      \ && executable('ctags')
  "ludovicchabant/vim-gutentags skywind3000/gutentags_plus {{{2
  packadd vim-gutentags

  " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
  " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
  packadd gutentags_plus

  "debug
  "let g:gutentags_trace = 1

  " 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
  let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
  " 设定所生成的数据文件的名称
  let g:gutentags_ctags_tagfile = '.tags'

  " 默认生成的数据文件集中到 vimfilehome/dirs/tag 避免污染项目目录，好清理
  let s:tag_path = expand(g:vimfilehome .'/'.'dirs/tagdir')
  if !isdirectory(s:tag_path)
    call mkdir(s:tag_path, "p", 0755)
  endif
  let g:gutentags_cache_dir = expand(s:tag_path)

  " 默认禁用自动生成
  let g:gutentags_modules = []

  " 如果有 ctags 可执行就允许动态生成 ctags 文件
  let g:gutentags_modules += ['ctags']

  " 如果有 gtags 可执行就允许动态生成 gtags 数据库
  if executable('gtags') && executable('gtags-cscope')
    let g:gutentags_modules += ['gtags_cscope']
  endif

  " 设置 ctags 的参数
  let g:gutentags_ctags_extra_args = []
  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

  " 禁止 gutentags 自动链接 gtags 数据库
  let g:gutentags_auto_add_gtags_cscope = 0
  " 2}}}

  "skywind3000/vim-preview {{{2
  " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
  packadd vim-preview
  "2}}}

  "vim-scripts/taglist.vim {{{2
  packadd taglist.vim

  "不同时显示多个文件的tag,只显示当前文件的tag
  let Tlist_Show_One_File = 1

  "如果taglist窗口是最后一个窗口，则退出vim
  let Tlist_Exit_OnlyWindow = 1

  "在右侧窗口中显示taglist窗口
  let Tlist_Use_Right_Window = 1

  nnoremap <silent> <leader>t :TlistToggle<cr>

  "2}}}

endif
"==============================================================================
if index(g:plugin_group, 'textobj') >= 0
  "文本对象textobj {{{2
  "kana/vim-textobj-user
  " 基础插件：提供让用户方便的自定义文本对象的接口
  packadd vim-textobj-user
  "kana/vim-textobj-indent
  " indent 文本对象：ii / ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
  packadd vim-textobj-indent
  "kana/vim-textobj-syntax
  " 语法文本对象：iy / ay 基于语法的文本对象
  packadd vim-textobj-syntax
  "sgur/vim-textobj-parameter
  " 参数文本对象：i, / a, 包括参数或者列表元素
  packadd vim-textobj-parameter
  "jceb/vim-textobj-uri
  " 提供 uri/url 的文本对象，iu / au 表示
  packadd vim-textobj-uri
  " 2}}}
endif
"==============================================================================

"==============================================================================
if index(g:plugin_group, 'debug') >= 0
  "gotcha/ipdb.git
  "python debuger
  packadd ipdb
  "vim-vdebug/vdebug
  "vim debuger
  "packadd vdebug
endif
"==============================================================================
