-- primary module
require'globals'

-- plugin
-- vim.cmd('source ~/.config/nvim/vimscript/dein.vim')
require 'plugins.dein'
require 'plugins.nvim-treesitter'
require 'plugins.caw'
-- require 'plugins.defx'
require 'plugins.fzf'
require 'plugins.rainbow_parentheses'
require 'plugins.which-key'
require 'plugins.nvim-compe'
require 'plugins.vim-indent-guides'

-- core settings
require'settings'
require'keymappings'
-- require'colorscheme'

-- utility
require'utils'

-- deinのhook_addに設定しても読み込まれる順番の関係でLSPが起動しないのでここに置く
require'lsp'
require'lsp.lua'
require'lsp.javascript'
require'lsp.vimL'
require'lsp.kotlin'
