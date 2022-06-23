# .vim

my-vim8-package-manager

ref: [skywind3000/vim-init](https://github.com/skywind3000/vim-init)

## 安装

```bash
# 获取仓库
<<<<<<< HEAD
git clone git@github.com:cyhfvg/.vim.git
cd .vim/
# 获取子模块内容
=======
#git clone git@github.com:cyhfvg/.vim.git
git clone https://github.com/cyhfvg/.vim.git
cd .vim/

# 获取子模块内容(获取依赖插件)
>>>>>>> feda444 (doc(readme): fix readme)
git submodule update --init --recursive
```

### 添加插件

<<<<<<< HEAD
```bash
cd ~/.vim
=======

```bash
# 以添加git子模块的方式添加插件
cd ~/.vim

>>>>>>> feda444 (doc(readme): fix readme)
# 插件安装至 pack\mypackage\opt\*
git submodule add https://github.com/{username}/{packagename}.git pack/mypackage/opt/{packagename}
```

### 升级所有插件

```bash
<<<<<<< HEAD
# 将子模块插件 从当前 commitID 升级至远端最新版本
git submodule update --recursive --remote
```

=======
# 更新子模块到最新commitID(本地)
git submodule update --recursive --remote
```

### 依赖插件更新

使用github `dependabot` 进行自动更新。

>>>>>>> feda444 (doc(readme): fix readme)
### 相关插件列表

- [ack.vim](https://github.com/mileszs/ack.vim.git)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [fzf](https://github.com/junegunn/fzf)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [tabular](https://github.com/godlygeek/tabular)
- [undotree](https://github.com/mbbill/undotree)
- [vim-abolish](https://github.com/tpope/vim-abolish)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-dict](https://github.com/asins/vim-dict)
- [vim-diff-enhanced](https://github.com/chrisbra/vim-diff-enhanced)
- [vim-fugitive](https://github.com/tpope/vim-fugit)
- [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
- [vim-matchup](https://github.com/andymass/vim-matchup)
- [vim-preview](https://github.com/skywind3000/vim-preview)
- [vim-surround](https://github.com/tpope/vim-surround.git)
- [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode.git)
- [vim-textobj-indent](https://github.com/kana/vim-textobj-indent)
- [vim-textobj-parameter](https://github.com/sgur/vim-textobj-parameter)
- [vim-textobj-user](https://github.com/kana/vim-textobj-user)
- [vista.vim](https://github.com/liuchengxu/vista.vim)
