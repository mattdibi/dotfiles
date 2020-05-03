" Vundle config
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Eye-candy plugins
Plugin 'challenger-deep-theme/vim' " Colorscheme
Plugin 'itchyny/lightline.vim'     " Stylish statusline
Plugin 'markonm/traces.vim'        " Range, pattern and substitute preview (requires 8.0.1206+)
Plugin 'mbbill/undotree'           " Visualizes undo history
if has('nvim') || has('patch-8.0.902')
  Plugin 'mhinz/vim-signify'       " In-editor git diffs
else
  Plugin 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" Navigation
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'chrisbra/matchit'          " Improved % matching
Plugin 'tpope/vim-vinegar'         " Netwr enchancer
Plugin 'tpope/vim-projectionist'   " Project navigation

" Autocompletion
Plugin 'valloric/youcompleteme'    " Code autocompletion
Plugin 'SirVer/ultisnips'          " Snippets engine

" Basics
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'rhysd/vim-clang-format'

call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme
if has('nvim') || has('termguicolors')
  set termguicolors
endif

" Challenger deep
colorscheme challenger_deep
let g:lightline = { 'colorscheme': 'challenger_deep'}

" Common
syntax enable
set noswapfile        " Do not create swap files
set number            " Display line numbers
set relativenumber    " Line numbers are relative to current line
set showcmd           " Show typed commands
set showmatch         " Show matching parenthesis
set cmdheight=1       " Command line height
set cursorline        " Highlight current line

set undofile          " Maintain undo history between sessions
set undodir=~/.vim/undodir " Undo history directory

set autoread          " Autoload file changes. You can undo by pressing u.
set wildmenu          " Visual autocomplete for command menu
set laststatus=2      " Always diplay status bar
set noshowmode        " Don't show current vim mode
set updatetime=250    " Update time 250ms

set backspace=indent,eol,start " Backspace through lines

" Gvim
set guioptions -=m    " Removes menubar
set guioptions -=T    " Removes toolbar
set guioptions -=r    " Removes scrollbar
set guioptions -=L    " Removes left scrollbar
set mouse=            " Disable mouse entirely

" Search
set ignorecase        " The case of normal letters is ignored.
set smartcase         " Ignore case when the pattern contains lowercase letters only.
set incsearch         " Start searching before pressing enter
set nows              " Once hitting the search bottom it stops instead of restarting from the first match

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN CONFIGURATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FZF configuration
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

if has('nvim') || has('patch-8.2.191')
    let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
endif

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! MGFiles call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --cached --others', 'options': fzf#vim#with_preview().options}))

" Signify configuration
let g:signify_sign_change = '~'
highlight link SignifySignAdd             DiffAdd
highlight link SignifySignChange          DiffChange
highlight link SignifySignDelete          DiffDelete
highlight link SignifySignDeleteFirstLine SignifySignDelete

" Undotree configuration
nnoremap <leader>u  :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_HighlightChangedWithSign = 0

" YCM configuration
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_goto_buffer_command = 'split'

nnoremap <leader>g  :botright vertical YcmCompleter GoTo<CR>
nnoremap <leader>gd :botright vertical YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t  :botright vertical YcmCompleter GetType<CR>
nnoremap <leader>d  :botright vertical YcmCompleter GetDoc<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>r  :YcmForceCompileAndDiagnostics<CR>

" Ultisnips configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/custom_snippets/']
let g:UltiSnipsEditSplit="vertical"

" Clang-format configuration
let g:clang_format#code_style = "google"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jump to the last position when ropening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" C++
" ;g generates the C++ header guard
autocmd Filetype c,h,hpp,cc,cpp map ;g :call IncludeGuard()<CR>
function! IncludeGuard()
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

" Run current python file
autocmd Filetype python map <F2> :!python3 %<CR>
