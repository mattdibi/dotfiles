" References
" https://github.com/nanotee/nvim-lua-guide
" https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

" Vim plug
call plug#begin()

" Eye-candy plugins
Plug 'challenger-deep-theme/vim'           " Colorscheme
Plug 'itchyny/lightline.vim'               " Stylish statusline
Plug 'folke/todo-comments.nvim'            " Highlight and search for todo comments

" Visual feedback
Plug 'markonm/hlyank.vim'                  " Highlight yanked text
Plug 'ntpeters/vim-better-whitespace'      " Traling whitespaces
Plug 'lukas-reineke/indent-blankline.nvim' " Indenting guidelines
Plug 'mhinz/vim-signify'                   " In-editor git diffs

" Navigation
Plug 'nvim-lua/plenary.nvim'               " Telescope utilities
Plug 'nvim-telescope/telescope.nvim'       " Fuzzy finder
Plug 'tpope/vim-vinegar'                   " Netwr enchancer

" Autocompletion
Plug 'SirVer/ultisnips'                    " Snippets engine
Plug 'neovim/nvim-lspconfig'               " Nvim LSP configurations
Plug 'williamboman/nvim-lsp-installer'     " Nvim LSP installation
Plug 'nvim-treesitter/nvim-treesitter'     " Improved syntax highlight

Plug 'hrsh7th/nvim-cmp'                    " Nvim completion engine
Plug 'hrsh7th/cmp-path'                    " Path completion source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'                  " Buffer completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'                " LSP completion source for nvim-cmp
Plug 'quangnguyen30192/cmp-nvim-ultisnips' " Ultisnips completion source for nvim-cmp

" Basics
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Initialize plugin system
call plug#end()

" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

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
set undodir=~/.config/nvim/undodir " Undo history directory

set autoread          " Autoload file changes. You can undo by pressing u.
set wildmenu          " Visual autocomplete for command menu
set laststatus=2      " Always diplay status bar
set noshowmode        " Don't show current vim mode
set updatetime=250    " Update time 250ms

set backspace=indent,eol,start " Backspace through lines

" Search
set ignorecase         " The case of normal letters is ignored.
set smartcase          " Ignore case when the pattern contains lowercase letters only.
set incsearch          " Start searching before pressing enter
set nows               " Once hitting the search bottom it stops instead of restarting from the first match
set nohlsearch         " Disable highlight search
set inccommand=nosplit " Shows the effects of a command incrementally, as you type.

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

" Highlight syntax inside Markdown
let g:markdown_fenced_languages = ['sh', 'python', 'bash', 'yaml']

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

" Smart terminal navigation
tnoremap <Esc> <C-\><C-n>
" Send <Esc> to the underlying program in terminal mode
" mnemonic: verbatim esc
tnoremap <C-v><Esc> <Esc>
" Open terminal in split
command! -nargs=* Sterm split | terminal <args>
command! -nargs=* Vterm vsplit | terminal <args>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN CONFIGURATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" todo-comments configuration
lua require("todo-comments-configuration")

" Indent-blankline configuration
if &diff
    let g:indent_blankline_enabled = v:false
endif

let g:indent_blankline_char = '▏'
let g:indent_blankline_filetype_exclude = [
    \ 'help', 'text', 'yaml'
    \]
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_show_trailing_blankline_indent = v:false

" LSP configuration
nnoremap <leader>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>gD    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader><c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gw    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <leader>af    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>ee    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>ar    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>=     <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>ai    <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <leader>ao    <cmd>lua vim.lsp.buf.outgoing_calls()<CR>

vnoremap <leader>= <esc><cmd>lua vim.lsp.buf.range_formatting()<cr>

" Compe configuration
set completeopt+=menuone,noselect
set completeopt-=preview

lua require("cmp-configuration")

" LSP configuration
lua require("lsp-configuration")

" Telescope configuration
nnoremap <C-p>      <cmd>lua require('telescope-configuration').project_files()<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>

lua require("telescope-configuration")

" Signify configuration
let g:signify_sign_change = '~'
highlight link SignifySignAdd             DiffAdd
highlight link SignifySignChange          DiffChange
highlight link SignifySignDelete          DiffDelete
highlight link SignifySignDeleteFirstLine SignifySignDelete

" Ultisnips configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/custom_snippets/']
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jump to alternate C++ file
command A  e  %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,
command AV vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,

" Jump to the last position when ropening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" C++ :make command
autocmd Filetype c,h,hpp,cc,cpp setl makeprg=make\ \-C\ build/
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

" Run current lua file
autocmd Filetype lua map <F2> :!lua %<CR>