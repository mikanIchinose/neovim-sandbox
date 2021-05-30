-- alias
-- local g = vim.g
local o = vim.o
local wo = vim.wo
local cmd = vim.cmd

cmd('syntax on') -- syntax highlighting
cmd('filetype plugin indent on') -- filetype autocmd

o.compatible = false -- nocompatible
o.encoding = 'utf-8'
-- o.mouse = 'a' -- enable mouse
o.showmode = true -- don't show mode
o.showcmd = true -- show command

-- Enhanced-mode of Command-line-mode
-- C-Y: 補完終了
-- C-E: 補完開始前に戻す
-- <Left>, <Right>: 前後の候補を移動
-- <Up>: ファイル名補完: 親ディレクトリへ
-- <Down>: ファイル名補完: ディレクトリの中に入る
o.wildmenu = true
o.wildmode = 'full'

o.hidden = true -- you can open additional buffer if current buffer isn't saved
-- タイトル
o.title = true -- use title
o.titlestring = 'nvim %t'
o.hlsearch = true -- incremental search

-- @search pattern, you use
-- uppercase + lowercase -> case-sensitive
-- only lowercase -> ignore case
o.ignorecase = true -- 検索にて大文字小文字を区別しない
o.smartcase = true -- 大文字を使ったときはケースセンシティブにする

o.showtabline = 2 -- タブを常に表示
o.cmdheight = 2 -- more line of command for plugins
o.helplang = 'ja' -- japanese help page

wo.number = true -- show column number
wo.numberwidth = 5 -- width column of number
wo.relativenumber = true -- show relatibe number
wo.signcolumn = 'yes' -- signcolumn alway enable
wo.cursorline = true -- highlight cursor line

-- tab and space
cmd [[
set tabstop=4 " 1tab = 4space
set shiftwidth=4 "
set expandtab " exchange tab to space
set smartindent " detect indent
set smarttab "
]]

o.updatetime = 300
o.timeoutlen = 200

-- バックアップ・スワップ系
o.backup = false -- backupfile gone
o.writebackup = false --
o.undofile = true -- undofile generate
o.swapfile = false -- swapfile gone
o.backupdir = '/tmp/'
o.directory = '/tmp/'
o.undodir = '/tmp/'

-- clipboard
o.clipboard = 'unnamedplus' -- yank to clipboard


cmd('hi Comment ctermfg=gray') -- -> gray comment <-

-- cmd('set shortmess+=c')
o.shortmess = o.shortmess .. 'c' -- hide ins-completion-menu

o.inccommand = 'split' -- incremental replacement

-- o.guifont = 'FiraCode Nerd Font 11'
