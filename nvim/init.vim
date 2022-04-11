" Basic configuration
lua require('plugins')
lua require('settings')
lua require('keybindings')

" Plugin configuration
lua require('indent-blankline-conf')
lua require('telescope-conf')
lua require('lualine-conf')

if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme challenger_deep

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jump to alternate C++ file
command A  e  %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,
command AV vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,

" Open terminal in split
command! -nargs=* Sterm split | terminal <args>
command! -nargs=* Vterm vsplit | terminal <args>
