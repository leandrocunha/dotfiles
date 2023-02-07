-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'dracula/vim', as = 'dracula' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'neovim/nvim-lspconfig'

  use 'williamboman/mason.nvim'

  use 'williamboman/mason-lspconfig.nvim'

  use { 'lewis6991/gitsigns.nvim', tag = 'release' }

  -- code completition
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)
