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

  -- LSP
  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'SirVer/ultisnips'},
          {'quangnguyen30192/cmp-nvim-ultisnips'},
      }
  }

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
