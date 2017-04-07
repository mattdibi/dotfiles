" Pathogen
execute pathogen#infect()

" Common
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
try
    colorscheme space-vim-dark 
catch
endtry

set number
set relativenumber
set showcmd
set showmatch
set cmdheight=2
set cursorline 

" Search
set ignorecase
set smartcase

syntax enable

"Formatting
set autoindent        " Auto indentation. To paste use paste mode: :set paste
set wrap              " Wrap long lines
set shiftwidth=4      " Use indents of 4 spaces
set expandtab         " Tabs are spaces, not tabs
set tabstop=4         " An indentation every four columns
set nojoinspaces      " Prevents inserting two spaces after punctuation on a join (J)
set splitright        " Puts new vsplit windows to the right of the current
set splitbelow        " Puts new split windows to the bottom of the current

" Airline
set laststatus=2

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Gitgutter
set updatetime=250

" Custom macros
inoremap ;f for(int i = 0; i < size; i++) {<Enter><Enter>}<Esc>kci}
inoremap ;i if() {<Enter><Enter>}<Esc>kkf(ci)
autocmd Filetype cpp inoremap ;m int main(int argc, char *argv[]) {<Enter><Enter><Tab>return 0;<Enter><Esc><<i}<Esc>kkko<Tab>

