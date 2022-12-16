if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif

" coc
if executable('node')

  "-------------------------------------------------------------------------------
  let g:coc_global_extensions = []
  let g:coc_global_extensions += ['coc-marketplace']
  let g:coc_global_extensions += ['coc-dictionary']
  "let g:coc_global_extensions += ['coc-git']
  let g:coc_global_extensions += ['coc-highlight']
  let g:coc_global_extensions += ['coc-json']
  "let g:coc_global_extensions += ['coc-pairs']
  let g:coc_global_extensions += ['coc-pyright']
  let g:coc_global_extensions += ['coc-powershell']
  let g:coc_global_extensions += ['coc-syntax']
  let g:coc_global_extensions += ['coc-vimlsp']
  let g:coc_global_extensions += ['coc-word']
  let g:coc_global_extensions += ['coc-sh']
  let g:coc_global_extensions += ['coc-markdownlint']
  "-------------------------------------------------------------------------------

  " tips lazy time
  set updatetime=300

  " short messages
  set shortmess+=c

  " GOTO code navigation
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gr <Plug>(coc-references)

  " refactor: variable
  nmap <leader>rn <Plug>(coc-rename)

  " trigger complete manually
  inoremap <silent><expr> <c-c> coc#refresh()

  " documentation
  nnoremap <silent> K :call <SID>show_documentation()<CR>
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
