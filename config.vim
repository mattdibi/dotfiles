" Pathogen
execute pathogen#infect()

" Plugin load
filetype plugin on

" Colorscheme
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
try
    colorscheme space-vim-dark 
catch
endtry

" Common
syntax enable
set noswapfile        " Do not create swap files
set number
set relativenumber
set showcmd
set showmatch
set cmdheight=1       " Command line height
set cursorline 

set autoread          " Autoload file changes. You can undo by pressing u.
set wildmenu          " Visual autocomplete for command menu
set laststatus=2      " Always diplay status bar
set updatetime=250    " Update time 250ms

set backspace=indent,eol,start " Backspace through lines

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Search
set ignorecase
set smartcase
set incsearch         " Start searching before pressing enter
set nows              " Once hitting the search bottom it stops instead of restarting from the first match

" Center the display line after searches.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"Formatting
set autoindent        " Auto indentation. To paste use paste mode: :set paste
set wrap              " Wrap long lines
set shiftwidth=4      " Use indents of 4 spaces
set expandtab         " Tabs are spaces, not tabs
set tabstop=4         " An indentation every four columns
set nojoinspaces      " Prevents inserting two spaces after punctuation on a join (J)
set splitright        " Puts new vsplit windows to the right of the current
set splitbelow        " Puts new split windows to the bottom of the current

"Display all characters (use F3 to toggle)
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<

"Quick save
map <Esc><Esc> :w<CR>

" Function row mode toggle hotkeys
" Toggle paste mode using F5 key
set pastetoggle=<F5> 
" Plugins settings
autocmd Filetype tex nnoremap <F4> :LatexTOCToggle<CR>
" Toggle list char using F3 key
nnoremap <F3> :set list!<CR>
" Toggle spell checker using F2 key
nnoremap <F2> :set spell!<CR>

" Custom 'macros'
" Common
inoremap ;f for(int i = 0; i < size; i++) {<Enter>}<Esc>ko<Tab>
inoremap ;i if() {<Enter>}<Esc>kf(ci)
inoremap ;c {<Enter>}<Esc>ko<Tab>

" Latex accented characters
autocmd Filetype tex inoremap è \`e
autocmd Filetype tex inoremap é \'e
autocmd Filetype tex inoremap ò \`o
autocmd Filetype tex inoremap à \`a
autocmd Filetype tex inoremap ù \`u
autocmd Filetype tex inoremap ì \`\i\
" Latex page interrupt
autocmd Filetype tex inoremap ;<Enter> %% Interruzione di pagina<Enter>\newpage<Enter>
" Latex verbatim
autocmd Filetype tex inoremap ;v \verb\|\|<Esc>i

" C++ main
autocmd Filetype cpp inoremap ;m int main(int argc, char *argv[]) {<Enter><Enter><Tab>return 0;<Enter><Esc><<i}<Esc>kkko<Tab>
" ;g generates the C++ header guard
autocmd Filetype c,h,hpp,cc,cpp map ;g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun

" Java printline
autocmd Filetype java inoremap ;p System.out.println();<Esc>hci) 
" Java exception
autocmd Filetype java inoremap ;e try {<Enter><Enter>} catch (Exception e) {<Enter>System.out.println( e );<Esc>>>o}<Esc><<

