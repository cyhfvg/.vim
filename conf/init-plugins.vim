"================================================================================
" init-plugins.vim - 插件
"================================================================================

"--------------------------------------------------------------------------------
" 插件分组 {{{1
"--------------------------------------------------------------------------------

" 插件组 {{{2
if !exists('g:bundle_group')
  let g:bundle_group = ['basic']
  let g:bundle_group += ['airline']
  let g:bundle_group += ['ale']
  let g:bundle_group += ['coc']
  let g:bundle_group += ['echodoc']
  let g:bundle_group += ['enhanced']
  let g:bundle_group += ['filetypes']
  let g:bundle_group += ['nerdtree']
  let g:bundle_group += ['textobj']
  let g:bundle_group += ['undotree']
"  let g:bundle_group += ['leaderf']
"  let g:bundle_group += ['grammer']
"  let g:bundle_group += ['lightline']
"  let g:bundle_group += ['tags']
"  let g:bundle_group += ['unknow']
endif
"}}}2

" 语言组 {{{2
if !exists('g:language_group')
  let g:language_group = ['python']
endif
"}}}2

" 1}}}

"--------------------------------------------------------------------------------
" 计算当前 vim-init 的子路径 {{{1
"--------------------------------------------------------------------------------

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
  let path = expand(s:home . '/' . a:path)
  return substitute(path, '\\', '/', 'g')
endfunc

" 1}}}


"--------------------------------------------------------------------------------
" 在 ~/.vim/plugins 下安装 {{{1
"--------------------------------------------------------------------------------

call plug#begin(get(g:, 'bundle_home', '~/.vim/plugins'))

" 1}}}


"--------------------------------------------------------------------------------
" 默认插件 {{{1
"--------------------------------------------------------------------------------

" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'easymotion/vim-easymotion'

"* 对齐插件，:'<,'>Tabularize /{pattern}
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" TODO: Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'

" 1}}}

"----------------------------------------------------------------------
" 基础插件 {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0

  " 展示开始画面，显示最近编辑过的文件
  Plug 'mhinz/vim-startify'

  " 一次性安装一大堆 colorscheme
"  Plug 'flazz/vim-colorschemes'
  Plug 'joshdick/onedark.vim'

  " 支持库，给其他插件用的函数库
  Plug 'xolox/vim-misc'

  " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
  Plug 'kshenoy/vim-signature'

  " 用于在侧边符号栏显示 git/svn 的 diff
  Plug 'mhinz/vim-signify'

  " 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
  " 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
  Plug 'mh21/errormarker.vim'

  " 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
  Plug 't9md/vim-choosewin'

  " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
"  Plug 'skywind3000/vim-preview'

  " Git 支持
  Plug 'tpope/vim-fugitive'

  " 使用 ALT+E 来选择窗口
  nmap <m-e> <Plug>(choosewin)

  " 默认不显示 startify {0: 显示, 1: 不显示}
"  let g:startify_disable_at_vimenter = 1
  let g:startify_disable_at_vimenter = 0
  let g:startify_session_dir = '~/.vim/session'

  " 使用 <space>ha 清除 errormarker 标注的错误
  noremap <silent> <Leader>ha :RemoveErrorMarkers<cr>

  " signify 调优
  let g:signify_vcs_list = ['git', 'svn']
  let g:signify_sign_add               = '+'
  let g:signify_sign_delete            = '_'
  let g:signify_sign_delete_first_line = '‾'
  let g:signify_sign_change            = '~'
  let g:signify_sign_changedelete      = g:signify_sign_change

  " git 仓库使用 histogram 算法进行 diff
  let g:signify_vcs_cmds = {
      \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
      \}
endif

" 1}}}

"----------------------------------------------------------------------
" 增强插件 {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0
  " 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
  Plug 'terryma/vim-expand-region'

  " TODO: 快速文件搜索
  Plug 'junegunn/fzf'

  " TODO: 给不同语言提供字典补全，插入模式下 c-x c-k 触发
  Plug 'asins/vim-dict'

  " 使用 :FlyGrep 命令进行实时 grep
"  Plug 'wsdjeg/FlyGrep.vim'

  " 使用 :CtrlSF 命令进行模仿 sublime 的 grep
"  Plug 'dyng/ctrlsf.vim'

  " ALT_+/- 用于按分隔符扩大缩小 v 选区
  map <m-=> <Plug>(expand_region_expand)
  map <m--> <Plug>(expand_region_shrink)
endif

" 1}}}

