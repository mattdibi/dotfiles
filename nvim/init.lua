-- Basic configuration
require('plugins')
require('settings')
require('keybindings')
require('commands')
require('autocmds')

-- Plugin configuration
require('treesitter-conf')
require('indent-blankline-conf')
require('telescope-conf')
require('lualine-conf')
require('gitsigns-conf')

-- Coloscheme
vim.cmd [[
    colorscheme challenger_deep
]]
