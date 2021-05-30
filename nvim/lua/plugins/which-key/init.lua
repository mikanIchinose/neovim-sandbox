local wk = require'which-key'
wk.setup{
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = false,
            suggestions = 20,
        },
    },
    ignore_missing = false,
}

local map = {
    fzf = {
        search_file = {':Files<CR>', 'find file'},
        search_code = {':Rg<CR>', 'find code'},
        search_buffer = {':Buffers<CR>', 'find buffers'},
    },
    save = {
        current_buffer = {':update<CR>', 'save current buffer'},
        all_buffers = {':wall<CR>', 'save all buffers'},
    },
    insert_line = {
        below = {'o<ESC>', 'insert line below'},
        above = {'O<ESC>', 'insert line above'},
    },
    quit = {
        current_window = {':quit<CR>', 'close current window'},
        all_windows = {':qall<CR>', 'close all windows'},
    },
    turn_highlight_off = {':nohl<CR>', 'turn highlight off'},
    comment = {
        toggle_comment = {'<Plug>(caw:hatpos:toggle)', 'toggle comment'},
        hatposition = {'<Plug>(caw:hatpos:comment)', 'hatpos comment'},
        hatposition_uncomment = {'<Plug>(caw:hatpos:uncomment)', 'hatpos uncomment'},
        zeroposition = {'<Plug>(caw:zeropos:comment)', 'zeropos comment'},
        zeroposition_uncomment = {'<Plug>(caw:zeropos:uncomment)', 'zeropos uncomment'},
        dollarposition = {'<Plug>(caw:dollarpos:comment)', 'dollarpos comment'},
        dollarposition_uncomment = {'<Plug>(caw:dollarpos:uncomment)', 'dollarpos uncomment'},
        wrap = {'<Plug>(caw:wrap:comment)', 'wrap comment'},
        wrap_uncomment = {'<Plug>(caw:wrap:uncomment)', 'wrap uncomment'},
        below = {'<Plug>(caw:jump:comment-next)', 'comment below'},
        above = {'<Plug>(caw:jump:comment-prev)', 'comment above'},
    },
    -- dein = {
    -- },
    denite = {
        file = {':Denite -vertical-preview -preview-width=60 file/rec <CR>', 'file'},
        buffer = {':Denite buffer <CR>', 'buffer'},
        command = {':Denite command <CR>', 'command'},
    },
    split = {
        horizontal = {':split<CR>', 'horizontally'},
        vertical = {':vsplit<CR>', 'vertically'},
    }
}

-- nomal mode
wk.register(
    {
        ['<leader>'] = {
            ['|'] = map.split.vertical,
            ['-'] = map.split.horizontal,
            w = map.save.current_buffer,
            W = map.save.all_buffers,
            o = map.insert_line.above,
            O = map.insert_line.below,
            n = map.turn_highlight_off,
            q = map.quit.current_window,
            Q = map.quit.all_windows,
            c = {
                name = 'comment',
                c = map.comment.toggle_comment,
                i = map.comment.hatposition,
                ui = map.comment.hatposition_uncomment,
                I = map.comment.zeroposition,
                uI = map.comment.zeroposition_uncomment,
                a = map.comment.dollarposition,
                ua = map.comment.dollarposition_uncomment,
                w = map.comment.wrap,
                uw = map.comment.wrap_uncomment,
                n = map.comment.below,
                p = map.comment.above,
            },
            f = {
                name = 'find something',
                f = map.denite.file,
                r = map.fzf.search_code,
                b = map.denite.buffer,
                c = map.denite.command,
            },
        },
        gcc = map.comment.toggle_comment,
    },
    {
        mode = 'n'
    }
)

-- visual mode
wk.register(
    {
        gcc = map.comment.toggle_comment,
    },
    {mode = 'v'}
)
