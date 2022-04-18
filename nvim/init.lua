-- Basic configuration
require('plugins')
require('settings')
require('keybindings')
require('commands')

-- Plugin configuration
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

-- Coloscheme
vim.cmd [[
    colorscheme challenger_deep
]]
