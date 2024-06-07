-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- colorscheme
  -- use({ "dracula/vim", as = "dracula" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("Mofiqul/dracula.nvim")

  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- lsp
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("lewis6991/gitsigns.nvim")
  use("nvimtools/none-ls.nvim")

  -- code completition
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lua")

  -- autopairs and autotag
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  -- buffers
  use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

  -- identline
  use("lukas-reineke/indent-blankline.nvim")
  use("tpope/vim-sleuth")

  -- relative numbers
  use({ "sitiom/nvim-numbertoggle" })

  -- comment
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })

  -- vs-tasks
  use({
    "EthanJWright/vs-tasks.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  })

  -- vim-terraform
  use("hashivim/vim-terraform")

  -- Terminals
  use({ "akinsho/toggleterm.nvim", tag = "*" })
  use("voldikss/vim-floaterm")

  -- Git-Blame-Line
  use("kessejones/git-blame-line.nvim")
end)
