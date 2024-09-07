local map = vim.api.nvim_set_keymap

-- <Space> and \ are now leader keys, this way
-- something will pop up in the showcmd corner.
map('', '<Space>', '<leader>', {})

-- Center screen after half page jump
map('n', '<C-u>', '<C-u>zz', { noremap = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Center screen after search jump
map('n', 'n', 'nzz', { noremap = true })
map('n', 'N', 'Nzz', { noremap = true })

-- Smart resize
map('n', '<Up>',    ':resize +5<CR>', { noremap = true })
map('n', '<Down>',  ':resize -5<CR>', { noremap = true })
map('n', '<Left>',  ':vertical resize -5<CR>', { noremap = true })
map('n', '<Right>', ':vertical resize +5<CR>', { noremap = true })

-- Copy into system clipboard
map('n', '<leader>y', '\"+y', { noremap = true })
map('v', '<leader>y', '\"+y', { noremap = true })

-- Visual shifting (does not exit Visual mode)
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })

-- Smart terminal navigation
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
-- Send <Esc> to the underlying program in terminal mode
-- mnemonic: verbatim esc
map('t', '<C-v><Esc>', '<Esc>', { noremap = true })

-- F3: Toggle list char
vim.opt.listchars = {
  eol = '¬',
  tab = '>·',
  extends = '>',
  precedes = '<',
  trail = '~'
}
map('n', '<F3>', ':set list!<CR>', { noremap = true })
