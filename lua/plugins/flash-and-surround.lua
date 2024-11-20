return {
  {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
      search = {
        mode = "fuzzy",
      },
    },
    -- stylua: ignore
    keys = {
      { "S", mode = {"n", "x", "o"}, false},
    },
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "echasnovski/mini.surround",
    enabled = false,
  },
}
