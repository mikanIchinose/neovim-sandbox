print 'load keymappings for defx'

local keymappings = {
    n = {
        {'<C-n>', ':Defx -ignored-files=".git,node_modules,vendor" <CR>'}
    },
    n_expr_buf = {
        {'<CR>', 'defx#do_action("open")'},
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
        {'C', "defx#do_action('toggle_columns', mark:indent:icon:filename:type:size:time)"},
        {'S', "defx#do_action('toggle_sort', 'time')"},
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
    },
}

require 'utils'.set_keymap(keymappings)
