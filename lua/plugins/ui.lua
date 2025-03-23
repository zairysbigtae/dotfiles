return {
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
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        theme = "all",
        undercurl = true,
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
  { "folke/noice.nvim", enabled = false },
  { "nvimdev/dashboard-nvim", enabled = false },
}
