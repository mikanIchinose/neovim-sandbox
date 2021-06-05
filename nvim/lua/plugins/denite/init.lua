if vim.fn.executable('rg') then
    -- file/recにを使う
    -- vim.call(
        -- 'denite#custom#var','file/rec','command',
        -- {'rg','--files','--glob','!.git','--color','never'}
    -- )
    -- grepにripgrepを使う
    vim.call(
        'denite#custom#var','grep',
        {
            command = {'rg','--threads','1'},
            recursive_opts = {},
            final_opts = {},
            separator = {'--'},
            default_opts = {'--smart-case', '--vimgrep', '--no-heading'},
        }
    )
end

-- 無視するパターン
vim.call('denite#custom#filter','matcher/ignore_globs', 'ignore_globs',
    {'.git/','__pycache__/','venv/','images','*.min.*','img/','fonts/','node_modules/'})
