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
    save = {
        current_buffer = {':update<CR>', 'save current buffer'},
        all_buffers = {':wall<CR>', 'save all buffers'},
    },
    quit = {
        current_window = {':quit<CR>', 'close current window'},
        all_windows = {':qall<CR>', 'close all windows'},
    },
    save_and_quit = {':wq<CR>', 'save and quit'},
    insert_line = {
        below = {'O<ESC>', 'insert line below'},
        above = {'o<ESC>', 'insert line above'},
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
    fzf = {
        file   = {':Files<CR>',   'file'},
        code   = {':Rg<CR>',      'code'},
        buffer = {':Buffers<CR>', 'buffer'},
    },
    denite = {
        file    = {':Denite -vertical-preview -preview-width=60 file/rec <CR>', 'file'},
        buffer  = {':Denite buffer <CR>', 'buffer'},
        command = {':Denite command <CR>', 'command'},
        defx    = {':Denite defx/drive <CR>', 'drive'},
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
            w = {
                name = '+save',
                w = map.save.current_buffer,
                a = map.save.all_buffers,
                q = map.save_and_quit,
            },
            q = {
                name = '+quit',
                q = map.quit.current_window,
                a = map.quit.all_windows,
            },
            o = map.insert_line.above,
            O = map.insert_line.below,
            n = map.turn_highlight_off,
            c = {
                name = '+comment',
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
                name = '+find',
                f = map.fzf.file,
                r = map.fzf.code,
                b = map.fzf.buffer,
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
