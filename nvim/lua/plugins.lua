local nvim_cmd = vim.api.nvim_command
local fn = vim.fn

local install_path = DATA_PATH .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    nvim_cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    nvim_cmd 'packadd packer.nvim'
end

vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]

return require'packer'.startup{
    function(use)
        use 'wbthomason/packer.nvim'

        -- color scheme
        use 'morhetz/gruvbox'

        -- lsp
        use {
            'neovim/nvim-lspconfig',
            requires = {
                {'kabouzeid/nvim-lspinstall'},
                {'hrsh7th/nvim-compe'},
                {'hrsh7th/vim-vsnip'},
            }
        }

        -- fuzzy finder
        use {
            'junegunn/fzf',
            run = [[:call fzf#install()]]
        }
        use 'junegunn/fzf.vim'
        use {
            'Shougo/denite.nvim',
            -- cmd = {'Denite'},
            run = [[:UpdateRemotePlugins]]
        }

        use {
            'tyru/caw.vim'
        }

        -- filer
        use {
            'Shougo/defx.nvim',
            requires = {
                {'kristijanhusak/defx-git'},
                {'kristijanhusak/defx-icons'}
            }
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = [[:TSUpdate]],
            requires = {
                {'p00f/nvim-ts-rainbow'}
            }
        }

        use 'tpope/vim-repeat'
        use 'cohama/lexima.vim'
        use 'tpope/vim-surround'
        use 'mattn/emmet-vim'
        use 'editorconfig/editorconfig-vim'
        use 'roxma/vim-paste-easy'
        use 'folke/which-key.nvim'

        use {
            'lfilho/cosco.vim',
            ft = {'php','rust','java','lua'}
        }

        use {
            'kana/vim-textobj-line',
            requires = {
                {'kana/vim-textobj-user'}
            }
        }

        -- markdown
        -- emmet

    end,
    config = {
        disable_command = true,
        display = {
            open_fn = require'packer.util'.float,
        },
        profile = {
            enable = true
        }
    }
}
