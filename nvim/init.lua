-- Basic configuration
require('plugins')
require('settings')
require('keybindings')
require('commands')
require('autocmds')

-- Plugin configuration
require('treesitter-conf')
require('nvim-cmp-conf')
require('command-center-conf')
require('indent-blankline-conf')
require('telescope-conf')
require('lualine-conf')
require('gitsigns-conf')
require('lsp-config-conf')
require('ultisnips-conf')

-- Coloscheme
vim.cmd.colorscheme('challenger_deep')

-- Go to last loc when opening a buffer
vim.cmd [[
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
]]

-- img-paste plugin
vim.cmd [[
    autocmd FileType markdown nmap <buffer><silent> <leader>xp :call mdip#MarkdownClipboardImage()<CR>
]]

vim.g.mdip_imgdir = 'imgs'
