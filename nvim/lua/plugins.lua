-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Eye-candy plugins
  use 'challenger-deep-theme/vim'

  -- Basics
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-commentary'
end)
