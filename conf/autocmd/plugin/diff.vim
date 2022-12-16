vim9script
if get(s:, 'loaded', v:false)
    finish
else
    var loaded = v:true
endif

# git repository use `histogram` algorithm
g:signify_vcs_cmds = {
    'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
}

if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif

packadd vim-diff-enhanced
