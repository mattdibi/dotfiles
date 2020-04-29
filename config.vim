" Vundle config
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Eye-candy plugins
Plugin 'challenger-deep-theme/vim' " Colorscheme
Plugin 'markonm/traces.vim'        " Range, pattern and substitute preview (requires 8.0.1206+)
Plugin 'mbbill/undotree'           " Visualizes undo history
if has('nvim') || has('patch-8.0.902')
  Plugin 'mhinz/vim-signify'       " In-editor git diffs
else
  Plugin 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" Navigation
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
" => STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function: display errors from Youcompleteme in statusline
function! YCMErrors() abort
    if !exists(':Ycm*')
        return ''
    endif
    let l:errors = youcompleteme#GetErrorCount()
    return l:errors == 0 ? '' : printf(
        \ '  E:%d ',
        \ l:errors
        \)
endfunction

" Function: display warnings from Youcompleteme in statusline
function! YCMWarnings() abort
    if !exists(':Ycm*')
        return ''
    endif
    let l:warnings = youcompleteme#GetWarningCount()
    return l:warnings == 0 ? '' : printf(
        \ '  W:%d ',
        \ l:warnings
        \)
endfunction

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Visual#       " Color
set statusline+=\ %F
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=%#Error#        " Color
set statusline+=%{YCMErrors()}
set statusline+=%#WarningMsg#   " Color
set statusline+=%{YCMWarnings()}
set statusline+=%#CursorColumn# " Color
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ 
set statusline+=%#CursorIM#
set statusline+=\ %-4l\/%-4L:%3c\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN CONFIGURATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
