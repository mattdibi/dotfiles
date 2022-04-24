-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    completion = {
        keyword_length = 2,
    },
    mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
    },
    sources = {
        { name = 'buffer',    max_item_count =  5 , keyword_length = 4 },
        { name = 'path',      max_item_count =  5 },
    }
})

