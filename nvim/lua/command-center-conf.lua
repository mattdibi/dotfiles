local command_center = require("command_center")
local noremap = {noremap = true}
local silent_noremap = {noremap = true, silent = true}

command_center.add({
  {
    description = "Open command center",
    cmd = "<CMD>Telescope command_center<CR>",
    keybindings = { "n", "<leader>fc", noremap },
  },  {
    description = "Find project files",
    cmd = "<CMD>lua require('telescope-conf').project_files()<CR>",
    keybindings = { "n", "<C-p>", noremap },
  },  {
    description = "Find inside current buffer",
    cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
    keybindings = { "n", "<leader>fl", noremap },
  },  {
    description = "Find files",
    cmd = "<CMD>Telescope find_files<CR>",
    keybindings = { "n", "<leader>ff", noremap },
  }, {
    description = "Find hidden files",
    cmd = "<CMD>Telescope find_files hidden=true<CR>",
  }, {
    description = "Find buffers",
    cmd = "<CMD>Telescope buffers<CR>",
    keybindings = { "n", "<leader>fb", noremap },
  }, {
    description = "Find help",
    cmd = "<CMD>Telescope help_tags<CR>",
    keybindings = { "n", "<leader>fh", noremap },
  }
})
