-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  vim.cmd('colorscheme rose-pine')

  -- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use('nvim-treesitter/playground')

  use('nvim-lua/plenary.nvim')

  use('ThePrimeagen/harpoon')

  use('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }

  }

  --  use ('github/copilot.vim')

  use({
    "olimorris/codecompanion.nvim",
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "qwen2"
          },
          inline = {
            adapter = "qwen2"
          }
        },
        adapters = {
          qwen2 = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "qwen2:0.5b",
              schema = {
                model = {
                  default = "qwen2:0.5b",
                },
                num_ctx = {
                  default = 8096,
                },
                num_predict = {
                  default = -1,
                },
              },
            })
          end
        }
      })
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }
  })
end)
