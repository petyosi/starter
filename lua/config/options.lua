-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

local function add(value, str, sep)
  sep = sep or ","
  str = str or ""
  value = type(value) == "table" and table.concat(value, sep) or value
  return str ~= "" and table.concat({ value, str }, sep) or value
end

vim.o.diffopt = add({
  "vertical",
  "iwhite",
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
