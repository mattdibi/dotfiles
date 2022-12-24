-- Basic configuration
require('mattdibi.packer')
require('mattdibi.settings')
require('mattdibi.remap')
require('mattdibi.commands')
require('mattdibi.autocmds')

-- Coloscheme
vim.cmd.colorscheme('challenger_deep')

-- Go to last loc when opening a buffer
vim.cmd [[
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]]
