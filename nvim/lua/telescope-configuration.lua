local actions = require('telescope.actions')

require('telescope').setup{
defaults = {
    layout_config = {
        prompt_position = "top",
    },
    sorting_strategy = "ascending",
    mappings = {
        i = {
            ["<esc>"] = actions.close
            },
        },
    }
}

-- Falling back to find_files if git_files can't find a .git directory
local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return M
