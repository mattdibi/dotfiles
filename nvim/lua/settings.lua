HOME = os.getenv("HOME")

-- Common
vim.opt.showcmd     = true   -- Show typed commands
vim.opt.showmatch   = true   -- Show matching parenthesis
vim.opt.cmdheight   = 1      -- Command line height
vim.opt.cursorline  = true   -- Highlight current line

vim.opt.autoread    = true   -- Autoload file changes. You can undo by pressing u.
vim.opt.wildmenu    = true   -- Visual autocomplete for command menu
vim.opt.laststatus  = 2      -- Always diplay status bar
vim.opt.showmode    = false  -- Don't show current vim mode
vim.opt.updatetime  = 250    -- Update time 250ms

vim.opt.backspace   = "indent,eol,start" -- backspace works on every char in insert mode
vim.opt.termguicolors = true -- Enable 24-bit RGB colors

vim.opt.mouse       = "" -- disable mouse

-- Sidebar
vim.opt.number      = true   -- Line number on the left
vim.opt.signcolumn  = 'yes'  -- Keep 1 column for info
vim.opt.relativenumber = true   -- Show relative line numbers for improved vertical motion

-- Backup files
vim.opt.swapfile    = false  -- Do not create swap files
vim.opt.undofile    = true   -- Create undofiles
vim.opt.undodir     = HOME .. '/.config/nvim/undodir//'     -- undo files

-- Search
vim.opt.ignorecase  = true   -- The case of normal letters is ignored.
vim.opt.smartcase   = true   -- Ignore case when the pattern contains lowercase letters only.
vim.opt.incsearch   = true   -- Start searching before pressing enter
vim.opt.wrapscan    = false  -- Once hitting the search bottom it stops instead of restarting from the first match
vim.opt.hlsearch    = false  -- Disable highlight search
vim.opt.inccommand  = 'nosplit' -- Shows the effects of a command incrementally, as you type.

-- Formatting
vim.opt.breakindent = true   -- Wrap lines without changing the amount of indent. VIM 8 only!
vim.opt.autoindent  = true   -- Auto indentation. To paste use paste mode: :set paste
vim.opt.wrap        = true   -- Wrap long lines
vim.opt.shiftwidth  = 4      -- Use indents of 4 spaces
vim.opt.expandtab   = true   -- Tabs are spaces, not tabs
vim.opt.tabstop     = 4      -- An indentation every four columns
vim.opt.joinspaces  = false  -- Prevents inserting two spaces after punctuation on a join (J)
vim.opt.splitright  = true   -- Puts new vsplit windows to the right of the current
vim.opt.splitbelow  = true   -- Puts new split windows to the bottom of the current

-- Markdown
vim.g.markdown_fenced_languages = {'bash', 'python', 'sh', 'java', 'xml'}
