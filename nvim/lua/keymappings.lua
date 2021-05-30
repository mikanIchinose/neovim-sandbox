--[[
Command \ Mode | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
[nore]map      |  @   |  -  |  -  |  @  |  @  |  @  |  -   |  -   |
n[nore]map     |  @   |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
[nore]map!     |  -   |  @  |  @  |  -  |  -  |  -  |  -   |  -   |
i[nore]map     |  -   |  @  |  -  |  -  |  -  |  -  |  -   |  -   |
c[nore]map     |  -   |  -  |  @  |  -  |  -  |  -  |  -   |  -   |
v[nore]map     |  -   |  -  |  -  |  @  |  @  |  -  |  -   |  -   |
x[nore]map     |  -   |  -  |  -  |  @  |  -  |  -  |  -   |  -   |
s[nore]map     |  -   |  -  |  -  |  -  |  @  |  -  |  -   |  -   |
o[nore]map     |  -   |  -  |  -  |  -  |  -  |  @  |  -   |  -   |
t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  |  @   |  -   |
l[nore]map     |  -   |  @  |  @  |  -  |  -  |  -  |  -   |  @   |
--]]

local utils = require'utils'

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
        -- {'<leader>w',':update<CR>'},
        -- {'<leader>W',':wall<CR>'},

        -- remove search highlight
        -- {'<leader>n',':nohl<CR>'},

        -- insert empty line
        -- {'<leader>o', 'o<ESC>'},
        -- {'<leader>O', 'O<ESC>'},

        -- window move
        {'<C-h>', '<C-w>h'},
        {'<C-j>', '<C-w>j'},
        {'<C-k>', '<C-w>k'},
        {'<C-l>', '<C-w>l'},

        -- lsp
        {'K','<cmd>lua vim.lsp.buf.hover()<CR>'},
        {'gd','<cmd>lua vim.lsp.buf.declaration()<CR>'},

        {'H', '^'},
        {'L', '$'},

        -- resize window
        {'<S-Up>', '2<C-w>+'},
        {'<S-Down>', '2<C-w>-'},
        {'<S-Left>', '10<C-w><'},
        {'<S-Right>', '10<C-w>>'},
    },
    n_expr = {},
    n_expr_buf = {},
    i = {
        {'jj', '<Esc>'},
        {'<C-d>', '<BS>'},
        {'<C-h>', '<Left>'},
        {'<C-l>', '<Right>'},
        {'<C-k>', '<Up>'},
        {'<C-j>', '<Down>'},
        {'<C-a>', '<Home>'},
        {'<C-e>', '<End>'},
    },
    i_expr = {},
}

utils.set_keymap(keymappings)

-- ヘルプバッファをqで消す
vim.cmd('autocmd FileType help nnoremap <buffer> q <C-w>c')
