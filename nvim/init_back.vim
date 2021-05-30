"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein/base.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein/lazy.toml', {'lazy': 1})
  if has('python3')
    call dein#load_toml('~/.config/nvim/dein/python.toml', {'lazy': 1})
  endif
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

