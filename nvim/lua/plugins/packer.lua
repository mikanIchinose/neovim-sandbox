-- print'load plugins.init'

local nvim_cmd = vim.api.nvim_command
local fn = vim.fn

local install_path = DATA_PATH .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    nvim_cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    nvim_cmd 'packadd packer.nvim'
end

vim.cmd "autocmd BufWritePost plugins/init.lua PackerCompile"

return require'packer'.startup{
    function(use)
        use 'wbthomason/packer.nvim'

        -- color scheme
        use 'morhetz/gruvbox'

        -- lsp
        use(require'plugins.lsp')

        -- fuzzy finder
        use(require'plugins.fuzzy_finder')

        -- comment
        use {
            'tyru/caw.vim',
        }

        use {
            'kien/rainbow_parentheses.vim',
            -- config = require'plugins.rainbow_parentheses'
        }

        use {
            'nathanaelkane/vim-indent-guides',
            -- config = require'plugins.vim-indent-guides'
        }

        -- filer
        use {
            'Shougo/defx.nvim', 
            -- config = require'plugins.filer.defx'
        }

    end,
    config = {
        disable_command = true,
        display = {
            open_fn = require'packer.util'.float,
        },
    }
}
