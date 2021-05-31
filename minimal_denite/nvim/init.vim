if &compatible
  set nocompatible " Be iMproved
endif

let s:dein_dir      = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:base_toml = '~/.config/nvim/base.toml'
let s:lazy_toml = '~/.config/nvim/lazy.toml'
let s:ft_toml   = '~/.config/nvim/ftplugin.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [expand('<sfile>'), s:base_toml, s:lazy_toml, s:ft_toml])
  
  call dein#load_toml(s:base_toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#load_toml(s:ft_toml)
  call dein#recache_runtimepath()
  
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" call dein#remote_plugins()

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

filetype plugin indent on
syntax enable
