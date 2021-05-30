local utils = require'utils'

-- global variables
O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = 'lunar',
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    shell = 'bash',
}

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
HOME = vim.env.HOME

-- alias
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd
local fn = vim.fn

-- plugins
local install_path = DATA_PATH .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    cmd 'packadd packer.nvim'
end

--vim.cmd "autocmd BufWritePost monolith.lua PackerCompile"

require'packer'.startup{
    function(use)
        use 'wbthomason/packer.nvim'

        -- color scheme
        use {
            'morhetz/gruvbox',
            config = function()
                vim.o.background = 'dark'
                vim.cmd[[
                colorscheme gruvbox
                ]]
            end
        }

        -- lsp
        use {
            'neovim/nvim-lspconfig',
            'kabouzeid/nvim-lspinstall',
            'hrsh7th/nvim-compe',
            'hrsh7th/vim-vsnip',
        }

        -- fuzzy finder

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

-- regular settings
cmd('syntax on') -- syntax highlighting
cmd('filetype plugin indent on') -- filetype autocmd

o.compatible = false -- nocompatible
o.encoding = 'utf-8'
o.mouse = 'a' -- enable mouse
o.t_Co = '256' -- 256bit color
o.showmode = false -- don't show mode
o.showcmd = true -- show command

-- Enhanced-mode of Command-line-mode
-- C-Y: 補完終了
-- C-E: 補完開始前に戻す
-- <Left>, <Right>: 前後の候補を移動
-- <Up>: ファイル名補完: 親ディレクトリへ
-- <Down>: ファイル名補完: ディレクトリの中に入る
o.wildmenu = true
o.wildmode = 'full'

o.hidden = true -- you can open additional buffer if current buffer isn't saved
-- タイトル
o.title = true -- use title
o.titlestring = 'nvim %t'
o.hlsearch = true -- incremental search

-- @search pattern, you use
-- uppercase + lowercase -> case-sensitive
-- only lowercase -> ignore case
o.ignorecase = true -- 検索にて大文字小文字を区別しない
o.smartcase = true -- 大文字を使ったときはケースセンシティブにする

o.showtabline = 2 -- タブを常に表示
o.cmdheight = 2 -- more line of command for plugins
o.helplang = 'ja' -- japanese help page

wo.number = true -- show column number
wo.numberwidth = 5 -- width column of number
wo.relativenumber = true -- show relatibe number
wo.signcolumn = 'yes' -- signcolumn alway enable
wo.cursorline = true -- highlight cursor line

-- tab and space
cmd [[
set tabstop=4 " 1tab = 4space
set shiftwidth=4 "
set expandtab " exchange tab to space
set smartindent " detect indent
set smarttab "
]]

o.updatetime = 300
o.timeoutlen = 700

-- バックアップ・スワップ系
o.backup = false -- backupfile gone
o.writebackup = false --
o.undofile = true -- undofile generate
o.swapfile = false -- swapfile gone
o.backupdir = '/tmp/'
o.directory = '/tmp/'
o.undodir = '/tmp/'

-- clipboard
o.clipboard = 'unnamedplus' -- yank to clipboard


cmd('hi Comment ctermfg=gray') -- -> gray comment <-

-- cmd('set shortmess+=c')
-- o.shortmess = o.shortmess .. 'c' -- hide ins-completion-menu

o.inccommand = 'split' -- incremental replacement

o.guifont = 'FiraCode Nerd Font 11'

--keymappings
-- leaderをスペースに変更
vim.g.mapleader = ' '

local keymappings = {
    --[[
    example
    mode = {
        {key, result}
    }
    --]]
    n = {
        -- quick save
        {'<leader>w',':update<CR>'},
        {'<leader>W',':wall<CR>'},

        -- remove search highlight
        {'<leader>n',':nohl<CR>'},

        -- insert empty line
        {'<leader>o', 'o<ESC>'},
        {'<leader>O', 'O<ESC>'},

        -- window move
        {'<C-h>', '<C-w>h'},
        {'<C-j>', '<C-w>j'},
        {'<C-k>', '<C-w>k'},
        {'<C-l>', '<C-w>l'},

        -- lsp
        {'K','<cmd>lua vim.lsp.buf.hover()<CR>'},
        {'gd','<cmd>lua vim.lsp.buf.declaration()<CR>'},
    },
    n_expr = {},
    n_expr_buf = {},
    i = {},
    i_expr = {},
}

utils.set_keymap(keymappings)

-- ヘルプバッファをqで消す
vim.cmd('autocmd FileType help nnoremap <buffer> q <C-w>c')

-- lsp
fn.sign_define(
    "LspDiagnosticsSignError",
    {
        texthl = "LspDiagnosticsSignError", 
        text = "", 
        numhl = "LspDiagnosticsSignError"
    }
)

fn.sign_define(
    "LspDiagnosticsSignWarning",
    {
        texthl = "LspDiagnosticsSignWarning", 
        text = "", 
        numhl = "LspDiagnosticsSignWarning"
    }
)

fn.sign_define(
    "LspDiagnosticsSignHint",
    {
        texthl = "LspDiagnosticsSignHint", 
        text = "", 
        numhl = "LspDiagnosticsSignHint"
    }
)

fn.sign_define(
    "LspDiagnosticsSignInformation",
    {
        texthl = "LspDiagnosticsSignInformation", 
        text = "", 
        numhl = "LspDiagnosticsSignInformation"
    }
)

require'lspinstall'.setup()

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,{
    virtual_text = {
        prefix = "",
        spacing = 0,
    },
        signs=true,
        underline=true,
    }
)

vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)",
}
local function documentHighlight(client, bufnr)
    if client.resolved_capabilities.document_highlight then
        vim.cmd(
            [[
              hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
              hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
              hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]],
            false
        )
        end
end

local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    documentHighlight(client, bufnr)
end

function lsp_config.install_lsp_if_not_installed(lang)
    local root_path = vim.fn.stdpath('data') .. '/lspinstall/' .. lang
    if vim.fn.empty(vim.fn.glob(root_path)) > 0 then
    require'lspinstall'.install_server(lang)
    end
end

-- lua settings
lsp_config.install_lsp_if_not_installed('lua')

local sumneko_root_path = DATA_PATH .. '/lspinstall/lua'
local sumneko_binary = sumneko_root_path .. '/sumneko-lua-language-server'
local library = {}
local path = vim.split(package.path, ';')

table.insert(path, 'lua/?.lua')
table.insert(path, 'lua/?/init.lua')

local function add_library(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
        p = vim.loop.fs_realpath(p)
        if p then
            library[p] = true
        end
    end
end

add_library('$VIMRUNTIME')
add_library('$HOME/.config/nvim')
-- add_library('$HOME/.local/share/nvim/site/pack/packer/opt/*')
add_library('$HOME/.local/share/nvim/site/pack/packer/start/*')
add_library '$HOME/.cache/dein/repos/github.com/*/*'

require 'lspconfig'.sumneko_lua.setup{
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    on_attach = lsp_config.cmmon_on_attach,
    filetypes = {'lua'},
    settings = {
        Lua = {
        runtime = {
            version = 'LuaJIT',
            path = path
        },
        completion = { callSnippet = 'Both' },
        diagnostics = {
            globals = {'vim'}
        },
        workspace = {
            library = library,
            maxPreload = 10000,
            preloadFileSize = 50000
        },
        -- telemetry = { enable = false }
        }
    }
}
