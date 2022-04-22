-- Basic configuration
require('plugins')
require('settings')
require('keybindings')
require('commands')

-- Plugin configuration
require('treesitter-conf')
require('indent-blankline-conf')
require('telescope-conf')
require('lualine-conf')
require('gitsigns-conf')

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({higroup="Visual"})
    end,
    group = highlight_group,
    pattern = '*',
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufRead", {
    command = [[call setpos(".", getpos("'\""))]]
})

-- Terminal visual tweaks
local termGrp = vim.api.nvim_create_augroup("terminal_job", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    command = "startinsert",
    group = termGrp,
})
vim.api.nvim_create_autocmd("TermOpen", {
    command = "setlocal listchars= nonumber norelativenumber",
    group = termGrp,
})

-- Coloscheme
vim.cmd [[
    colorscheme challenger_deep
]]
