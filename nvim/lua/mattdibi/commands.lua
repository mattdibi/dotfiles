-- Terminal commands
vim.api.nvim_create_user_command('Sterm', 'split | terminal', {})
vim.api.nvim_create_user_command('Vterm', 'vsplit | terminal', {})

-- Jump to alternate C++ file
vim.api.nvim_create_user_command('A', 'e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,', {})
vim.api.nvim_create_user_command('AV', 'vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,', {})
