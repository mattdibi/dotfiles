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
    mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
    },
    sources = {
        { name = 'nvim_lsp',  max_item_count = 10 },
        { name = 'ultisnips', max_item_count =  5 },
        { name = 'buffer',    max_item_count =  5 , keyword_length = 4 },
        { name = 'path',      max_item_count =  5 },
        { name = 'nvim_lua',  max_item_count =  5 },
    }
})

