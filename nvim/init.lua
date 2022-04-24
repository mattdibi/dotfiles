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
vim.cmd [[
    colorscheme challenger_deep
]]
