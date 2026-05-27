return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "echasnovski/mini.statusline", opts = {} },
  { "lewis6991/gitsigns.nvim", opts = {} },

  "EdenEast/nightfox.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    init = function()
      -- Load nvim-tree early if Neovim starts without a file
      if vim.fn.argc() == 0 then
        vim.api.nvim_create_autocmd("VimEnter", {
          callback = function()
            require("nvim-tree.api").tree.open()
          end,
        })
      end
    end,
  },  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate | TSInstallAll",
    opts = function()
      return require "plugins.configs.treesitter"
    end,
  },

  {
    "akinsho/bufferline.nvim",
    opts = require "plugins.configs.bufferline",
  },

  -- we use blink plugin only when in insert mode
  -- so lets lazyload it at InsertEnter event
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",

      -- snippets engine
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },

      -- autopairs , autocompletes ()[] etc
      { "windwp/nvim-autopairs", opts = {} },
    },
    -- made opts a function cuz cmp config calls cmp module
    -- and we lazyloaded cmp so we dont want that file to be read on startup!
    opts = function()
      return require "plugins.configs.blink"
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = require "plugins.configs.conform",
  },

  {
    "nvimdev/indentmini.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      char="",
    },
  },

  -- files finder etc
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require "plugins.configs.telescope",
  },

  {
    "vague-theme/vague.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
      })
      vim.cmd("colorscheme vague")
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,       -- load on startup
    priority = 1000,    -- make sure it loads before other colorschemes
    config = function()
      require("rose-pine").setup({
        dark_variant = "main",  -- options: "main", "moon", "dawn"
        bold_vert_split = false,
        dim_nc_background = true,
        disable_background = false,
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
  { "catppuccin/nvim", 
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        flavour = "moocha", -- latte, frappe, macchiato, mocha
      })
      vim.cmd("colorscheme catppuccin-nvim")
    end,

  },
}
