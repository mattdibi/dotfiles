return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
        { 'j-hui/fidget.nvim', opts = {} },
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

        local lspconfig = require("lspconfig")
        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup {}
                end,

                ['lua_ls'] = function()
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                    telemetry = { enable = false },
                                    library = {
                                        "${3rd}/love2d/library"
                                    }
                                }
                            }
                        },
                    }
                end,
            },
        })
    end
}
