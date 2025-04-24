return {
  {
    "saghen/blink.cmp",
    version = "1.*",
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
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },
    },
  },
}
