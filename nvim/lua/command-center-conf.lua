local command_center = require("command_center")
local noremap = {noremap = true}

command_center.add({
    -- Command palette
    {
        description = "Open command center",
        cmd = "<CMD>Telescope command_center<CR>",
        keybindings = { "n", "<leader>fc", noremap },
    },  {
    -- Telescope finders
        description = "Find project files",
        cmd = "<CMD>lua require('telescope-conf').project_files()<CR>",
        keybindings = { "n", "<C-p>", noremap },
    },  {
        description = "Find inside current buffer",
        cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
        keybindings = { "n", "<leader>fl", noremap },
    }, {
        description = "Find hidden files",
        cmd = "<CMD>Telescope find_files hidden=true<CR>",
    }, {
        description = "Find help",
        cmd = "<CMD>Telescope help_tags<CR>",
        keybindings = { "n", "<leader>fh", noremap },
    }, {
    -- Functions
        description = "Strip trailing whitespaces",
        cmd = "<CMD>StripWhitespace<CR>",
    }
})
