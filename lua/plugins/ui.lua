return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    config = function()
      require('telescope').setup()
    end,
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("snacks").setup()
    end,
  },
  {
    "echasnovski/mini.files",
    config = function()
      require("mini.files").setup({})
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "codedark",
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ensure nvim-web-devicons is available
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "slant",
          diagnostics = "nvim_lsp",
        },
      })
    end,
  },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     require("kanagawa").setup({
  --       theme = "all",
  --       undercurl = true,
  --     })
  --     vim.cmd("colorscheme kanagawa")
  --   end,
  -- },
  -- {
  --   "sainnhe/everforest",
  --   config = function()
  --     vim.cmd("colorscheme everforest")
  --     vim.g.everforest_background = "hard"
  --     vim.g.everforest_enable_italic = 1
  --   end,
  -- },
  {
    "catppuccin/nvim",
    flavour = "latte",
    background = {
      light = "latte",
      dark = "macchiato",
    },
  },
  { "folke/noice.nvim", enabled = false },
  { "nvimdev/dashboard-nvim", enabled = false },
}
