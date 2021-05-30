-- print'load plugins.dein'

vim.o.compatible = false -- 非互換モード

local dein_dir = HOME .. '/.cache/dein'
local dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'

vim.o.runtimepath = dein_repo_dir .. ',' .. vim.o.runtimepath

local dein_toml_dir = HOME .. '/.config/nvim/dein'
local dein_toml = dein_toml_dir .. '/base.toml'
local dein_toml_lazy = dein_toml_dir .. '/lazy.toml'
local dein_toml_python = dein_toml_dir .. '/python.toml'
local dein_toml_ftplugin = dein_toml_dir .. '/ftplugin.toml'

-- configuration
if vim.call('dein#load_state', dein_dir) == 1 then
    vim.call('dein#begin', dein_dir, {vim.fn.expand('<sfile>'), dein_toml, dein_toml_lazy, dein_toml_python, dein_toml_ftplugin}) -- initialize
    vim.call('dein#load_toml', dein_toml, {lazy = 0})
    vim.call('dein#load_toml', dein_toml_lazy, {lazy = 1})
    vim.call('dein#load_toml', dein_toml_ftplugin)
    -- if vim.fn.has('python3') == 1 then
        -- vim.call('dein#load_toml', dein_toml_python, {lazy = 1})
    -- end
    vim.call('dein#end')
    vim.call('dein#save_state')
end

-- Installing plugins on startup if it is not installed.
if vim.call('dein#check_install') == 1 then
    vim.call('dein#install')
    vim.call('dein#remote_plugins')
end

vim.call('dein#remote_plugins')
