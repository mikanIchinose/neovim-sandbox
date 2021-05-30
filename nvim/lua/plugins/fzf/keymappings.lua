-- print('load plugins.fuzzy_finder.keymappings')

local utils = require('utils')

utils.set_keymap({
    n = {
        {'<C-f>', ':Files<CR>'},
        {'<C-b>', ':Buffers<CR>'},
    },
})
