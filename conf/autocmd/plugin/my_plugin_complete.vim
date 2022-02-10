"asins/vim-dict
"neoclide/coc.nvim
" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
"
let g:coc_global_extensions = []
let g:coc_global_extensions += ['coc-dictionary']
let g:coc_global_extensions += ['coc-git']
let g:coc_global_extensions += ['coc-highlight']
let g:coc_global_extensions += ['coc-json']
"let g:coc_global_extensions += ['coc-marketplace']
let g:coc_global_extensions += ['coc-pairs']
let g:coc_global_extensions += ['coc-pyright']
let g:coc_global_extensions += ['coc-syntax']
let g:coc_global_extensions += ['coc-vimlsp']
let g:coc_global_extensions += ['coc-word']

"-------------------------------------------------------------------------------
" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
packadd vim-dict
set complete+=k

if executable('node')
  packadd coc.nvim

  " 设置提示延迟时间为300ms, 默认为4000ms = 4s
  set updatetime=300

  " 自动完成提示框中不跳过信息
  set shortmess+=c

  " 使用 K 显示帮助信息
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  " GOTO code navigation {{{3
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gr <Plug>(coc-references)
  "}}}3

  " 重命名变量
  nmap <leader>rn <Plug>(coc-rename)

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

endif

"-------------------------------------------------------------------------------
