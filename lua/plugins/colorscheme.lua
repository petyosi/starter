return {
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
    {
      "catppuccin/nvim",
      name = "catppuccin",
      opts = {
        flavour = "frappe",
        transparent_background = true,
        term_colors = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          neotree = true,
          telescope = true,
          notify = true,
          mini = true,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      },
    },
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      opts = {
        transparent_mode = true,
        contrast = "soft",
      },
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin",
      },
    },
  },
}
