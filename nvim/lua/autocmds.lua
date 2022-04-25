-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({higroup="Visual"})
    end,
    group = highlight_group,
    pattern = '*',
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        -- Go to the last known cursor position
        local lastline = vim.fn.line('\'"')
        local filetype = vim.bo.filetype:match("commit")
        if lastline >= 1 and lastline <= vim.fn.line("$") and filetype ~= "commit" then
            vim.cmd("normal " .. lastline .. "gg")
        end
    end,
})

-- Fix text highligh for Jenkinsfiles
vim.api.nvim_create_autocmd( "BufEnter", {
    pattern = {"Jenkinsfile"},
    command = "set filetype=groovy"
})

-- Terminal visual tweaks
local terminal_group = vim.api.nvim_create_augroup("terminal_job", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    command = "startinsert",
    group = terminal_group,
})
vim.api.nvim_create_autocmd("TermOpen", {
    command = "setlocal listchars= nonumber norelativenumber",
    group = terminal_group,
})

