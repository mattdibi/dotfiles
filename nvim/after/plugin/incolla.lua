require("incolla").setup {
    markdown = {
        affix = "![](%s)",
    },
    tex = {
        affix = "%s"
    }
}

vim.api.nvim_set_keymap('n', '<leader>xp', '', {
    noremap = true,
    callback = function()
        require'incolla'.incolla()
    end,
})
