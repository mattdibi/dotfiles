-- img-paste plugin
vim.cmd [[
    autocmd FileType markdown nmap <buffer><silent> <leader>xp :call mdip#MarkdownClipboardImage()<CR>
]]

vim.g.mdip_imgdir = 'imgs'
