return {
  {
    "folke/flash.nvim",
    vscode = true,
    ---@type Flash.Config
    opts = {
      search = {
        mode = "fuzzy",
      },
      modes = {
        search = {
          enabled = true,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "S", mode = {"n", "x", "o"}, false},
      -- { "s", mode = {"n", "x", "o"}, false},
    },
  },
  {
    "tpope/vim-surround",
    lazy = false,
    vscode = true,
  },
  {
    "nvim-mini/mini.surround",
    enabled = false,
  },
}
