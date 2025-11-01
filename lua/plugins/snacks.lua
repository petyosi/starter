return {
  "folke/snacks.nvim",
  -- stylua: ignore
  keys = {
    { "<leader>p", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { "<leader>o", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<A-j>", function() Snacks.explorer() end, desc = "Open explorer" },
  },
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          win = {
            list = {
              keys = {
                ["o"] = "confirm",
              },
            },
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<C-q>"] = { "<C-\\><C-n>", mode = "i", expr = true },
          },
        },
      },
    },
  },
}
