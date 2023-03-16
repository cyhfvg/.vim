vim9script
#================================================================================
# init-style.vim
#================================================================================

# statusline only when >2 windows
set laststatus=1
set number
# no sigh column
set signcolumn=no
# tabline only when >2 tabs
set showtabline=1
# show special chars
set list
set showcmd
# set cmdheight for 'have no `Press ENTER or type command to continue` msg'
set cmdheight=2
# show new window in right
set splitright

# no title bar
set guioptions-=m
# no tool bar
set guioptions-=T
# no left scrollbar
set guioptions-=l
# no right scrollbar
set guioptions-=r
# no bottom scrollbar
set guioptions-=b
# set shortmessage
set shortmess=atI
set noshowmode
set background=dark

packadd! onedark.vim
colorscheme onedark

# color setting ----- ----- {{{1
# spell error color
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal
if has('gui_running')
    hi! SpellBad gui=undercurl guisp=red
    hi! SpellCap gui=undercurl guisp=blue
    hi! SpellRare gui=undercurl guisp=magenta
    hi! SpellRare gui=undercurl guisp=cyan
else
    hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
    hi! SpellCap term=underline cterm=underline
    hi! SpellRare term=underline cterm=underline
    hi! SpellLocal term=underline cterm=underline
endif

# sign column color
hi! SignColumn guibg=NONE ctermbg=NONE

# number line color
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

# complete popup menu
hi! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
hi! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray
# ----- -----}}}

# true color
if (has("nvim"))
    $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if has("termguicolors")
    # true color
    set termguicolors
else
    set t_Co=256
endif

# quickfix window style
augroup VimInitStyle
    au!
    au FileType qf setlocal nonumber
augroup END

#----------------------------------------------------------------------
# TabLine style
#----------------------------------------------------------------------
def g:Vim_NeatTabLine(): string
    var s = ''
    for i in range(tabpagenr('$'))
        # select the highlighting
        if i + 1 == tabpagenr()
            s ..= '%#TabLineSel#'
        else
            s ..= '%#TabLine#'
        endif

        # set the tab page number (for mouse clicks)
        s ..= '%' .. (i + 1) .. 'T'

        # the label is made by MyTabLabel()
        s ..= ' %{g:Vim_NeatTabLabel(' .. (i + 1) .. ')} '
    endfor

    # after the last tab fill with TabLineFill and reset tab page nr
    s ..= '%#TabLineFill#%T'

    # right-align the label to close the current tab page
    if tabpagenr('$') > 1
        s ..= '%=%#TabLine#%999XX'
    endif

    return s
enddef

#----------------------------------------------------------------------
# set filename show into tab
#----------------------------------------------------------------------
def g:Vim_NeatBuffer(bufnr: number, fullname: number): string
    var name = bufname(bufnr)
    if getbufvar(bufnr, '&modifiable')
        if name == ''
            return '[No Name]'
        else
            if fullname
                return fnamemodify(name, ':p')
            else
                var aname = fnamemodify(name, ':p')
                var sname = fnamemodify(aname, ':t')
                if sname == ''
                    var test = fnamemodify(aname, ':h:t')
                    if test != ''
                        return '<' .. test .. '>'
                    endif
                endif
                return sname
            endif
        endif
    else
        var buftype = getbufvar(bufnr, '&buftype')
        if buftype == 'quickfix'
            return '[Quickfix]'
        elseif name != ''
            if fullname
                return '-' .. fnamemodify(name, ':p')
            else
                return '-' .. fnamemodify(name, ':t')
            endif
        endif
        return '[No Name]'
    endif
enddef

#----------------------------------------------------------------------
# get tabline style by n
#----------------------------------------------------------------------
# var g:config_vim_tab_style = n
#   default 0
#
# 0: filename.txt
# 2: 1 - filename.txt
# 3: [1] filename.txt
#
def g:Vim_NeatTabLabel(n: number): string
    var buflist = tabpagebuflist(n)
    var winnr = tabpagewinnr(n)
    var bufnr = buflist[winnr - 1]
    var fname = g:Vim_NeatBuffer(bufnr, 0)
    var num = n
    var style = get(g:, 'config_vim_tab_style', 0)
    if style == 0
        return fname
    elseif style == 1
        return "[" .. num .. "] " .. fname
    elseif style == 2
        return "" .. num .. " - " .. fname
    endif
    if getbufvar(bufnr, '&modified')
        return "[" .. num .. "] " .. fname .. " +"
    endif
    return "[" .. num .. "] " .. fname
enddef

set tabline=%!g:Vim_NeatTabLine()
set guitablabel=%!g:Vim_NeatTabLine()

# font
set guifont=Fira_Code:h18
