" Basic configuration
lua require('plugins')
lua require('settings')
lua require('keybindings')
lua require('commands')

" Plugin configuration
lua require('indent-blankline-conf')
lua require('telescope-conf')
lua require('lualine-conf')
lua require('gitsigns-conf')

colorscheme challenger_deep

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jump to alternate C++ file
command A  e  %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,
command AV vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,