"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能 {{{1
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0
  " 提供 ctags/gtags 后台数据库自动更新功能
  Plug 'ludovicchabant/vim-gutentags'

  " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
  " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
  Plug 'skywind3000/gutentags_plus'

  " 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
  let g:gutentags_project_root = ['.root']
  let g:gutentags_ctags_tagfile = '.tags'

  " 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
  let g:gutentags_cache_dir = expand('~/.cache/tags')

  " 默认禁用自动生成
  let g:gutentags_modules = [] 

  " 如果有 ctags 可执行就允许动态生成 ctags 文件
  if executable('ctags')
    let g:gutentags_modules += ['ctags']
  endif

  " 如果有 gtags 可执行就允许动态生成 gtags 数据库
  if executable('gtags') && executable('gtags-cscope')
    let g:gutentags_modules += ['gtags_cscope']
  endif

  " 设置 ctags 的参数
  let g:gutentags_ctags_extra_args = []
  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

  " 使用 universal-ctags 的话需要下面这行，请反注释
  " let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

  " 禁止 gutentags 自动链接 gtags 数据库
  let g:gutentags_auto_add_gtags_cscope = 0
endif

" 1}}}

"----------------------------------------------------------------------
" 文本对象：textobj 全家桶 {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj') >= 0

  " 基础插件：提供让用户方便的自定义文本对象的接口
  Plug 'kana/vim-textobj-user'

  " indent 文本对象：ii / ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
  Plug 'kana/vim-textobj-indent'

  " 语法文本对象：iy / ay 基于语法的文本对象
  Plug 'kana/vim-textobj-syntax'

  " 函数文本对象：if / af 支持 c/c++/vim/java
  Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

  " 参数文本对象：i, / a, 包括参数或者列表元素
  Plug 'sgur/vim-textobj-parameter'

  " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
"  Plug 'bps/vim-textobj-python', {'for': 'python'}

  " 提供 uri/url 的文本对象，iu / au 表示
  Plug 'jceb/vim-textobj-uri'
endif

" 1}}}

"----------------------------------------------------------------------
" 文件类型扩展 {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0

  " polyglot config {{{1
  " 支持各种语法高亮
  Plug 'sheerun/vim-polyglot'

  let g:javascript_plugin_jsdoc = 1
  let g:javascript_plugin_flow = 1
  let g:jsx_ext_required = 0
  " 1}}}

  " vim org-mode 
"  Plug 'jceb/vim-orgmode', { 'for': 'org' }

endif
" 1}}}

"----------------------------------------------------------------------
" airline {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_powerline_fonts = 0
  let g:airline_exclude_preview = 1
  let g:airline_section_b = '%n'
  let g:airline_theme='onedark'
  let g:airline#extensions#branch#enabled = 0
  let g:airline#extensions#syntastic#enabled = 0
  let g:airline#extensions#fugitiveline#enabled = 0
  let g:airline#extensions#csv#enabled = 0
  let g:airline#extensions#vimagit#enabled = 0
endif

" 1}}}

"----------------------------------------------------------------------
" lightline {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'lightline') >= 0
  " statusline'theme lightline
  Plug 'itchyny/lightline.vim'

  " 设置 lightline 主题
  let g:lightline ={
        \ 'colorscheme': 'onedark',
        \ }
endif

"----------------------------------------------------------------------
" NERDTree {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'nerdtree') >= 0
  Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeDirArrows = 1
  let g:NERDTreeHijackNetrw = 0
  nnoremap <silent> <leader>e :NERDTreeToggle<cr>
  nnoremap <silent> <leader>nf :NERDTreeFind<cr>
endif

" 1}}}

"----------------------------------------------------------------------
" LanguageTool 语法检查 {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'grammer') >= 0
  Plug 'rhysd/vim-grammarous'
  noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
  map <space>rr <Plug>(grammarous-open-info-window)
  map <space>rv <Plug>(grammarous-move-to-info-window)
  map <space>rs <Plug>(grammarous-reset)
  map <space>rx <Plug>(grammarous-close-info-window)
  map <space>rm <Plug>(grammarous-remove-error)
  map <space>rd <Plug>(grammarous-disable-rule)
  map <space>rn <Plug>(grammarous-move-to-next-error)
  map <space>rp <Plug>(grammarous-move-to-previous-error)
endif

" 1}}}

