-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "mattdibi.plugins",
    change_detection = { notify = false }
})

-- return require('packer').startup(function()
--   -- Autocompletion
--   use 'SirVer/ultisnips'
--   use 'hrsh7th/nvim-cmp'
--   use 'hrsh7th/cmp-path'
--   use 'hrsh7th/cmp-buffer'
--   use 'hrsh7th/cmp-nvim-lua'
--   use 'quangnguyen30192/cmp-nvim-ultisnips'
--   use 'github/copilot.vim'

--   use 'williamboman/mason.nvim'
--   use 'williamboman/mason-lspconfig.nvim'
--   use 'neovim/nvim-lspconfig'
--   use 'hrsh7th/cmp-nvim-lsp'

-- end)
