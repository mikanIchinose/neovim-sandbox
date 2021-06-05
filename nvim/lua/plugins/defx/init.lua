local g = vim.g
-- appearance
vim.cmd[[
autocmd FileType defx setlocal nonumber norelativenumber nocursorline
autocmd FileType defx setlocal signcolumn="no"
]]
-- vim.cmd[[
-- augroup defx
    -- autocmd!
    -- autocmd FileType defx setlocal nonumber norelativenumber nocursorline
    -- autocmd FileType defx setlocal signcolumn="no"
-- augroup END
-- ]]
vim.call('defx#custom#option', '_', {
    columns = 'mark:indent:icons:filename:type:size',
    root_marker = ' ',
    winwidth = 50,
    split = 'vertical',
    direction = 'botright',
    show_ignored_files = 0,
    toggle = 1,
    resume = 1,
})
vim.call('defx#custom#column', 'filename', {
    min_width = 0,
    max_width = 20,
})
vim.call('defx#custom#column', 'icon', {
    opened_icon = ''
})
vim.call('defx#custom#option','_','drives',{
    vim.fn.expand('~/.config')
})

-- keybind
local n_expr_buf = {
    {'<CR>', 'defx#do_action("drop")'},
    {'c', 'defx#do_action("copy")'},
    {'m', "defx#do_action('move')"},
    {'p', "defx#do_action('paste')"},
    {'l', "defx#do_action('open')"},
    {'E', "defx#do_action('open', 'vsplit')"},
    {'P', "defx#do_action('preview')"},
    {'o', "defx#do_action('open_tree', 'toggle')"},
    {'K', "defx#do_action('new_directory')"},
    {'N', "defx#do_action('new_file')"},
    {'M', "defx#do_action('new_multiple_files')"},
    -- {'C', "defx#do_action('toggle_columns', mark:indent:icon:filename:type:size:time)"},
    -- {'S', "defx#do_action('toggle_sort', 'time')"},
    {'d', "defx#do_action('remove')"},
    {'r', "defx#do_action('rename')"},
    {'!', "defx#do_action('execute_command')"},
    {'x', "defx#do_action('execute_system')"},
    {'yy', "defx#do_action('yank_path')"},
    {'.', "defx#do_action('toggle_ignored_files')"},
    {';', "defx#do_action('repeat')"},
    {'h', "defx#do_action('cd', ['..'])"},
    {'~', "defx#do_action('cd')"},
    {'q', "defx#do_action('quit')"},
    {'<C-n>', "defx#do_action('quit')"},
    -- {'<Space>', "defx#do_action('toggle_select') . 'j'"},
    {'*', "defx#do_action('toggle_select_all')"},
    {'j', "line('.') == line('$') ? 'gg' : 'j'"},
    {'k', "line('.') == 1 ? 'G' : 'k'"},
    {'cd', "defx#do_action('change_vim_cwd')"},
}

-- set global function
_G.defx_keymapping = function ()
    require 'utils'.set_keymap({n_expr_buf = n_expr_buf})
end

-- call keybind
vim.cmd[[
autocmd FileType defx call v:lua.defx_keymapping()
]]

local keymappings = {
    n = {
        {'<C-n>', ':Defx -ignored-files=".git,node_modules,vendor" <CR>'}
    }
}

require 'utils'.set_keymap(keymappings)

-- icon
-- local icons = require 'nvim-web-devicons'.get_icons()
g.defx_icons_enable_syntax_highlight = 1
g.defx_icons_column_length = 2
g.defx_icons_directory_icon = ''
g.defx_icons_mark_icon = '*'
g.defx_icons_copy_icon = ''
g.defx_icons_move_icon = ''
g.defx_icons_parent_icon = ''
g.defx_icons_default_icon = ''
g.defx_icons_directory_symlink_icon = ''
