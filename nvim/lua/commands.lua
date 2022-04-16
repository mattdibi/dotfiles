-- Terminal commands
vim.api.nvim_create_user_command('Sterm', 'split | terminal', { nargs = 0 })
vim.api.nvim_create_user_command('Vterm', 'vsplit | terminal', { nargs = 0 })
