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

-- Latex tweaks
local latex_group = vim.api.nvim_create_augroup('LatexAutogroup', { clear = true })
vim.api.nvim_create_autocmd( "Filetype", {
    pattern = {"tex"},
    command = [[inoremap è \`e]],
    group = latex_group
})
vim.api.nvim_create_autocmd( "Filetype", {
    pattern = {"tex"},
    command = [[inoremap é \'e]],
    group = latex_group
})
vim.api.nvim_create_autocmd( "Filetype", {
    pattern = {"tex"},
    command = [[inoremap ò \`o]],
    group = latex_group
})
vim.api.nvim_create_autocmd( "Filetype", {
    pattern = {"tex"},
    command = [[inoremap à \`a]],
    group = latex_group
})
vim.api.nvim_create_autocmd( "Filetype", {
    pattern = {"tex"},
    command = [[inoremap ù \`u]],
    group = latex_group
})
vim.api.nvim_create_autocmd( "Filetype", {
    pattern = {"tex"},
    command = [[inoremap ì \`\i\]],
    group = latex_group
})

vim.api.nvim_create_autocmd( "Filetype", {
    pattern = {"tex"},
    command = [[set makeprg=pdflatex\ %\ -file-line-error\ -interaction=nonstopmode]],
    group = latex_group
})
