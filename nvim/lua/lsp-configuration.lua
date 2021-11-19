-- LSP installer and LSP built-in client configuration
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    -- Lua LSP
    --    if server == "lua" then
    --        require'lspconfig'[server].setup{
    --            settings = {
    --                Lua = {
    --                    diagnostics = {
    --                        -- Get the language server to recognize the "ngx" global
    --                        globals = {'ngx'},
    --                    }
    --                }
    --            }
    --        }
    --    else
    --        require'lspconfig'[server].setup{}
    --    end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "python", "lua" }, -- one of "all", "language", or a list of languages
  highlight = {
    enable = true           -- false will disable the whole extension
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    update_in_insert = false,
  }
)
