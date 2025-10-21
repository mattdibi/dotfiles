-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({higroup="Visual"})
    end,
    group = highlight_group,
    pattern = '*',
})

-- Fix text highligh for Jenkinsfiles
vim.api.nvim_create_autocmd( "BufEnter", {
    pattern = {"Jenkinsfile"},
    command = "set filetype=groovy"
})
