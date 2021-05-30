if executable('rg')
    call denite#custom#var('file/rec','command',
        \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
    call denite#custom#var('grep', {
        \ 'command': ['rg', '--threads', '1'],
        \ 'recursive_opts': [],
        \ 'final_opts': [],
        \ 'separator': ['--'],
        \ 'default_opts': ['--smart-case', '--vimgrep', '--no-heading'],
        \ })
endif

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
