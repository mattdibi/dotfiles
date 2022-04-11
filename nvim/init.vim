lua require('plugins')
lua require('settings')
lua require('keybindings')
lua require('indent-blankline')
lua require('telescope-conf')

if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme challenger_deep

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => KEYBINDINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Function row mode toggle hotkeys
" F3: Toggle list char
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
nnoremap <F3> :set list!<CR>

" Open terminal in split
command! -nargs=* Sterm split | terminal <args>
command! -nargs=* Vterm vsplit | terminal <args>
