return {
    "mattdibi/incolla.nvim",
    config = function()
        require("incolla").setup {
            defaults = {
                prompt_filename = true
            },
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
    end
}
