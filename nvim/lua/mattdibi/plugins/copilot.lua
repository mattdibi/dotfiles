return {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Disable Copilot for all filetypes by default
      vim.g.copilot_enabled = false;
    end
}
