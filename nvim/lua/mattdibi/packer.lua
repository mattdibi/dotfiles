-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Eye-candy plugins
  use 'challenger-deep-theme/vim'
  use 'nvim-lualine/lualine.nvim'

  -- Visual feedback
  use 'ntpeters/vim-better-whitespace'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'mbbill/undotree'

  -- Markdown
  use 'mattdibi/incolla.nvim'

  -- Autocompletion
  use 'mfussenegger/nvim-jdtls'
  use 'j-hui/fidget.nvim'
  use 'mfussenegger/nvim-dap'

  use 'SirVer/ultisnips'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Navigation
  use {
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" }
  }
  use 'tpope/vim-vinegar'

  -- Basics
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
end)
