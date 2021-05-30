local g = vim.g
local cmd = vim.cmd

g.rbpt_colorpairs = {
    {'brown', 'RoyamBlue3'},
    {'Darkblue', 'SeaGreen3'},
    {'darkgray', 'DarkOrchid3'},
    {'darkgreen', 'firebrick3'},
    {'darkcyan',    'RoyalBlue3'},
    {'darkred',     'SeaGreen3'},
    {'darkmagenta', 'DarkOrchid3'},
    {'brown',       'firebrick3'},
    {'gray',        'RoyalBlue3'},
    {'black',       'SeaGreen3'},
    {'darkmagenta', 'DarkOrchid3'},
    {'Darkblue',    'firebrick3'},
    {'darkgreen',   'RoyalBlue3'},
    {'darkcyan',    'SeaGreen3'},
    {'darkred',     'DarkOrchid3'},
    {'red',         'firebrick3'}
}

g.rbpt_max = 16
g.rbpt_loadcmd_toggle = 0

cmd [[au VimEnter * RainbowParenthesesToggle]]
cmd [[au Syntax * RainbowParenthesesLoadRound]]
cmd [[au Syntax * RainbowParenthesesLoadSquare]]
cmd [[au Syntax * RainbowParenthesesLoadBraces]]
