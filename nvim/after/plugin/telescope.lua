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
local M = {}

M.project_files = function()
    local opts = {
        -- define here if you want to define something
        file_ignore_patterns = ignore_patterns
    }
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then require'telescope.builtin'.find_files(opts) end
end

return M
