-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<Tab>", ">>", {})
vim.keymap.set("n", "<S-Tab>", "<<", {})
vim.keymap.set("n", "<A-w>", "<cmd>wa<CR>", { silent = true })
vim.keymap.set("n", "<A-p>", "<cmd>ToggleTerm<CR>", { silent = false })
vim.keymap.set("n", "<Leader>w", "<cmd>wa<CR>", { silent = true })

vim.keymap.set("n", "<Leader>f", function()
  require("lazyvim.util").format({ force = true })
end, { silent = false })

vim.keymap.set("n", "<Leader>zf", function()
  require("zen-mode").toggle({ window = { width = 0.7 } }) -- width will be 85% of the editor width }
end, { silent = false })

vim.keymap.set("n", "<A-.>", vim.lsp.buf.code_action)
vim.keymap.set("n", "<A-/>", function()
  vim.lsp.buf.code_action({
    context = {
      only = {
        "source",
      },
      diagnostics = {},
    },
  })
end)

vim.keymap.del("n", "<A-k>")
