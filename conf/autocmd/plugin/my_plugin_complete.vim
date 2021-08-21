"asins/vim-dict
"neoclide/coc.nvim
" 防止重复加载
if get(s:, 'loaded', v:false)
  finish
else
  let s:loaded = v:true
endif
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
packadd vim-dict

if executable('node')
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

  augroup coc_group
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
endif

"-------------------------------------------------------------------------------
