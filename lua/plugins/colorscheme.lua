return {
  { "sainnhe/everforest" },
  { "sainnhe/sonokai" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "moon",
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      transparent_background = true,
      devicons = true,
      filter = "pro",
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
        flavour = "auto",
        transparent_background = true,
        term_colors = false,
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          neotree = true,
          telescope = true,
          notify = true,
          mini = true,
          flash = true,
          mason = true,
          noice = true,
          which_key = true,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      },
    },
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      opts = {
        transparent_mode = true,
        contrast = "hard",
      },
    },
    {
      "folke/tokyonight.nvim",
      lazy = true,
      opts = { style = "night", transparent = true },
    },
  },
}
