-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Space>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Space>e", ":lua MiniFiles.open()<CR>")
vim.keymap.set("n", "T", ":lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "ca", ":lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<Space>a", "<cmd>AerialToggle!<CR>")
