vim.o.compatible = false -- 非互換モード

local dein_dir      = vim.fn.expand('~/.cache/dein')
local dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'

vim.o.runtimepath = dein_repo_dir .. ',' .. vim.o.runtimepath

local toml_dir      = '~/.config/nvim/dein'
local toml_base         = toml_dir .. '/base.toml'
local toml_lazy     = toml_dir .. '/lazy.toml'
local toml_ftplugin = toml_dir .. '/ftplugin.toml'

local call = vim.call
local g = vim.g

-- configuration
g['dein#auto_recache'] = 1
g['dein#lazy_rplugins'] = 1
g['dein#install_progress_type'] = 'title'
g['dein#enable_notification'] = 1
g['dein#install_message_type'] = 'title'
g['dein#notification_icon'] = '~/.config/nvim/icon/wanr.png'
-- g['dein#install_log_filename'] = '~/.config/nvim/log/dein.log'

if call('dein#load_state', dein_dir) == 1 then
    call('dein#begin', dein_dir, {vim.fn.expand('<sfile>'), toml_base, toml_lazy, toml_ftplugin}) -- initialize
    call('dein#load_toml', toml_base, {lazy = 0})
    call('dein#load_toml', toml_lazy, {lazy = 1})
    call('dein#load_toml', toml_ftplugin)
    call('dein#end')
    call('dein#save_state')
end

-- Installing plugins on startup if it is not installed.
if call('dein#check_install') == 1 then
    call('dein#install')
    call('dein#remote_plugins')
end

local removed_plugins = call('dein#check_clean')
if vim.fn.len(removed_plugins) > 0 then
    call('map', removed_plugins, "delete(v:val, 'rf')")
    call('dein#recache_runtimepath')
end
