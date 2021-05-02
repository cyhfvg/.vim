# .vim
my-vim8-package-manager

### 添加第三方插件
```bash
cd ~/.vim
git submoudle add git@github.com:dense-analysis/ale.git pack/mypackage/start/ale
```

### 升级所有插件
```bash
git submodule update --recursive --remote
```
### 迁移配置

```bash
cd ~/.vim
git clone --recursive git@github.com:cyhfvg/.vim.git
```
