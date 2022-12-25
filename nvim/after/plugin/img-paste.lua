-- img-paste plugin
local img_paste_group = vim.api.nvim_create_augroup('ImgPaste', { clear = true })

vim.api.nvim_create_autocmd( "FileType", {
    pattern = {"markdown", "tex"},
    group = img_paste_group,
    callback = function()
        if vim.bo.filetype == 'tex' then
            vim.g.PasteImageFunction = 'g:LatexPasteImage'
        else -- 'markdown'
            vim.g.PasteImageFunction = 'g:MarkdownPasteImage'
        end

        vim.api.nvim_set_keymap('n', '<leader>xp', ':call mdip#MarkdownClipboardImage()<CR>', { noremap = true })
    end,
})

vim.g.mdip_imgdir = 'imgs'
