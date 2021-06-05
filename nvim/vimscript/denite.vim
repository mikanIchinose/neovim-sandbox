" if executable('rg')
    " call denite#custom#var('file/rec','command',
        "\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
    " call denite#custom#var('grep', {
        "\ 'command': ['rg', '--threads', '1'],
        "\ 'recursive_opts': [],
        "\ 'final_opts': [],
        "\ 'separator': ['--'],
        "\ 'default_opts': ['--smart-case', '--vimgrep', '--no-heading'],
        "\ })
" endif
" 
" call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      "\ [ '.git/', '.ropeproject/', '__pycache__/',
      "\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> a
    \ denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> N
    \ denite#do_map('do_action', 'new')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> r
    \ denite#do_map('do_action', 'quickfix')
    nnoremap <silent><buffer><expr> s
    \ denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> v
    \ denite#do_map('do_action', 'vsplit')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change matchers.
" call denite#custom#source(
"\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
" call denite#custom#source(
"\ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
" call denite#custom#source(
"\ 'file/rec', 'sorters', ['sorter/sublime'])

" Change default action.
" call denite#custom#kind('file', 'default_action', 'split')

" Add custom menus
let s:menus = {}

" let s:menus.zsh = {
    "\ 'description': 'Edit your import zsh configuration'
    "\ }
" let s:menus.zsh.file_candidates = [
    "\ ['zshrc', '~/.config/zsh/.zshrc'],
    "\ ['zshenv', '~/.zshenv'],
    "\ ]

" let s:menus.my_commands = {
    "\ 'description': 'Example commands'
    "\ }
" let s:menus.my_commands.command_candidates = [
    "\ ['Split the window', 'vnew'],
    "\ ['Open zsh menu', 'Denite menu:zsh'],
    "\ ['Format code', 'FormatCode', 'go,python'],
    "\ ]

let s:menus.nvim = {
    \ 'description': 'Edit your nvim configuration'
    \ }
let s:menus.nvim.file_candidates = [
    \ ['init', '~/.config/nvim/init.lua'],
    \ ['lua', '~/.config/nvim/lua/settings.lua'],
    \ ]

call denite#custom#var('menu', 'menus', s:menus)

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

" Define alias
" call denite#custom#alias('source', 'file/rec/git', 'file/rec')
" call denite#custom#var('file/rec/git', 'command',
      "\ ['git', 'ls-files', '-co', '--exclude-standard'])
" 
" call denite#custom#alias('source', 'file/rec/py', 'file/rec')
" call denite#custom#var('file/rec/py', 'command',
"\ ['scantree.py', '--path', ':directory'])

" Change ignore_globs
" call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      "\ [ '.git/', '.ropeproject/', '__pycache__/',
      "\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Custom action
" Note: denite#custom#action() with lambda parameter is only available
"       in NeoVim; not supported in Vim8.
" call denite#custom#action('file', 'test',
      "\ {context -> execute('let g:foo = 1')})
" call denite#custom#action('file', 'test2',
      "\ {context -> denite#do_action(
      "\  context, 'open', context['targets'])})
" Source specific action
" call denite#custom#action('source/file', 'test',
      "\ {context -> execute('let g:bar = 1')})
