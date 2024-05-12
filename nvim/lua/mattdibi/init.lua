-- Basic configuration
require('mattdibi.packer')
require('mattdibi.settings')
require('mattdibi.remap')
require('mattdibi.commands')
require('mattdibi.autocmds')

-- Go to last loc when opening a buffer
vim.cmd [[
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]]

vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger='<tab>'
vim.g.UltiSnipsJumpBackwardTrigger='<s-tab>'
vim.g.UltiSnipsSnippetDirectories={ os.getenv("HOME") ..'/.config/nvim/custom_snippets/'}
vim.g.UltiSnipsEditSplit='vertical'
