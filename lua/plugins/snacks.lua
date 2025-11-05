return {
  "folke/snacks.nvim",
  -- stylua: ignore
  keys = {
    { "<leader>p", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { "<leader>o", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<A-j>", function() Snacks.explorer() end, desc = "Open explorer" },
    { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
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
