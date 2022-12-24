local command_center = require("command_center")
local noremap = {noremap = true}

command_center.add({
    -- Command palette
    {
        description = "[Comm] Open command center",
        cmd = "<CMD>Telescope command_center<CR>",
        keybindings = { "n", "π", noremap }, -- Alt+P on Mac
    },  {
    -- Telescope finders
        description = "[Find] Find project files",
        cmd = "<CMD>lua project_files()<CR>",
        keybindings = { "n", "<C-p>", noremap },
    },  {
        description = "[Find] Find inside current buffer",
        cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
        keybindings = { "n", "<leader>fl", noremap },
    }, {
        description = "[Find] Live grep",
        cmd = "<CMD>Telescope live_grep<CR>",
        keybindings = { "n", "<leader><C-p>", noremap },
    }, {
        description = "[Find] Find hidden files",
        cmd = "<CMD>Telescope find_files hidden=true<CR>",
    }, {
        description = "[Find] Find help",
        cmd = "<CMD>Telescope help_tags<CR>",
        keybindings = { "n", "<leader>fh", noremap },
    }, {
    -- LSP
        description = "[LSP] Get LSP log",
        cmd = "<CMD>lua vim.cmd('e'..vim.lsp.get_log_path())<CR>",
    }, {
        description = "[LSP] Get signature help",
        cmd = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
        keybindings = { "n", '<leader><C-k>', noremap },
        mode = command_center.mode.ADD_ONLY,
    }, {
        description = "[LSP] Goto declaration",
        cmd = '<cmd>lua vim.lsp.buf.declaration()<CR>',
        keybindings = { "n", '<leader>gD', noremap },
        mode = command_center.mode.ADD_ONLY,
    }, {
        description = "[LSP] Goto definition",
        cmd = '<cmd>lua vim.lsp.buf.definition()<CR>',
        keybindings = { "n", '<leader>gd', noremap },
        mode = command_center.mode.ADD_ONLY,
    }, {
        description = "[LSP] Goto implementation",
        cmd = '<cmd>lua vim.lsp.buf.implementation()<CR>',
        keybindings = { "n", '<leader>gi', noremap },
        mode = command_center.mode.ADD_ONLY,
    }, {
        description = "[LSP] Get type definition",
        cmd = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
        keybindings = { "n", '<leader>gt', noremap },
        mode = command_center.mode.ADD_ONLY,
    }, {
        description = "[LSP] Get references",
        cmd = '<cmd>lua vim.lsp.buf.references()<CR>',
        keybindings = { "n", '<leader>gr', noremap },
        mode = command_center.mode.ADD_ONLY,
    }, {
        description = "[LSP] Execute code action",
        cmd = '<cmd>lua vim.lsp.buf.code_action()<CR>',
        keybindings = { "n", '<leader>af', noremap },
        mode = command_center.mode.ADD_ONLY,
    }, {
        description = "[LSP] Execute rename",
        cmd = '<cmd>lua vim.lsp.buf.rename()<CR>',
        keybindings = { "n", '<leader>ar', noremap },
        mode = command_center.mode.ADD_ONLY,
    }, {
    -- Functions
        description = "[Space] Strip trailing whitespaces",
        cmd = "<CMD>StripWhitespace<CR>",
    }, {
    -- Functions
        description = "[Undo] Undotree",
        cmd = "<CMD>UndotreeToggle<CR>",
        keybindings = { "n", '<leader>u', noremap }
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
      separator = "  │  ",
      auto_replace_desc_with_cmd = false,
    }
  }
}

telescope.load_extension('command_center')
