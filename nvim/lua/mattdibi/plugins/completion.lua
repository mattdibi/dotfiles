return {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
        "SirVer/ultisnips",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "quangnguyen30192/cmp-nvim-ultisnips",
    },
    config = function()
        local cmp = require('cmp')
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

        vim.g.UltiSnipsExpandTrigger = '<tab>'
        vim.g.UltiSnipsJumpForwardTrigger='<tab>'
        vim.g.UltiSnipsJumpBackwardTrigger='<s-tab>'
        vim.g.UltiSnipsSnippetDirectories={ os.getenv("HOME") ..'/.config/nvim/lua/mattdibi/snippets/'}
        vim.g.UltiSnipsEditSplit='vertical'
    end,
}
