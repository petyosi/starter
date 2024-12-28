return {
  {
    "saghen/blink.cmp",
    enabled = true,
    opts = {
      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "accept", "fallback" },
      },
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
}
