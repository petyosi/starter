local Util = require("lazyvim.util")

return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    init = function()
      vim.keymap.set("n", "<A-l>", "<cmd>0G<cr>", { silent = true })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    enabled = false,
  },
  {
    "sindrets/diffview.nvim",
    enabled = true,
  },
}
