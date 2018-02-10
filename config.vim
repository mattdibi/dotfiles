" Vundle config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'liuchengxu/space-vim-dark'
Plugin 'joereynolds/vim-minisnip'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Colorscheme
colorscheme space-vim-dark
set termguicolors

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
set breakindent       " Wrap lines without changing the amount of indent. VIM 8 only!
set autoindent        " Auto indentation. To paste use paste mode: :set paste
set wrap              " Wrap long lines
set shiftwidth=4      " Use indents of 4 spaces
set expandtab         " Tabs are spaces, not tabs
set tabstop=4         " An indentation every four columns
set nojoinspaces      " Prevents inserting two spaces after punctuation on a join (J)
set splitright        " Puts new vsplit windows to the right of the current
set splitbelow        " Puts new split windows to the bottom of the current

"Remember folds
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent loadview
augroup END

" Function row mode toggle hotkeys

" F3: Toggle list char
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
nnoremap <F3> :set list!<CR>

" F4: Switch between source and header file
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" F5: Toggle paste mode
set pastetoggle=<F5>

" F8: Toggle tagbar
nmap <F8> :TagbarToggle<CR>

" <C-n>: Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" C++
" ;g generates the C++ header guard
autocmd Filetype c,h,hpp,cc,cpp map ;g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun

" Latex :make command
autocmd Filetype tex set makeprg=pdflatex\ %\ \-file\-line\-error\ \-interaction=nonstopmode
autocmd Filetype tex set errorformat=%f:%l:\ %m
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
