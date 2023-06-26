return {
  -- add gruvbox
  { "sainnhe/everforest" },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      transparent_background = true,
      devicons = true,
      filter = "spectrum",
      background_clear = {
        -- "float_win",
        "toggleterm",
        "telescope",
        "which-key",
        "renamer",
        "neo-tree",
      },
    },
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, opts = {
    transparent_mode = true,
  } },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
