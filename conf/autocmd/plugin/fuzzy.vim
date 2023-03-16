vim9script
if get(s:, 'loaded', v:false)
    finish
else
    var loaded = v:true
endif

# Fzf prefix
g:fzf_command_prefix = 'Fzf'

$FZF_DEFAULT_OPTS = '--layout=reverse'

g:fzf_preview_window = ['right:60%', 'ctrl-/']
# [Buffers] Jump to the existing window if possible
g:fzf_buffers_jump = 1
# [[B]Commits] Customize the options used by 'git log':
g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

# BLines    fuzzy lines in cur buffer
# Lines    fuzzy lines in all buffer
# Rg       fuzzy strings in all files in cur dirs
# History  fuzzy edit history files
# History:    fuzzy history commands

# return tracked files when a git repo
def FzfOmniFiles()
    var is_git = system('git rev-parse --git-dir')

    # not a git repo
    if v:shell_error != 0
        :FzfFiles
    else
        :FzfGFiles --exclude-standard
    endif
enddef

noremap <silent> <c-p> <ScriptCmd>FzfOmniFiles()<cr>
noremap <m-p> :FzfBuffers<cr>
noremap <m-m> :FzfMarks<cr>
noremap <leader>f :FzfRg<cr>

#==========
packadd fzf
packadd fzf.vim
