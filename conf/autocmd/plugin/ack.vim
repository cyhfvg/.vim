vim9script

if get(s:, 'loaded', v:false)
    finish
else
    var loaded = v:true
endif
#-------------------------------------------------------------------------------
# Ack [options] {pattern} [{directories}]

if executable('rg')
    # ripgrep

    g:ackprg = 'rg --vimgrep --smart-case'

elseif executable('ag')
    # silversearcher-ag

    g:ackprg = 'ag --vimgrep --smart-case'
endif

# alias Ack! : do not autojump first matched
cnoreabbrev Ack Ack!

g:ackhighlight = 1

g:ack_use_cword_for_empty_search = 1

#-------------------------------------------------------------------------------
packadd ack.vim
#-------------------------------------------------------------------------------
