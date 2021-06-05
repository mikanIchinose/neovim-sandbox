require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    highlight = {
        enable = true,
        disable = {'lua'}
    },
    rainbow = {
        enable = true,
        exteded_mode = true,
        max_file_lines = 1000,
    },
    -- indent = {
        -- enable = true
    -- }
}
