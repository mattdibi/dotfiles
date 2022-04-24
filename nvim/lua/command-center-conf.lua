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
        description = "Find string in project",
        cmd = "<CMD>Telescope live_grep<CR>",
        keybindings = { "n", "<leader>fg", noremap },
    }, {
        description = "Find hidden files",
        cmd = "<CMD>Telescope find_files hidden=true<CR>",
    }, {
        description = "Find help",
        cmd = "<CMD>Telescope help_tags<CR>",
        keybindings = { "n", "<leader>fh", noremap },
    }, {
    -- LSP
        description = "Get LSP log",
        cmd = "<CMD>lua vim.cmd('e'..vim.lsp.get_log_path())<CR>",
    }, {
    -- Functions
        description = "Strip trailing whitespaces",
        cmd = "<CMD>StripWhitespace<CR>",
    }
})

-- Command center Telescope integration
local telescope = require("telescope")

telescope.setup {
  extensions = {
    command_center = {
      components = {
        command_center.component.DESCRIPTION,
        command_center.component.KEYBINDINGS,
        -- command_center.component.COMMAND,
      },
      seperator = "  │  ",
      auto_replace_desc_with_cmd = false,
    }
  }
}

telescope.load_extension('command_center')
