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

" <Space> and \ are now leader keys, this way
" something will pop up in the showcmd corner.
map <Space> <leader>

" Function row mode toggle hotkeys
" F3: Toggle list char
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
nnoremap <F3> :set list!<CR>

" Open terminal in split
command! -nargs=* Sterm split | terminal <args>
command! -nargs=* Vterm vsplit | terminal <args>

" Telescope configuration
nnoremap <C-p>      <cmd>lua require('telescope-conf').project_files()<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
