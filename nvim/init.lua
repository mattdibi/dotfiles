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

vim.cmd [[
    colorscheme challenger_deep
]]
