-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    completion = {
        keyword_length = 2,
    },
    sources = {
        { name = 'nvim_lsp',  max_item_count = 10 },
        { name = 'ultisnips', max_item_count =  5 , keyword_length = 1 },
        { name = 'buffer',    max_item_count =  5 , keyword_length = 4 },
        { name = 'path',      max_item_count =  5 },
    }
})
