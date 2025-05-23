-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.opt.linebreak = true
vim.o.background = "dark"

local function add(value, str, sep)
  sep = sep or ","
  str = str or ""
  value = type(value) == "table" and table.concat(value, sep) or value
  return str ~= "" and table.concat({ value, str }, sep) or value
end

vim.o.diffopt = add({
  "vertical",
  "hiddenoff",
  "foldcolumn:0",
  "context:4",
  "algorithm:histogram",
  "indent-heuristic",
}, vim.o.diffopt)

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".env.*",
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.config",
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.json",
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})

vim.g.sonokai_transparent_background = 2
vim.g.sonokai_style = "espresso"

vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_eslint_auto_format = true
