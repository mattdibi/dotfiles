local map = vim.api.nvim_set_keymap

-- This mapping makes Y work from the cursor to the end of line
-- (which is more logical, but not Vi-compatible).
map('', 'Y', 'y$', {})

-- Smart way to move between windows
map('', '<C-j>', '<C-W>j', {})
map('', '<C-k>', '<C-W>k', {})
map('', '<C-h>', '<C-W>h', {})
map('', '<C-l>', '<C-W>l', {})

-- Smart resize
map('n', '<Up>',    ':resize +5<CR>', { noremap = true })
map('n', '<Down>',  ':resize -5<CR>', { noremap = true })
map('n', '<Left>',  ':vertical resize -5<CR>', { noremap = true })
map('n', '<Right>', ':vertical resize +5<CR>', { noremap = true })

-- Visual shifting (does not exit Visual mode)
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

-- Smart terminal navigation
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
-- Send <Esc> to the underlying program in terminal mode
-- mnemonic: verbatim esc
map('t', '<C-v><Esc>', '<Esc>', { noremap = true })