"----------------------------------------------------------------------
" ale：动态语法检查 {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'ale') >= 0
  Plug 'w0rp/ale'

  " 设定延迟和提示信息
  let g:ale_completion_delay = 500
  let g:ale_echo_delay = 20
  let g:ale_lint_delay = 500
  let g:ale_echo_msg_format = '[%linter%] %code: %%s'

  " 设定检测的时机：normal 模式文字改变，或者离开 insert模式
  " 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1

  " 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
  if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
    let g:ale_command_wrapper = 'nice -n5'
  endif

  " TODO: 使用airline 允许 airline 集成
  let g:airline#extensions#ale#enabled = 1

  " 编辑不同文件类型需要的语法检查器
  let g:ale_linters = {
        \ 'c': ['gcc', 'cppcheck'], 
        \ 'cpp': ['gcc', 'cppcheck'], 
        \ 'python': ['flake8', 'pylint'], 
        \ 'lua': ['luac'], 
        \ 'go': ['go build', 'gofmt'],
        \ 'java': ['javac'],
        \ 'javascript': ['eslint'], 
        \ }
endif
" 1}}}

"----------------------------------------------------------------------
" echodoc：在底部显示函数参数 {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'echodoc') >= 0
  Plug 'Shougo/echodoc.vim'
  set noshowmode
  let g:echodoc#enable_at_startup = 1
endif

" 1}}}

"----------------------------------------------------------------------
" LeaderF 文件模糊匹配，tags/函数名 选择 {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'leaderf') >= 0
  " 如果 vim 支持 python 则启用  Leaderf
  if has('python') || has('python3')
    Plug 'Yggdroot/LeaderF'

    " CTRL+p 打开文件模糊匹配
    let g:Lf_ShortcutF = '<c-p>'

    " ALT+n 打开 buffer 模糊匹配
    let g:Lf_ShortcutB = '<m-n>'

    " CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
    noremap <c-n> :LeaderfMru<cr>

    " ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
    noremap <m-p> :LeaderfFunction!<cr>

    " ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
    noremap <m-P> :LeaderfBufTag!<cr>

    " ALT+n 打开 buffer 列表进行模糊匹配
    noremap <m-n> :LeaderfBuffer<cr>

    " ALT+m 全局 tags 模糊匹配
    noremap <m-m> :LeaderfTag<cr>

    " 最大历史文件保存 2048 个
    let g:Lf_MruMaxFiles = 2048

    " ui 定制
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

    " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.vim/cache')

    " 显示绝对路径
    let g:Lf_ShowRelativePath = 0

    " 隐藏帮助
    let g:Lf_HideHelp = 1

    " 模糊匹配忽略扩展名
    let g:Lf_WildIgnore = {
          \ 'dir': ['.svn','.git','.hg'],
          \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
          \ }

    " MRU 文件忽略扩展名
    let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
    let g:Lf_StlColorscheme = 'powerline'

    " 禁用 function/buftag 的预览功能，可以手动用 p 预览
    let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

    " 使用 ESC 键可以直接退出 leaderf 的 normal 模式
    let g:Lf_NormalMap = {
        \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
        \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
        \ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
        \ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
        \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
        \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
        \ }

  else
    " 不支持 python ，使用 CtrlP 代替
    Plug 'ctrlpvim/ctrlp.vim'

    " 显示函数列表的扩展插件
    Plug 'tacahiroy/ctrlp-funky'

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
  endif
endif

" 1}}}

"----------------------------------------------------------------------
" undotree {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'undotree') >= 0
  Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  " set hotkey => \u
  nnoremap <silent> <leader>u :UndotreeToggle<cr>
  " persistent_undo
  if has("persistent_undo")
    let target_path = expand('~/.vim/undodir')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
      call mkdir(target_path, "p", 0700)
    endif
    let &undodir=target_path
    set undofile
  endif
endif

" 1}}}

"----------------------------------------------------------------------
" coc {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'coc') >= 0
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " 设置提示延迟时间为300ms, 默认为4000ms = 4s
  set updatetime=300

  " 自动完成提示框中不跳过信息
  set shortmess+=c

  " 符号列
  if has("patch-8.1.1564")
    " 版本大于 8.1.1564 ，允许符号列与数字列合并
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " 一段时间(updatetime)内光标不移动，高亮光标下的变量及其引用
  "autocmd CursorHold * silent call CocActionAsync('highlight')

  " 状态栏
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " keymaps {{{2

  " 使用 K 显示帮助信息
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  " GOTO code navigation {{{3
  nmap <silent> gd <Plug>(coc-definition)
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


  " CocList 快捷键 {{{3
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
  "}}}3

  "}}}2

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

endif
" 1}}}

"----------------------------------------------------------------------
" unknow {{{1
"----------------------------------------------------------------------
if index(g:bundle_group, 'unknow') >= 0
endif

" 1}}}

if index(g:language_group, 'python') >= 0
  " python lsp 
endif

"----------------------------------------------------------------------
" 结束插件安装 {{{1
"----------------------------------------------------------------------
call plug#end()

" 1}}}
