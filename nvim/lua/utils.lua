-- オブジェクトをきれいに出力する関数
function _G.dump(...)
    local object = vim.tbl_map(vim.inspect, {...})
    print(unpack(object))
end

local utils = {}

-- keymapping

local function map(mode, key, result, opts)
    opts = vim.tbl_extend(
        'keep',
        opts or {},
        {
            noremap = true,
            silent = true,
            expr = false,
        }
    )
    vim.api.nvim_set_keymap(mode, key, result, opts)
end

-- inoremap silent
-- imap{key = '<C-h>', result = '<C-w>h'}
function utils.imap(table)
    map('i', table.key, table.result)
end

-- inoremap silent expr
-- imap_expr{key = '<C-h>', result = '<C-w>h'}
function utils.imap_expr(table)
    map('i', table.key, table.result, {expr = true})
end

-- nnoremap silent
-- nmap{key = '<C-h>', result = '<C-w>h'}
function utils.nmap(table)
    map('n', table.key, table.result)
end

-- nnoremap silent expr
-- nmap{key = '<C-h>', result = '<C-w>h'}
function utils.nmap_expr(table)
    map('n', table.key, table.result, {expr = true})
end

function utils.nmap_expr_buf(table)
    vim.api.nvim_buf_set_keymap(0, 'n', table.key, table.result, {silent = true, expr = true})
end

-- termcodeやvim key codeをエスケープするラッパ関数
-- @param str termcode
function utils.t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- @param keymappings
-- {
--     n = {},
--     n_expr = {},
--     n_expr_buf = {},
--     i = {},
--     i_expr = {}
-- }
function utils.set_keymap(keymappings)
    for mode, map_lists in pairs(keymappings) do
        for _, map_list in pairs(map_lists) do
            local keymap = {key = map_list[1], result = map_list[2]}
            if mode == 'n' then
                utils.nmap(keymap)
            elseif mode == 'n_expr' then
                utils.nmap_expr(keymap)
            elseif mode == 'n_expr_buf' then
                utils.nmap_expr_buf(keymap)
            elseif mode == 'i' then
                utils.imap(keymap)
            elseif mode == 'i_expr' then
                utils.imap_expr(keymap)
            elseif mode == 'v' then
                print 'there is no matching'
            elseif mode == 'v_expr' then
                print 'there is no matching'
            elseif mode == 'c' then
                print 'there is no matching'
            elseif mode == 'c_expr' then
                print 'there is no matching'
            else
                print 'there is no matching'
            end
        end
    end
end

return utils
