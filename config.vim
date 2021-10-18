" Vim plug
call plug#begin()

" Eye-candy plugins
Plug 'challenger-deep-theme/vim' " Colorscheme
Plug 'itchyny/lightline.vim'     " Stylish statusline
Plug 'folke/todo-comments.nvim'  " Highlight and search for todo comments

" Visual feedback
Plug 'markonm/hlyank.vim'                  " Highlight yanked text
Plug 'ntpeters/vim-better-whitespace'      " Traling whitespaces
Plug 'lukas-reineke/indent-blankline.nvim' " Indenting guidelines
Plug 'mhinz/vim-signify'                   " In-editor git diffs

" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'          " Fuzzy finder
Plug 'tpope/vim-vinegar'         " Netwr enchancer

" Autocompletion
Plug 'SirVer/ultisnips'                    " Snippets engine
Plug 'neovim/nvim-lspconfig'               " Nvim LSP configurations
Plug 'williamboman/nvim-lsp-installer'     " Nvim LSP installation
Plug 'nvim-treesitter/nvim-treesitter'     " Improved syntax highlight

Plug 'hrsh7th/nvim-cmp'                    " Nvim completion engine
Plug 'hrsh7th/cmp-path'                    " Path completion source for paths
Plug 'hrsh7th/cmp-buffer'                  " Buffer completion source for paths
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
lua << EOF
require'todo-comments'.setup {
    signs = false, -- show icons in the signs column
    -- keywords recognized as todo comments
    keywords = {
        FIXME  = { icon = "? ", color = "error", alt = { "BUG",  "ISSUE" } },
        TODO   = { icon = "? ", color = "info" },
        HACK   = { icon = "? ", color = "warning" },
        WARN   = { icon = "? ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF   = { icon = "? ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE   = { icon = "? ", color = "hint", alt = { "INFO" } },
    },
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "bg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*]], -- pattern used for highlightng (vim regex)
        comments_only = true, -- this applies the pattern only inside comments using `commentstring` option
    },
    -- list of named colors where we try to extract the guifg from the
    -- list of hilight groups or use the hex color if hl not found as a fallback
    colors = {
        error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
        warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
        info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
        hint = { "LspDiagnosticsDefaultHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
    }
}
EOF

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

lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    completion = {
        keyword_length = 2,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
      { name = 'buffer' },
      { name = 'path' },
    }
  })
EOF

lua << EOF
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    -- Lua LSP
    --    if server == "lua" then
    --        require'lspconfig'[server].setup{
    --            settings = {
    --                Lua = {
    --                    diagnostics = {
    --                        -- Get the language server to recognize the "ngx" global
    --                        globals = {'ngx'},
    --                    }
    --                }
    --            }
    --        }
    --    else
    --        require'lspconfig'[server].setup{}
    --    end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "python", "lua" }, -- one of "all", "language", or a list of languages
  highlight = {
    enable = true           -- false will disable the whole extension
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    update_in_insert = false,
  }
)
EOF

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

nnoremap <C-p>      :GFiles<CR>
nnoremap <Leader>fs :Rg<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fl :BLines<CR>

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

" Markdown :make command
" Requirements install pandoc application
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  set ft=markdown
autocmd Filetype markdown set makeprg=pandoc\ %\ --pdf-engine=pdflatex\ -f\ gfm\ -o\ %.pdf

" Run current python file
autocmd Filetype python map <F2> :!python3 %<CR>

" Run current lua file
autocmd Filetype lua map <F2> :!lua %<CR>
