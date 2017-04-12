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
set nowrap            " Don't wrap long lines
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

" C++ main
autocmd Filetype cpp inoremap ;m int main(int argc, char *argv[]) {<Enter><Enter><Tab>return 0;<Enter><Esc><<i}<Esc>kkko<Tab>

" Java printline
autocmd Filetype java inoremap ;p System.out.println();<Esc>hci) 
" Java exception
autocmd Filetype java inoremap ;e try {<Enter><Enter>} catch (Exception e) {<Enter>System.out.println( e );<Esc>>>o}<Esc><<
" Java automatic generation getters and setters
" Note: you have to write //getters and // setters comments as they are used to place the getters and setters
autocmd Filetype java map ;gs mawv/ <CR>"ty/ <CR>wvwh"ny/getters<CR>$a<CR><CR><Esc>xxapublic <Esc>"tpa<Esc>"npbiget<Esc>l~ea()<CR>{<CR><Tab>return <Esc>"npa;<CR>}<Esc>=<CR><Esc>/setters<CR>$a<CR><CR><Esc>xxapublic void <Esc>"npbiset<Esc>l~ea(<Esc>"tpa <Esc>"npa)<CR>{<CR><Tab>this.<Esc>"npa= <Esc>"npa;<CR>}<Esc>=<CR>`ak

