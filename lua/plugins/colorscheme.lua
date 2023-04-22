return {
  -- add gruvbox
  { "sainnhe/everforest" },
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
