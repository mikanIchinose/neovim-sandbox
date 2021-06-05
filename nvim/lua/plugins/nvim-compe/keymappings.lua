-- print'load plugins.lsp.nvim-compe.keymappings'

local utils = require'utils'

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return utils.t '<C-n>'
    elseif vim.fn.call('vsnip#available', {1}) == 1 then
        return utils.t '<Plug>(vsnip-expand-or-jump)'
    elseif check_back_space() then
        return utils.t '<Tab>'
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return utils.t '<C-p>'
    elseif vim.fn.call('vsnip#jumpable', {-1}) == 1 then
        return utils.t '<Plug>(vsnip-jump-prev)'
    else
        return utils.t '<S-Tab>'
    end
end

utils.set_keymap({
    i_expr = {
        {'<C-Space>', 'compe#complete()'},
        {'<CR>', 'compe#confirm(lexima#expand(\'<LT>CR>\', \'i\'))'},
        {'<Tab>', 'v:lua.tab_complete()'},
        {'<S-Tab>', 'v:lua.s_tab_complete()'},
    }
})
