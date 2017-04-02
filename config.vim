" Pathogen
execute pathogen#infect()

" Common
colo space-vim-dark 

set number
set showcmd
set showmatch
set autoindent

syntax enable

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Gitgutter
set updatetime=250

