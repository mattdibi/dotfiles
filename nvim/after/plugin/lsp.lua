-- Reference: https://github.com/ThePrimeagen/init.lua/blob/master/after/plugin/lsp.lua
local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Installed servers depend on installed machine
local machine = os.getenv("MACHINE")

local servers
if(machine == "workstation") then
    servers = { 'clangd' , 'jedi_language_server', 'sumneko_lua'}
else
    servers = { 'clangd' , 'pyright', 'rust_analyzer', 'sumneko_lua'}
end

lsp.ensure_installed(servers)

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

--- CMP configuration
local cmp = require('cmp')
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
lsp.setup_nvim_cmp({
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
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end,
          { "i", "s" }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s" }
        ),
    },
    sources = {
        { name = 'nvim_lsp',  max_item_count = 10 },
        { name = 'ultisnips', max_item_count =  5 },
        { name = 'buffer',    max_item_count =  5 , keyword_length = 4 },
        { name = 'path',      max_item_count =  5 },
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '✖',
        warn = '⚠',
        hint = '➤',
        info = 'ℹ'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("i", "<leader><C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>af", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>ar", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>=", vim.lsp.buf.formatting, opts)
  vim.keymap.set("v", "<leader>=", vim.lsp.buf.range_formatting, opts)
end)

lsp.setup()

lsp.nvim_workspace()

vim.diagnostic.config({
    virtual_text = true,
})

