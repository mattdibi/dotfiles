lua require('plugins')
lua require('settings')
lua require('indent-blankline')
lua require('telescope-conf')

if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme challenger_deep

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: When 0.7.0 is available swith to lua

" <Space> and \ are now leader keys, this way
" something will pop up in the showcmd corner.
map <Space> <leader>

" This mapping makes Y work from the cursor to the end of line
" (which is more logical, but not Vi-compatible).
map Y y$

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Smart resize
nnoremap <Up>    :resize +5<CR>
nnoremap <Down>  :resize -5<CR>
nnoremap <Left>  :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Function row mode toggle hotkeys
" F3: Toggle list char
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
nnoremap <F3> :set list!<CR>

" Smart terminal navigation
tnoremap <Esc> <C-\><C-n>
" Send <Esc> to the underlying program in terminal mode
" mnemonic: verbatim esc
tnoremap <C-v><Esc> <Esc>
" Open terminal in split
command! -nargs=* Sterm split | terminal <args>
command! -nargs=* Vterm vsplit | terminal <args>

" Telescope configuration
nnoremap <C-p>      <cmd>lua require('telescope-conf').project_files()<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
