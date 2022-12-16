vim9script
#================================================================================
# init-tabsize.vim
#================================================================================

# indent width
set shiftwidth=4
# tab = <n> spaces
set tabstop=4
# use spaces without tab char
set expandtab
# tab = <n> spaces
set softtabstop=4

augroup tabSize
  au!
  au FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
  au FileType python setlocal shiftwidth=4 tabstop=4 expandtab
augroup End
