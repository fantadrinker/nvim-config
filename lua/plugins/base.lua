return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate"
  },
  {
    'nvim-lua/plenary.nvim'
  },
  {
    'tpope/vim-fugitive'
  },
  -- lsp config
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },

  -- we might need mason later on, but I want to try how far we can make without it.
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
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
    }
  },
  { 
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  }
}

