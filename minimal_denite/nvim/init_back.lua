local dein_dir = vim.env.HOME .. '/.cache/dein'
local dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'

vim.o.runtimepath = dein_repo_dir .. ',' .. vim.o.runtimepath

local dein_toml_dir = vim.env.HOME .. '/.config/nvim'
local dein_toml_lazy = dein_toml_dir .. '/lazy.toml'
local dein_toml_ftplugin = dein_toml_dir .. '/ftplugin.toml'

if vim.call('dein#load_state', dein_dir) == 1 then
    vim.call('dein#begin', dein_dir, {vim.fn.expand('<sfile>'), dein_toml_lazy, dein_toml_ftplugin})
    vim.call('dein#add', dein_repo_dir)
    vim.call('dein#load_toml', dein_toml_lazy, {lazy = 1})
    vim.call('dein#load_toml', dein_toml_ftplugin, {lazy = 0})
    vim.call('dein#end')
    vim.call('dein#save_state')
end

if vim.call('dein#check_install') == 1 then
    vim.call('dein#install')
    vim.call('dein#remote_plugins')
end

local cmd = vim.cmd

cmd('syntax on') -- syntax highlighting
cmd('filetype plugin indent on') -- filetype autocmd
