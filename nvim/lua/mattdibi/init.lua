-- Basic configuration
require('mattdibi.init_lazy')
require('mattdibi.settings')
require('mattdibi.remap')
require('mattdibi.autocmds')

-- Go to last loc when opening a buffer
vim.cmd [[
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]]
