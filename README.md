# .vim

my-vim8-package-manager

## 安装

```bash
# 获取仓库
git clone git@github.com:cyhfvg/.vim.git
cd .vim/
# 获取子模块内容
git submodule update --init --recursive
```

### 添加插件

```bash
cd ~/.vim
# 插件安装至 pack\mypackage\opt\*
git submodule add git@github.com:{username}/{packagename}.git pack/mypackage/opt/{packagename}
```

### 升级所有插件

```bash
# 将子模块插件 从当前 commitID 升级至远端最新版本
git submodule update --recursive --remote
```

### 相关插件列表

- [ack.vim](https://github.com/mileszs/ack.vim.git)
- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [fzf](https://github.com/junegunn/fzf)
- [gruvbox](https://github.com/morhetz/gruvbox)
- [gutentags_plus](https://github.com/skywind3000/gutentags_plus)
- [indentLine](https://github.com/Yggdroot/indentLine)
- [ipdb](https://github.com/gotcha/ipdb)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [tabular](https://github.com/godlygeek/tabular)
- [vim-dict](https://github.com/asins/vim-dict)
- [vim-diff-enhanced](https://github.com/chrisbra/vim-diff-enhanced)
- [vim-easymotion](https://github.com/easymotion/vim-easymotion)
- [vim-fugitive](https://github.com/tpope/vim-fugit)
- [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)
- [vim-matchup](https://github.com/andymass/vim-matchup)
- [vim-misc](https://github.com/xolox/vim-misc)
- [vim-polyglot](https://github.com/sheerun/vim-polyglot)
- [vim-preview](https://github.com/skywind3000/vim-preview)
- [vim-signature](https://github.com/kshenoy/vim-signature)
- [vim-signify](https://github.com/mhinz/vim-signify)
- [vim-surround](https://github.com/tpope/vim-surround.git)
- [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode.git)
- [vim-textobj-indent](https://github.com/kana/vim-textobj-indent)
- [vim-textobj-parameter](https://github.com/sgur/vim-textobj-parameter)
- [vim-textobj-syntax](https://github.com/kana/vim-textobj-syntax)
- [vim-textobj-uri](https://github.com/jceb/vim-textobj-uri)
- [vim-textobj-user](https://github.com/kana/vim-textobj-user)
- [vista.vim](https://github.com/liuchengxu/vista.vim)
