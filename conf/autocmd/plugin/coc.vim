vim9script
if get(s:, 'loaded', v:false)
      finish
else
      var loaded = v:true
endif

# coc
if executable('node')

    #-------------------------------------------------------------------------------
    g:coc_global_extensions = []
    g:coc_global_extensions += ['coc-marketplace']
    g:coc_global_extensions += ['coc-dictionary']
    g:coc_global_extensions += ['coc-git']
    g:coc_global_extensions += ['coc-highlight']
    g:coc_global_extensions += ['coc-json']
    #g:coc_global_extensions += ['coc-pairs']
    g:coc_global_extensions += ['coc-pyright']
    g:coc_global_extensions += ['coc-powershell']
    g:coc_global_extensions += ['coc-syntax']
    g:coc_global_extensions += ['coc-vimlsp']
    g:coc_global_extensions += ['coc-word']
    g:coc_global_extensions += ['coc-sh']
    g:coc_global_extensions += ['coc-markdownlint']
    g:coc_global_extensions += ['coc-rust-analyzer']
    #-------------------------------------------------------------------------------

    # tips lazy time
    set updatetime=300

    # short messages
    set shortmess+=c

    # GOTO code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gr <Plug>(coc-references)

    # refactor: variable
    nmap <leader>rn <Plug>(coc-rename)

    # trigger complete manually
    inoremap <silent><expr> <c-c> coc#refresh()

    # documentation
    nnoremap <silent> K <ScriptCmd>Show_documentation()<CR>

    def Show_documentation()
        if (index(['vim', 'help'], &filetype) >= 0)
            execute 'h ' .. expand('<cword>')
        elseif (coc#rpc#ready())
            g:CocActionAsync('doHover')
        else
            execute '!' .. &keywordprg .. " " .. expand('<cword>')
        endif
    enddef

endif
