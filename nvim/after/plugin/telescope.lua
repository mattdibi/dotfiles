-- Telescope configuration
local actions = require('telescope.actions')

local ignore_patterns = {
    "%.png",
    "%.jpg",
    "%.jpeg"
}

require('telescope').setup{
defaults = {
    -- Set prompt position to top
    layout_config = {
        prompt_position = "top",
    },
    sorting_strategy = "ascending",
    -- Let esc close Telescope
    mappings = {
        i = {
            ["<esc>"] = actions.close
            },
        },
    }
}

-- project_files(): falling back to find_files if git_files can't find a .git directory
project_files = function()
    local opts = {
        -- define here if you want to define something
        file_ignore_patterns = ignore_patterns
    }
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then require'telescope.builtin'.find_files(opts) end
end

vim.api.nvim_set_keymap('n', '<C-p>', '<CMD>lua project_files()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><C-p>', '<CMD>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fl', '<CMD>Telescope current_buffer_fuzzy_find<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', { noremap = true })
