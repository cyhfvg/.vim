vim9script
#================================================================================
# init-keymaps.vim
#================================================================================

# cursor movement: command line
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>
# cursor movement: wrap line
noremap <m-j> gj
noremap <m-k> gk
inoremap <m-j> <c-\><c-o>gj
inoremap <m-k> <c-\><c-o>gk

# buffer switch
noremap <silent> <leader>bn :bn<cr>
noremap <silent> <leader>bp :bp<cr>

# tab switch
noremap <silent> <leader>tc :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>
noremap <silent> <leader>to :tabonly<cr>
# tab select Alt-N
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>
# tab select <Leader>-N
noremap <silent><leader>1 1gt<cr>
noremap <silent><leader>2 2gt<cr>
noremap <silent><leader>3 3gt<cr>
noremap <silent><leader>4 4gt<cr>
noremap <silent><leader>5 5gt<cr>
noremap <silent><leader>6 6gt<cr>
noremap <silent><leader>7 7gt<cr>
noremap <silent><leader>8 8gt<cr>
noremap <silent><leader>9 9gt<cr>
noremap <silent><leader>0 10gt<cr>

# window switch
noremap <TAB>h <C-w>h
noremap <TAB>l <C-w>l
noremap <TAB>j <C-w>j
noremap <TAB>k <C-w>k
inoremap <TAB>h <esc><C-w>h
inoremap <TAB>l <esc><C-w>l
inoremap <TAB>j <esc><C-w>j
inoremap <TAB>k <esc><C-w>k

# window resize
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>

# text edit
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap Y y$

# text search
# search visual content, escape special char
vnoremap <silent> //    y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

#vista tag view(autoload)
nnoremap <silent> <leader>v :Vista!!<cr>

#nerdtree toggle(autoload)
nnoremap <silent> <leader>e :NERDTreeToggle<cr>

#undotree toggle
nnoremap <silent> <leader>u :UndotreeToggle<cr>

# vim-preview {{{1
#
# scroll half page
nnoremap <m-u> :PreviewScroll -1<cr>
nnoremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
# quickfix preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
#}}}

#----------------------------------------------------------------------
# exec file by filetype, output to quickfix window
#----------------------------------------------------------------------
nnoremap <silent> <F5> <ScriptCmd>ExecuteFile()<cr>

command! Run ExecuteFile()

def ExecuteFile()
    var cmd = ''
    if index(['c', 'cpp', 'rs'], &ft) >= 0
        cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
    elseif &ft == 'rust'
        cmd = 'cargo run'
    elseif &ft == 'go'
        cmd = 'go run "$(VIM_FILEPATH)"'
    elseif &ft == 'python'
        cmd = 'python "$(VIM_FILEPATH)"'
    elseif &ft == 'javascript'
        cmd = 'node "$(VIM_FILEPATH)"'
    elseif &ft == 'perl'
        cmd = 'perl "$(VIM_FILEPATH)"'
    elseif &ft == 'ruby'
        cmd = 'ruby "$(VIM_FILEPATH)"'
    elseif &ft == 'php'
        cmd = 'php "$(VIM_FILEPATH)"'
    elseif &ft == 'lua'
        cmd = 'lua "$(VIM_FILEPATH)"'
    elseif &ft == 'zsh'
        cmd = 'zsh "$(VIM_FILEPATH)"'
    elseif &ft == 'ps1'
        cmd = 'powershell -file "$(VIM_FILEPATH)"'
    elseif &ft == 'vbs'
        cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
    elseif &ft == 'sh'
        cmd = 'bash "$(VIM_FILEPATH)"'
    else
        return
    endif

    if has('win32') || has('win64')
        exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=4 ' .. cmd
    else
        exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=0 ' .. cmd
    endif
enddef
