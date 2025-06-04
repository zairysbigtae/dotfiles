return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
  },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  -- {
  --   "saadparwaiz1/cmp_luasnip",
  --   config = function()
  --     require("cmp").setup({
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       sources = {
  --         { name = "luasnip" },
  --       },
  --     })
  --   end,
  -- },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer", "vimls", "zls", "clangd" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Common on_attach function to be used with all servers
      local on_attach = function(client, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
      end

      -- Setup for each LSP server
      -- lspconfig.rust_analyzer.setup({
      --   on_attach = on_attach,
      --   cmd = { vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer" },
      -- })
      lspconfig.vimls.setup({ on_attach = on_attach })
      lspconfig.zls.setup({ on_attach = on_attach })
      lspconfig.clangd.setup({ on_attach = on_attach })
      lspconfig.pyright.setup({ on_attach = on_attach })
    end,
  },
}
