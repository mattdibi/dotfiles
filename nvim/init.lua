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

-- Coloscheme
vim.cmd [[
    colorscheme challenger_deep
]]

vim.cmd [[
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/custom_snippets/']
    let g:UltiSnipsEditSplit="vertical"
]]
