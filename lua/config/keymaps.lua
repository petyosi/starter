-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<Tab>", ">>", {})
vim.keymap.set("n", "<S-Tab>", "<<", {})
vim.keymap.set("n", "<A-w>", "<cmd>wa<CR>", { silent = true })
vim.keymap.set("n", "<Leader>w", "<cmd>wa<CR>", { silent = true })

vim.keymap.set("n", "<Leader>f", function()
  require("lazyvim.util").format({ force = true })
end, { silent = false })
