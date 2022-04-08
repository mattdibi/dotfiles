lua require('plugins')

if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme challenger_deep

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set undofile          " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir " Undo history directory

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
