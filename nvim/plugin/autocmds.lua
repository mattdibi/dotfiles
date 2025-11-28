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
vim.api.nvim_create_autocmd("TermOpen", {
    command = "DisableWhitespace",
    group = terminal_group,
})


-- Add LSP shortcut only when LSP attaches to the buffer
local lspattachgroup = vim.api.nvim_create_augroup('lspattachgroup', {})
vim.api.nvim_create_autocmd('LspAttach', {
    group = lspattachgroup,
    callback = function(e)
    local opts = { buffer = e.buf }

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader><C-k>", function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)

    vim.keymap.set("n", "<leader>af", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>ar", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>=", function() vim.lsp.buf.format() end, opts)
    end
})
