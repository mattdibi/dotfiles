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

  -- Navigation
  use {
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" }
  }
  use 'tpope/vim-vinegar'
  use {
      "gfeiyou/command-center.nvim",
      requires = { "nvim-telescope/telescope.nvim" }
  }

  -- Basics
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
end)
