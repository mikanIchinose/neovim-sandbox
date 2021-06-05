-- primary module
require'globals'

-- plugin
require 'plugins'
-- require 'plugins.dein'
require 'plugins.nvim-treesitter'
require 'plugins.caw'
require 'plugins.defx'
-- require 'plugins.denite'
-- vim.cmd[[source ~/.config/nvim/vimscript/denite.vim]]
require 'plugins.fzf'
-- require 'plugins.rainbow_parentheses'
require 'plugins.which-key'
require 'plugins.nvim-compe'

-- core settings
require'settings'
require'keymappings'
require'colorscheme'

require'utils'

-- deinのhook_addに設定しても読み込まれる順番の関係でLSPが起動しないのでここに置く
require'lsp'
require'lsp.lua'
require'lsp.javascript'
require'lsp.vimL'
--require'lsp.kotlin'
--
require 'plugins.nvim-compe.keymappings'
