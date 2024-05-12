return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "SirVer/ultisnips",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },
    config = function()
        -- Based on: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter
        local signs = { Error = "✖ ", Warn = "⚠", Hint = "➤", Info = "ℹ" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- Mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        local opts = { noremap=true, silent=true }
        vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader><C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>=', '<esc><cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
        end

        -- Use a loop to conveniently call 'setup' on multiple servers and
        -- map buffer local keybindings when the language server attaches
        --
        -- For reference see:
        --  https://github.com/SmiteshP/Dotfiles/blob/master/.config/nvim/lua/config/lsp.lua
        --  https://github.com/williamboman/nvim-lsp-installer

        local machine = os.getenv("MACHINE")

        local servers
        if(machine == "workstation") then
            servers = { 'clangd' , 'jedi_language_server'}
        else
            servers = { 'clangd' , 'pyright', 'rust_analyzer', 'lua_ls'}
        end

        -- nvim-cmp configuration
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Mason setup taken from: https://github.com/VonHeikemen/lsp-zero.nvim#you-might-not-need-lsp-zero
        require('mason').setup()

        require('mason-lspconfig').setup({
            ensure_installed = servers
        })

        local lspconfig = require('lspconfig')
        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
        })

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

        vim.g.UltiSnipsExpandTrigger = '<tab>'
        vim.g.UltiSnipsJumpForwardTrigger='<tab>'
        vim.g.UltiSnipsJumpBackwardTrigger='<s-tab>'
        vim.g.UltiSnipsSnippetDirectories={ os.getenv("HOME") ..'/.config/nvim/custom_snippets/'}
        vim.g.UltiSnipsEditSplit='vertical'
    end
}
