return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
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
      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer" },
      })
      lspconfig.vimls.setup({ on_attach = on_attach })
      lspconfig.zls.setup({ on_attach = on_attach })
      lspconfig.clangd.setup({ on_attach = on_attach })
      lspconfig.pyright.setup({ on_attach = on_attach })
    end,
  },
}
