-- Telescope configuration
local actions = require('telescope.actions')

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

-- Add command center extension
require("telescope").load_extension('command_center')

-- project_files(): falling back to find_files if git_files can't find a .git directory
local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return M
